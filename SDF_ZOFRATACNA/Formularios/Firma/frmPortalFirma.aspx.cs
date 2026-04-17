using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmPortalFirma : System.Web.UI.Page
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

            if (Session["UrlFoto"] != null && !string.IsNullOrEmpty(Session["UrlFoto"].ToString()) && imgPerfil != null)
            {
                imgPerfil.ImageUrl = Session["UrlFoto"].ToString();
            }
        }

        protected void btnFirmar_Click(object sender, EventArgs e)
        {
            // Simulación de firma exitosa
            Response.Write("<script>alert('Documento firmado exitosamente (simulación).'); window.location='frmMisDocumentosFirmante.aspx';</script>");
        }

        protected void btnDescargarPDF_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Descargando PDF (simulación).');</script>");
        }

        protected void btnObservar_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Observación registrada (simulación).'); window.location='frmMisDocumentosFirmante.aspx';</script>");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}
