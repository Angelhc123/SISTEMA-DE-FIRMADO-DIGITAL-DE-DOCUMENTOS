using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmArchivoFirmante : System.Web.UI.Page
    {
        private int paginaActual = 1;
        private int registrosPorPagina = 10;
        private int totalRegistros = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Validación de sesión desactivada temporalmente para pruebas
            // if (Session["IdUsuario"] == null)
            // {
            //     Response.Redirect("~/frmLogin.aspx");
            //     return;
            // }

            if (!IsPostBack)
            {
                CargarDatosUsuario();
                CargarGridDocumentos();
            }
        }

        private void CargarDatosUsuario()
        {
            Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
            Image imgPerfil = (Image)FindControl("imgPerfil");

            if (Session["Nombres"] != null && lblNombreUsuario != null)
            {
                lblNombreUsuario.Text = Session["Nombres"].ToString();
            }

            if (Session["UrlFoto"] != null && !string.IsNullOrEmpty(Session["UrlFoto"].ToString()) && imgPerfil != null)
            {
                imgPerfil.ImageUrl = Session["UrlFoto"].ToString();
            }
        }

        private void CargarGridDocumentos()
        {
            GridView gvDocumentos = (GridView)FindControl("gvDocumentos");
            Label lblPaginacionInfo = (Label)FindControl("lblPaginacionInfo");
            LinkButton btnAnterior = (LinkButton)FindControl("btnAnterior");
            LinkButton btnSiguiente = (LinkButton)FindControl("btnSiguiente");

            try
            {
                DataTable dtDemo = new DataTable();
                dtDemo.Columns.Add("IdDocumento", typeof(int));
                dtDemo.Columns.Add("CodigoReferencia", typeof(string));
                dtDemo.Columns.Add("TituloDocumento", typeof(string));
                dtDemo.Columns.Add("FechaFirma", typeof(DateTime));

                dtDemo.Rows.Add(1, "RES-DIR-045-2023", "Resolución de Aprobación de Tarifario Anual ZOFRATACNA", new DateTime(2023, 10, 12));
                dtDemo.Rows.Add(2, "CON-CON-112-2023", "Contrato de Concesión Lote B-4 Sector Industrial", new DateTime(2023, 10, 8));
                dtDemo.Rows.Add(3, "MEM-INT-899-2023", "Memorándum Interno de Designación de Jefatura Temporal", new DateTime(2023, 9, 28));
                dtDemo.Rows.Add(4, "ACT-DIR-012-2023", "Acta de Sesión Ordinaria de Directorio N° 012", new DateTime(2023, 9, 15));

                totalRegistros = dtDemo.Rows.Count;

                if (gvDocumentos != null)
                {
                    gvDocumentos.DataSource = dtDemo;
                    gvDocumentos.DataBind();
                }

                if (lblPaginacionInfo != null)
                {
                    lblPaginacionInfo.Text = $"Mostrando 1 a {totalRegistros} de {totalRegistros} registros";
                }

                if (btnAnterior != null) btnAnterior.Enabled = false;
                if (btnSiguiente != null) btnSiguiente.Enabled = false;
            }
            catch (Exception ex)
            {
                if (lblPaginacionInfo != null)
                {
                    lblPaginacionInfo.Text = "Error: " + ex.Message;
                }
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            CargarGridDocumentos();
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            if (paginaActual > 1)
            {
                paginaActual--;
                CargarGridDocumentos();
            }
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            if ((paginaActual * registrosPorPagina) < totalRegistros)
            {
                paginaActual++;
                CargarGridDocumentos();
            }
        }

        protected void gvDocumentos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Descargar")
            {
                int idDocumento = Convert.ToInt32(e.CommandArgument);
                DescargarDocumento(idDocumento);
            }
        }

        private void DescargarDocumento(int idDocumento)
        {
            try
            {
                string rutaArchivo = Server.MapPath("~/Documentos/Demo/ejemplo.pdf");
                string nombreArchivo = $"Documento_{idDocumento}.pdf";

                if (System.IO.File.Exists(rutaArchivo))
                {
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Disposition", $"attachment; filename={nombreArchivo}");
                    Response.WriteFile(rutaArchivo);
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}