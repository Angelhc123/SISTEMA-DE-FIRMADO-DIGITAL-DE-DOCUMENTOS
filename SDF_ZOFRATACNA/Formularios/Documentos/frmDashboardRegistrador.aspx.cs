using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// ============================================================
// Nombre del programa  : frmDashboardRegistrador
// Descripción          : Panel de control del usuario Registrador.
//                        Muestra tarjetas resumen con el conteo
//                        de documentos en proceso, observados y
//                        finalizados, con acceso al registro de
//                        nuevos documentos y seguimiento de flujo.
// Fecha desarrollo     : 24/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// Fecha mantenimiento  :
// Persona que lo realizó:
// Nro. solicitud mant. :
// Descripción mant.    :
// ============================================================

namespace SDF_ZOFRATACNA.Formularios.Documentos
{
    public partial class frmDashboardRegistrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Validación de sesión: redirige al login si no está autenticado
            if (Session["IdUsuario"] == null)
            {
                Response.Redirect("~/frmLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarDatosUsuario();
            }
        }

        /// <summary>
        /// Carga los datos del usuario autenticado en los controles de perfil del panel.
        /// </summary>
        private void CargarDatosUsuario()
        {
            // Buscar el Literal del nombre de usuario si existe en el .aspx
            Literal litUsuario = (Literal)FindControl("litUsuario");

            if (litUsuario != null && Session["Nombres"] != null)
            {
                litUsuario.Text = Session["Nombres"].ToString();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Limpiar sesión y redirigir al login
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}