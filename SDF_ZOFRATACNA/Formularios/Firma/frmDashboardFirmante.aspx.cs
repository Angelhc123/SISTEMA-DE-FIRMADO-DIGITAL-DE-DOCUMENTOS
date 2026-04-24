using System;
using System.Web.UI;
using System.Web.UI.WebControls;

// ============================================================
// Nombre del programa  : frmDashboardFirmante
// Descripción          : Panel de control del usuario Firmante.
//                        Muestra alertas de documentos urgentes
//                        pendientes de firma y revisión, con
//                        acceso directo al portal de firma.
// Fecha desarrollo     : 24/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// Fecha mantenimiento  :
// Persona que lo realizó:
// Nro. solicitud mant. :
// Descripción mant.    :
// ============================================================

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmDashboardFirmante : System.Web.UI.Page
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
                CargarEstadisticas();
            }
        }

        /// <summary>
        /// Carga los datos del usuario autenticado en los controles del panel.
        /// </summary>
        private void CargarDatosUsuario()
        {
            try
            {
                // Recuperar datos de sesión (string → prefijo str)
                string strNombreUsuario = Session["Nombres"]?.ToString() ?? "Usuario Demo";
                string strRolUsuario    = Session["Rol"]?.ToString() ?? "Firmante";
                string strUrlFoto       = Session["UrlFoto"]?.ToString()
                                          ?? "https://ui-avatars.com/api/?background=001e40&color=fff&name="
                                          + Uri.EscapeDataString(strNombreUsuario);

                // Asignar a los controles del sidebar y del top navbar
                if (lblNombreUsuario != null) lblNombreUsuario.Text = strNombreUsuario;
                if (lblRolUsuario    != null) lblRolUsuario.Text    = strRolUsuario;
                if (lblNombreTop     != null) lblNombreTop.Text     = strNombreUsuario;
                if (imgPerfil        != null) imgPerfil.ImageUrl    = strUrlFoto;
                if (imgPerfilTop     != null) imgPerfilTop.ImageUrl = strUrlFoto;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error cargando usuario en Dashboard Firmante: " + ex.Message);
            }
        }

        /// <summary>
        /// Carga las estadísticas del día en los labels del panel.
        /// TODO: Conectar a SP USP_FIR_Estadisticas_Firmante.
        /// </summary>
        private void CargarEstadisticas()
        {
            // Valores de demostración (en producción consultar BD)
            if (lblPorFirmar    != null) lblPorFirmar.Text    = "4";
            if (lblPorRevisar   != null) lblPorRevisar.Text   = "12";
            if (lblFirmadosHoy  != null) lblFirmadosHoy.Text  = "8";
            if (lblRevisadosHoy != null) lblRevisadosHoy.Text = "6";
        }

        // Navegar al portal de firma con documento urgente (id=1)
        protected void btnFirmarUrgente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmPortalFirma.aspx?id=1");
        }

        // Navegar al portal de firma con documento normal (id=2)
        protected void btnFirmarNormal_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmPortalFirma.aspx?id=2");
        }

        // Navegar al módulo de revisión: documento urgente
        protected void btnRevisarUrgente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Revision/frmInterfazRevisor.aspx?id=1");
        }

        // Navegar al módulo de revisión: documento normal
        protected void btnRevisarNormal_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Revision/frmInterfazRevisor.aspx?id=2");
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