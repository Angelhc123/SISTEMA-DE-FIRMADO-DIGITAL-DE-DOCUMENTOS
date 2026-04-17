using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Administracion
{
    public partial class frmDashboardAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Validación para evitar caídas en el layout/mockup
                if (Session["strUsuario"] == null)
                {
                    Session["strUsuario"] = "Administrador Zofra";
                }

                // Asignar el nombre del usuario a la barra superior
                litUsuario.Text = Session["strUsuario"].ToString();
                
                lblFecha.Text = DateTime.Now.ToString("dd MMMM yyyy, HH:mm");
                // Aquí cargarías datos reales de BD
                lblTotalDocs.Text = "12,458";
                lblPendientes.Text = "342";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Limpiar la tupla de sesión
            Session.Clear();
            Session.Abandon();

            // Retornar al Login seguro
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}