using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// ============================================================
// Nombre del programa  : frmArchivoFirmante
// Descripción          : Formulario de archivo histórico del
//                        Firmante. Lista todos los documentos
//                        que el usuario ya firmó digitalmente,
//                        con opciones de filtrado, paginación
//                        y descarga del PDF firmado.
// Fecha desarrollo     : 24/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// Fecha mantenimiento  :
// Persona que lo realizó:
// Nro. solicitud mant. :
// Descripción mant.    :
// ============================================================

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmArchivoFirmante : System.Web.UI.Page
    {
        // Variables de paginación (int → prefijo int)
        private int intPaginaActual      = 1;
        private int intRegistrosPorPagina = 10;
        private int intTotalRegistros    = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Validación de sesión: redirige al login si no está autenticado
            if (Session["IdUsuario"] == null)
            {
                Response.Redirect("~/frmLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarDatosUsuario();
                CargarGridDocumentos();
            }
        }

        /// <summary>
        /// Carga los datos del usuario autenticado en los controles de perfil.
        /// </summary>
        private void CargarDatosUsuario()
        {
            Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
            Image imgPerfil        = (Image)FindControl("imgPerfil");

            // Asignar nombre del usuario desde sesión
            if (Session["Nombres"] != null && lblNombreUsuario != null)
            {
                lblNombreUsuario.Text = Session["Nombres"].ToString();
            }

            // Asignar foto de perfil si está disponible en sesión
            if (Session["UrlFoto"] != null && !string.IsNullOrEmpty(Session["UrlFoto"].ToString()) && imgPerfil != null)
            {
                imgPerfil.ImageUrl = Session["UrlFoto"].ToString();
            }
        }

        /// <summary>
        /// Carga el GridView con los documentos ya firmados por el usuario.
        /// TODO: Conectar al SP USP_FIR_Documentos_ArchivadosFirmante.
        /// </summary>
        private void CargarGridDocumentos()
        {
            GridView   gvDocumentos     = (GridView)FindControl("gvDocumentos");
            Label      lblPaginacionInfo = (Label)FindControl("lblPaginacionInfo");
            LinkButton btnAnterior       = (LinkButton)FindControl("btnAnterior");
            LinkButton btnSiguiente      = (LinkButton)FindControl("btnSiguiente");

            try
            {
                // Tabla de demostración (dt → DataTable)
                DataTable dtDocumentos = new DataTable();
                dtDocumentos.Columns.Add("IdDocumento",      typeof(int));
                dtDocumentos.Columns.Add("CodigoReferencia", typeof(string));
                dtDocumentos.Columns.Add("TituloDocumento",  typeof(string));
                dtDocumentos.Columns.Add("FechaFirma",       typeof(DateTime));

                // Filas de ejemplo (en producción se reemplazan con datos de BD)
                dtDocumentos.Rows.Add(1, "RES-DIR-045-2023", "Resolución de Aprobación de Tarifario Anual ZOFRATACNA",         new DateTime(2023, 10, 12));
                dtDocumentos.Rows.Add(2, "CON-CON-112-2023", "Contrato de Concesión Lote B-4 Sector Industrial",              new DateTime(2023, 10, 8));
                dtDocumentos.Rows.Add(3, "MEM-INT-899-2023", "Memorándum Interno de Designación de Jefatura Temporal",         new DateTime(2023, 9,  28));
                dtDocumentos.Rows.Add(4, "ACT-DIR-012-2023", "Acta de Sesión Ordinaria de Directorio N° 012",                 new DateTime(2023, 9,  15));

                intTotalRegistros = dtDocumentos.Rows.Count;

                // Enlazar al GridView si existe el control
                if (gvDocumentos != null)
                {
                    gvDocumentos.DataSource = dtDocumentos;
                    gvDocumentos.DataBind();
                }

                // Actualizar información de paginación
                if (lblPaginacionInfo != null)
                {
                    lblPaginacionInfo.Text = $"Mostrando 1 a {intTotalRegistros} de {intTotalRegistros} registros";
                }

                // Deshabilitar botones de paginación (una sola página en demo)
                if (btnAnterior  != null) btnAnterior.Enabled  = false;
                if (btnSiguiente != null) btnSiguiente.Enabled = false;
            }
            catch (Exception ex)
            {
                Label lblPaginacionInfoErr = (Label)FindControl("lblPaginacionInfo");
                if (lblPaginacionInfoErr != null)
                {
                    lblPaginacionInfoErr.Text = "Error al cargar documentos: " + ex.Message;
                }
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            // Recargar el grid con los filtros aplicados
            CargarGridDocumentos();
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            if (intPaginaActual > 1)
            {
                intPaginaActual--;
                CargarGridDocumentos();
            }
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            if ((intPaginaActual * intRegistrosPorPagina) < intTotalRegistros)
            {
                intPaginaActual++;
                CargarGridDocumentos();
            }
        }

        protected void gvDocumentos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Descargar")
            {
                // Obtener el ID del documento (int → prefijo int)
                int intIdDocumento = Convert.ToInt32(e.CommandArgument);
                DescargarDocumento(intIdDocumento);
            }
        }

        /// <summary>
        /// Descarga el PDF del documento firmado desde el servidor.
        /// </summary>
        private void DescargarDocumento(int intIdDocumento)
        {
            try
            {
                // Ruta del archivo en el servidor (string → str)
                string strRutaArchivo  = Server.MapPath("~/Documentos/Demo/ejemplo.pdf");
                string strNombreArchivo = $"Documento_{intIdDocumento}.pdf";

                if (System.IO.File.Exists(strRutaArchivo))
                {
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Disposition", $"attachment; filename={strNombreArchivo}");
                    Response.WriteFile(strRutaArchivo);
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error al descargar: {ex.Message}');</script>");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Limpiar sesión y redirigir al login
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}