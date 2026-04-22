using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmDashboardFirmante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatosUsuario();
                CargarEstadisticas();
            }
        }

        private void CargarDatosUsuario()
        {
            try
            {
                string nombreUsuario = Session["Nombres"]?.ToString() ?? "Usuario Demo";
                string rolUsuario = Session["Rol"]?.ToString() ?? "Firmante / Revisor";
                string urlFoto = Session["UrlFoto"]?.ToString() ?? "https://ui-avatars.com/api/?background=001e40&color=fff&name=" + Uri.EscapeDataString(nombreUsuario);

                // Asignar a los controles que existen en el .aspx
                if (lblNombreUsuario != null) lblNombreUsuario.Text = nombreUsuario;
                if (lblRolUsuario != null) lblRolUsuario.Text = rolUsuario;
                if (lblNombreTop != null) lblNombreTop.Text = nombreUsuario;

                if (imgPerfil != null) imgPerfil.ImageUrl = urlFoto;
                if (imgPerfilTop != null) imgPerfilTop.ImageUrl = urlFoto;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error cargando usuario: " + ex.Message);
            }
        }

        private void CargarEstadisticas()
        {
            // Asignar valores a los labels del dashboard
            if (lblPorFirmar != null) lblPorFirmar.Text = "4";
            if (lblPorRevisar != null) lblPorRevisar.Text = "12";
            if (lblFirmadosHoy != null) lblFirmadosHoy.Text = "8";
            if (lblRevisadosHoy != null) lblRevisadosHoy.Text = "6";
        }

        // Eventos de los botones
        protected void btnFirmarUrgente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmPortalFirma.aspx?id=1");
        }

        protected void btnFirmarNormal_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmPortalFirma.aspx?id=2");
        }

        protected void btnRevisarUrgente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmInterfazRevisor.aspx?id=1");
        }

        protected void btnRevisarNormal_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmInterfazRevisor.aspx?id=2");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}