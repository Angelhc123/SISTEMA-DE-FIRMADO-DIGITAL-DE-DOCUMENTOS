// Archivo .cs para frmMisDocumentosRevisor.aspx
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmMisDocumentosRevisor : System.Web.UI.Page
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
            Response.Write("<script>alert('Filtros aplicados (simulación).');</script>");
        }

        protected void btnRevisar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string idDocumento = btn.CommandArgument;
            Response.Redirect($"~/Formularios/Firma/frmInterfazRevisor.aspx?id={idDocumento}");
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