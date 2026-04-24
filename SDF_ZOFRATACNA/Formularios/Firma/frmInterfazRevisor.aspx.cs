using System;
using System.Web.UI;
using System.Web.UI.WebControls;

// ============================================================
// Nombre del programa  : frmInterfazRevisor
// Descripción          : Formulario de revisión de documentos.
//                        Muestra el visor de PDF embebido y un
//                        panel lateral para agregar observaciones
//                        o registrar conformidad sobre el
//                        expediente asignado al Revisor.
// Fecha desarrollo     : 24/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// Fecha mantenimiento  :
// Persona que lo realizó:
// Nro. solicitud mant. :
// Descripción mant.    :
// ============================================================

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmInterfazRevisor : System.Web.UI.Page
    {
        // NO declarar controles aquí — ya existen en el .designer.cs

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
                CargarExpediente();
            }
        }

        /// <summary>
        /// Carga los datos del usuario autenticado en los controles del panel de perfil.
        /// </summary>
        private void CargarDatosUsuario()
        {
            try
            {
                // Recuperar datos de sesión (string → prefijo str)
                string strNombre  = Session["Nombres"]?.ToString() ?? "Revisor Demo";
                string strRol     = Session["Rol"]?.ToString() ?? "Revisor Legal";
                string strUrlFoto = Session["UrlFoto"]?.ToString()
                                    ?? "https://ui-avatars.com/api/?background=001e40&color=fff&name="
                                    + Uri.EscapeDataString(strNombre);

                // Usar FindControl para evitar conflictos con el diseñador
                Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
                Label lblRolUsuario    = (Label)FindControl("lblRolUsuario");
                Label lblNombreTop     = (Label)FindControl("lblNombreTop");
                Image imgPerfil        = (Image)FindControl("imgPerfil");
                Image imgPerfilTop     = (Image)FindControl("imgPerfilTop");

                if (lblNombreUsuario != null) lblNombreUsuario.Text = strNombre;
                if (lblRolUsuario    != null) lblRolUsuario.Text    = strRol;
                if (lblNombreTop     != null) lblNombreTop.Text     = strNombre;
                if (imgPerfil        != null) imgPerfil.ImageUrl    = strUrlFoto;
                if (imgPerfilTop     != null) imgPerfilTop.ImageUrl = strUrlFoto;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error cargando usuario en Interfaz Revisor: " + ex.Message);
            }
        }

        /// <summary>
        /// Carga el número de expediente según el parámetro recibido por QueryString.
        /// </summary>
        private void CargarExpediente()
        {
            // Número de expediente desde QueryString (string → str)
            string strId = Request.QueryString["id"];
            Label lblExpedienteTitulo = (Label)FindControl("lblExpedienteTitulo");

            if (lblExpedienteTitulo != null)
            {
                lblExpedienteTitulo.Text = !string.IsNullOrEmpty(strId)
                    ? $"EXP-2023-{strId.PadLeft(4, '0')}"
                    : "EXP-2023-0892";
            }
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            // Recuperar observaciones del TextBox mediante FindControl
            TextBox txtObservaciones  = (TextBox)FindControl("txtObservaciones");
            string strObservaciones   = (txtObservaciones != null) ? txtObservaciones.Text : "";

            // Script de confirmación y redirección
            string strScript = $@"<script>
                alert('✅ DOCUMENTO APROBADO\n\nObservaciones: {strObservaciones.Replace("'", "\\'")}\n\nEl documento ha sido aprobado correctamente.');
                window.location.href = 'frmMisDocumentosRevisor.aspx';
            </script>";

            Response.Write(strScript);
        }

        protected void btnObservar_Click(object sender, EventArgs e)
        {
            // Recuperar observaciones del TextBox mediante FindControl
            TextBox txtObservaciones = (TextBox)FindControl("txtObservaciones");
            string strObservaciones  = (txtObservaciones != null) ? txtObservaciones.Text : "";

            // Validar que se hayan ingresado observaciones antes de devolver
            if (string.IsNullOrWhiteSpace(strObservaciones))
            {
                Response.Write("<script>alert('⚠️ ADVERTENCIA: Debe ingresar observaciones para devolver el documento.');</script>");
                return;
            }

            string strScript = $@"<script>
                alert('⚠️ DOCUMENTO OBSERVADO\n\nObservaciones: {strObservaciones.Replace("'", "\\'")}\n\nEl documento ha sido devuelto para correcciones.');
                window.location.href = 'frmMisDocumentosRevisor.aspx';
            </script>";

            Response.Write(strScript);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            // Regresar al listado de documentos del Revisor
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