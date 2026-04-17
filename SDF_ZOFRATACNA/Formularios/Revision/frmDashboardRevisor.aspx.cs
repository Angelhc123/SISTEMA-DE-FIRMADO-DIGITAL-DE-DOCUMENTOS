using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Revision
{
    public partial class frmDashboardRevisor : System.Web.UI.Page
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
            Label lblRolUsuario = (Label)FindControl("lblRolUsuario");
            Image imgPerfil = (Image)FindControl("imgPerfil");
            Image imgAvatar = (Image)FindControl("imgAvatar");

            if (Session["Nombres"] != null && lblNombreUsuario != null)
            {
                lblNombreUsuario.Text = Session["Nombres"].ToString();
            }

            if (Session["Rol"] != null && lblRolUsuario != null)
            {
                lblRolUsuario.Text = Session["Rol"].ToString();
            }

            if (Session["UrlFoto"] != null && !string.IsNullOrEmpty(Session["UrlFoto"].ToString()))
            {
                if (imgPerfil != null) imgPerfil.ImageUrl = Session["UrlFoto"].ToString();
                if (imgAvatar != null) imgAvatar.ImageUrl = Session["UrlFoto"].ToString();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Datos actualizados (simulación).');</script>");
        }

        protected void btnVerTodosUrgentes_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Revision/frmMisDocumentosRevisor.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}