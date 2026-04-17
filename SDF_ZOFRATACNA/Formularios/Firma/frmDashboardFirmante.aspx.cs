using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmDashboardFirmante : System.Web.UI.Page
    {
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
            else
            {
                // Valor por defecto si no hay sesión
                if (lblNombreUsuario != null) lblNombreUsuario.Text = "Usuario Prueba";
            }

            if (Session["UrlFoto"] != null && !string.IsNullOrEmpty(Session["UrlFoto"].ToString()) && imgPerfil != null)
            {
                imgPerfil.ImageUrl = Session["UrlFoto"].ToString();
            }
        }

        protected void btnFirmar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmPortalFirma.aspx?id=1");
        }

        protected void btnRevisar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmPortalFirma.aspx?id=1&mode=view");
        }

        protected void btnVerTodos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmMisDocumentosFirmante.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}