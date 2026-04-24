using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// ============================================================
// Nombre del programa  : frmDashboardRevisor
// Descripción          : Panel de control del usuario Revisor.
//                        Muestra el resumen de revisiones
//                        pendientes y completadas del día,
//                        con acceso rápido a los documentos
//                        urgentes asignados para revisión.
// Fecha desarrollo     : 24/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// Fecha mantenimiento  :
// Persona que lo realizó:
// Nro. solicitud mant. :
// Descripción mant.    :
// ============================================================

namespace SDF_ZOFRATACNA.Formularios.Revision
{
    public partial class frmDashboardRevisor : System.Web.UI.Page
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
            // Búsqueda de controles mediante FindControl (patrón seguro)
            Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
            Label lblRolUsuario    = (Label)FindControl("lblRolUsuario");
            Image imgPerfil        = (Image)FindControl("imgPerfil");
            Image imgAvatar        = (Image)FindControl("imgAvatar");

            // Asignar nombre del usuario (string → llave unificada "Nombres")
            if (Session["Nombres"] != null && lblNombreUsuario != null)
            {
                lblNombreUsuario.Text = Session["Nombres"].ToString();
            }

            // Asignar rol del usuario
            if (Session["Rol"] != null && lblRolUsuario != null)
            {
                lblRolUsuario.Text = Session["Rol"].ToString();
            }

            // Asignar foto de perfil si existe en sesión
            if (Session["UrlFoto"] != null && !string.IsNullOrEmpty(Session["UrlFoto"].ToString()))
            {
                if (imgPerfil  != null) imgPerfil.ImageUrl  = Session["UrlFoto"].ToString();
                if (imgAvatar  != null) imgAvatar.ImageUrl  = Session["UrlFoto"].ToString();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            // TODO: Recargar estadísticas desde la BD
            Response.Write("<script>alert('Datos actualizados (simulación).');</script>");
        }

        protected void btnVerTodosUrgentes_Click(object sender, EventArgs e)
        {
            // Redirigir al listado de documentos del Revisor
            Response.Redirect("~/Formularios/Revision/frmMisDocumentosRevisor.aspx");
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