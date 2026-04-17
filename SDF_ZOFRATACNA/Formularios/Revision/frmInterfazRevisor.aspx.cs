using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Revision
{
    public partial class frmInterfazRevisor : System.Web.UI.Page
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

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            string observaciones = ((TextBox)FindControl("txtObservaciones"))?.Text ?? "";
            Response.Write($"<script>alert('Documento APROBADO. Observaciones: {observaciones} (simulación).'); window.location='frmMisDocumentosRevisor.aspx';</script>");
        }

        protected void btnObservar_Click(object sender, EventArgs e)
        {
            string observaciones = ((TextBox)FindControl("txtObservaciones"))?.Text ?? "";
            Response.Write($"<script>alert('Documento OBSERVADO. Observaciones: {observaciones} (simulación).'); window.location='frmMisDocumentosRevisor.aspx';</script>");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}