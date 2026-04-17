using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Revision
{
    public partial class frmArchivoRevisor : System.Web.UI.Page
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

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            // Simulación de filtro
            Response.Write("<script>alert('Filtro aplicado (simulación).');</script>");
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            // Simulación de paginación
            Response.Write("<script>alert('Página anterior (simulación).');</script>");
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            // Simulación de paginación
            Response.Write("<script>alert('Página siguiente (simulación).');</script>");
        }

        protected void btnPagina_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string pagina = btn.CommandArgument;
            Response.Write($"<script>alert('Ir a página {pagina} (simulación).');</script>");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}