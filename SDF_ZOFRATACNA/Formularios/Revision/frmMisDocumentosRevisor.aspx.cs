using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Revision
{
    public partial class frmMisDocumentosRevisor : System.Web.UI.Page
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

            if (Session["Nombres"] != null && lblNombreUsuario != null)
            {
                lblNombreUsuario.Text = Session["Nombres"].ToString();
            }

            if (Session["Rol"] != null && lblRolUsuario != null)
            {
                lblRolUsuario.Text = Session["Rol"].ToString();
            }

            if (Session["UrlFoto"] != null && !string.IsNullOrEmpty(Session["UrlFoto"].ToString()) && imgPerfil != null)
            {
                imgPerfil.ImageUrl = Session["UrlFoto"].ToString();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Filtros aplicados (simulación).');</script>");
        }

        protected void btnRevisar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string idDocumento = btn.CommandArgument;
            Response.Redirect($"~/Formularios/Revision/frmInterfazRevisor.aspx?id={idDocumento}");
        }

        protected void btnCargarMas_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Cargando más documentos (simulación).');</script>");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}