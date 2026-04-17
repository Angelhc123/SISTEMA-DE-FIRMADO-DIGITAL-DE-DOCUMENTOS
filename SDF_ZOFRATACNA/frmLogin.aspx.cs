using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Recursos
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Opcional: Limpiar mensajes al cargar
            lblMessage.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string rol = ddlRol.SelectedValue;
            string usuario = txtUsername.Text.Trim();
            string clave = txtPassword.Text.Trim();

            // Validación simple de campos vacíos
            if (string.IsNullOrEmpty(rol) || string.IsNullOrEmpty(usuario) || string.IsNullOrEmpty(clave))
            {
                lblMessage.Text = "Por favor, complete todos los campos.";
                lblMessage.Visible = true;
                return;
            }

            // Aquí iría tu lógica de autenticación con BD (ejemplo de redirección)
            switch (rol)
            {
                case "ADMIN":
                    Response.Redirect("/Formularios/Administracion/frmDashboardAdmin.aspx");
                    break;
                case "REG":
                    Response.Redirect("/Formularios/Documentos/frmDashboardRegistrador.aspx");
                    break;
                case "REV":
                    Response.Redirect("/Formularios/Revision/frmDashboardRevisor.aspx");
                    break;
                case "SIG":
                    Response.Redirect("/Formularios/Firma/frmDashboardFirmante.aspx");
                    break;
                default:
                    lblMessage.Text = "Rol no reconocido.";
                    lblMessage.Visible = true;
                    break;
            }
        }
    }
}