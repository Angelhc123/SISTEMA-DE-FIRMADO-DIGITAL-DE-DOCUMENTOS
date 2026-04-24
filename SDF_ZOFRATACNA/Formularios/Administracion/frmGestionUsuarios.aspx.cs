using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// ============================================================
// Nombre del programa  : frmGestionUsuarios
// Descripción          : Formulario de gestión de accesos y roles
//                        de usuarios del sistema SDF. Permite al
//                        Administrador asignar roles, resetear
//                        contraseñas y activar/desactivar cuentas
//                        consultando la vista VW_EmpleadosActivos.
// Fecha desarrollo     : 24/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// Fecha mantenimiento  :
// Persona que lo realizó:
// Nro. solicitud mant. :
// Descripción mant.    :
// ============================================================

namespace SDF_ZOFRATACNA.Formularios.Administracion
{
    public partial class frmGestionUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Compatibilidad mockup: sesión por defecto para navegación fluida
                if (Session["Nombres"] == null)
                {
                    Session["Nombres"] = "Administrador Zofra";
                }

                // Mostrar nombre del usuario autenticado en la interfaz
                litUsuario.Text = Session["Nombres"].ToString();

                // Cargar la lista de usuarios desde la BD
                // En producción: llama al SP o vista VW_EmpleadosActivos mediante la DAL
                CargarListaUsuarios();
            }
        }

        /// <summary>
        /// Carga la lista de usuarios del sistema.
        /// TODO: Conectar al SP USP_FIR_Usuario_Listar o a la vista VW_EmpleadosActivos.
        /// </summary>
        private void CargarListaUsuarios()
        {
            // Lógica de enlace a GridView/ListView (pendiente de implementar con DAL)
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Limpiar sesión y redirigir al login (transversal a todos los formularios)
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }

        protected void btnNewUser_Click(object sender, EventArgs e)
        {
            // TODO: Redirigir al formulario de registro de nuevo usuario o abrir modal
        }

        protected void ddlFiltros_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Captura los filtros seleccionados en los combos (string → prefijo str)
            string strRolSeleccionado    = ddlRoleFilter.SelectedValue;
            string strEstadoSeleccionado = ddlStatusFilter.SelectedValue;

            // Recargar lista con los filtros aplicados
            CargarListaUsuarios();
        }
    }
}