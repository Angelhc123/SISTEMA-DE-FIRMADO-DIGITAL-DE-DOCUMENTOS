using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Administracion
{
    public partial class frmGestionUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Validar la sesión según instructivo (evitar caídas en mockup)
                if (Session["strUsuario"] == null)
                {
                    // Mockup: establecemos una sesión por defecto para navegación fluida
                    Session["strUsuario"] = "Administrador Zofra";
                }

                litUsuario.Text = Session["strUsuario"].ToString();

                // Aquí iría el llamado a BLL/DAL para cargar la tabla desde BD (ej. VW_EmpleadosActivos)
                CargarListaUsuarios();
            }
        }

        private void CargarListaUsuarios()
        {
            // Lógica para enlazar la tabla HTML (idealmente un GridView o ListView) a la base de datos
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Lógica transversal solicitada en el informe_vistas: limpiar sesión y salir
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }

        protected void btnNewUser_Click(object sender, EventArgs e)
        {
            // Lógica para registrar un nuevo usuario (posible redirección a otra vista .aspx o modal)
        }

        protected void ddlFiltros_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Captura los cambios en los combos de Rol o Estado para recargar los datos
            string rolSeleccionado = ddlRoleFilter.SelectedValue;
            string estadoSeleccionado = ddlStatusFilter.SelectedValue;

            CargarListaUsuarios();
        }
    }
}