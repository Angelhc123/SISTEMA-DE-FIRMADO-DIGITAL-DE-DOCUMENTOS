using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmInterfazRevisor : System.Web.UI.Page
    {
        // NO declarar ningún control aquí - ya existen en el .designer.cs

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatosUsuario();
                CargarExpediente();
            }
        }

        private void CargarDatosUsuario()
        {
            try
            {
                string nombre = Session["Nombres"]?.ToString() ?? "Revisor Demo";
                string rol = Session["Rol"]?.ToString() ?? "Revisor Legal";
                string urlFoto = Session["UrlFoto"]?.ToString() ?? "https://ui-avatars.com/api/?background=001e40&color=fff&name=" + Uri.EscapeDataString(nombre);

                // Usar FindControl para evitar conflictos con el diseñador
                Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
                Label lblRolUsuario = (Label)FindControl("lblRolUsuario");
                Label lblNombreTop = (Label)FindControl("lblNombreTop");
                Image imgPerfil = (Image)FindControl("imgPerfil");
                Image imgPerfilTop = (Image)FindControl("imgPerfilTop");

                if (lblNombreUsuario != null) lblNombreUsuario.Text = nombre;
                if (lblRolUsuario != null) lblRolUsuario.Text = rol;
                if (lblNombreTop != null) lblNombreTop.Text = nombre;
                if (imgPerfil != null) imgPerfil.ImageUrl = urlFoto;
                if (imgPerfilTop != null) imgPerfilTop.ImageUrl = urlFoto;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error cargando usuario: " + ex.Message);
            }
        }

        private void CargarExpediente()
        {
            string id = Request.QueryString["id"];
            Label lblExpedienteTitulo = (Label)FindControl("lblExpedienteTitulo");

            if (lblExpedienteTitulo != null)
            {
                if (!string.IsNullOrEmpty(id))
                {
                    lblExpedienteTitulo.Text = $"EXP-2023-{id.PadLeft(4, '0')}";
                }
                else
                {
                    lblExpedienteTitulo.Text = "EXP-2023-0892";
                }
            }
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            // Obtener el TextBox con FindControl
            TextBox txtObservaciones = (TextBox)FindControl("txtObservaciones");
            string observaciones = (txtObservaciones != null) ? txtObservaciones.Text : "";

            string script = $@"<script>
                alert('✅ DOCUMENTO APROBADO\n\nObservaciones: {observaciones.Replace("'", "\\'")}\n\nEl documento ha sido aprobado correctamente.');
                window.location.href = 'frmMisDocumentosRevisor.aspx';
            </script>";

            Response.Write(script);
        }

        protected void btnObservar_Click(object sender, EventArgs e)
        {
            TextBox txtObservaciones = (TextBox)FindControl("txtObservaciones");
            string observaciones = (txtObservaciones != null) ? txtObservaciones.Text : "";

            if (string.IsNullOrWhiteSpace(observaciones))
            {
                Response.Write("<script>alert('⚠️ ADVERTENCIA: Debe ingresar observaciones para devolver el documento.');</script>");
                return;
            }

            string script = $@"<script>
                alert('⚠️ DOCUMENTO OBSERVADO\n\nObservaciones: {observaciones.Replace("'", "\\'")}\n\nEl documento ha sido devuelto para correcciones.');
                window.location.href = 'frmMisDocumentosRevisor.aspx';
            </script>";

            Response.Write(script);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmMisDocumentosRevisor.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}