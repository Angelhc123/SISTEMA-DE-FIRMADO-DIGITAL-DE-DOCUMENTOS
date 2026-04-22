// Archivo .cs para frmArchivoRevisor.aspx
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmArchivoRevisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatosUsuario();
            }
        }

        private void CargarDatosUsuario()
        {
            try
            {
                string nombreUsuario = Session["Nombres"]?.ToString() ?? "Usuario Demo";
                string urlFoto = Session["UrlFoto"]?.ToString() ?? "https://ui-avatars.com/api/?background=001e40&color=fff&name=" + Uri.EscapeDataString(nombreUsuario);

                Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
                if (lblNombreUsuario != null) lblNombreUsuario.Text = nombreUsuario;

                Image imgPerfil = (Image)FindControl("imgPerfil");
                if (imgPerfil != null) imgPerfil.ImageUrl = urlFoto;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Filtro aplicado (simulación).');</script>");
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Página anterior (simulación).');</script>");
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
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