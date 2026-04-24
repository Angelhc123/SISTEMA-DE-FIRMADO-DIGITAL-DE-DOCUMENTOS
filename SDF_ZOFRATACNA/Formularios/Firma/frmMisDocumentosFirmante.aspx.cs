using System;
using System.Web.UI;
using System.Web.UI.WebControls;

// ============================================================
// Nombre del programa  : frmMisDocumentosFirmante
// Descripción          : Formulario que lista los documentos
//                        pendientes de firma asignados al
//                        usuario Firmante. Muestra el documento
//                        prioritario y permite navegar al
//                        portal de firma digital.
// Fecha desarrollo     : 24/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// Fecha mantenimiento  :
// Persona que lo realizó:
// Nro. solicitud mant. :
// Descripción mant.    :
// ============================================================

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmMisDocumentosFirmante : System.Web.UI.Page
    {
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
                CargarDocumentosPendientes();
            }
        }

        /// <summary>
        /// Carga los datos del usuario autenticado en los controles de perfil.
        /// </summary>
        private void CargarDatosUsuario()
        {
            try
            {
                // Recuperar datos de sesión (string → prefijo str)
                string strNombre  = Session["Nombres"]?.ToString() ?? "Firmante Demo";
                string strRol     = Session["Rol"]?.ToString() ?? "Firmante";
                string strUrlFoto = Session["UrlFoto"]?.ToString()
                                    ?? "https://ui-avatars.com/api/?background=001e40&color=fff&name="
                                    + Uri.EscapeDataString(strNombre);

                // Controles del panel principal (FindControl para compatibilidad con designer)
                Label lblNombreUsuario  = (Label)FindControl("lblNombreUsuario");
                Label lblRolUsuario     = (Label)FindControl("lblRolUsuario");
                Image imgPerfil         = (Image)FindControl("imgPerfil");

                // Controles del sidebar de navegación
                Label lblNombreSidebar  = (Label)FindControl("lblNombreSidebar");
                Image imgPerfilSidebar  = (Image)FindControl("imgPerfilSidebar");

                if (lblNombreUsuario != null)  lblNombreUsuario.Text  = strNombre;
                if (lblRolUsuario    != null)  lblRolUsuario.Text     = strRol;
                if (imgPerfil        != null)  imgPerfil.ImageUrl     = strUrlFoto;
                if (lblNombreSidebar != null)  lblNombreSidebar.Text  = strNombre;
                if (imgPerfilSidebar != null)  imgPerfilSidebar.ImageUrl = strUrlFoto;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error cargando usuario en Mis Documentos Firmante: " + ex.Message);
            }
        }

        /// <summary>
        /// Carga el resumen de documentos pendientes y el documento prioritario.
        /// TODO: Conectar al SP USP_FIR_Documentos_PendientesFirmante.
        /// </summary>
        private void CargarDocumentosPendientes()
        {
            // Buscar controles de estadísticas y del documento prioritario
            Label lblPorFirmar             = (Label)FindControl("lblPorFirmar");
            Label lblFirmadosHoy           = (Label)FindControl("lblFirmadosHoy");
            Label lblDocumentoPrioritario  = (Label)FindControl("lblDocumentoPrioritario");
            Label lblDescripcionPrioritario= (Label)FindControl("lblDescripcionPrioritario");

            // Valores de demostración (en producción consultar BD via DAL)
            if (lblPorFirmar            != null) lblPorFirmar.Text             = "04";
            if (lblFirmadosHoy          != null) lblFirmadosHoy.Text           = "12";
            if (lblDocumentoPrioritario != null) lblDocumentoPrioritario.Text  = "Resolución Directoral N° 145-2023-ZOFRATACNA";
            if (lblDescripcionPrioritario != null) lblDescripcionPrioritario.Text = "Aprobación de la modificación del Plan Operativo Institucional (POI)";
        }

        // Navegar al portal de firma para el documento prioritario
        protected void btnFirmarPrioritario_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmPortalFirma.aspx?id=145");
        }

        // Navegar al portal de firma para previsualizar el documento prioritario
        protected void btnRevisarPrioritario_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmPortalFirma.aspx?id=145&modo=revision");
        }

        // Ver todos los documentos pendientes del firmante
        protected void btnVerTodos_Click(object sender, EventArgs e)
        {
            // Redirige a la misma página recargada (el listado completo está en este formulario)
            Response.Redirect("~/Formularios/Firma/frmMisDocumentosFirmante.aspx");
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