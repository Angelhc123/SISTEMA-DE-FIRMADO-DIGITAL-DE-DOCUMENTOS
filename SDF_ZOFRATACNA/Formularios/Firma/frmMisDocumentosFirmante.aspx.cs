using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmMisDocumentosFirmante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatosUsuario();
                CargarDocumentosPendientes();
            }
        }

        private void CargarDatosUsuario()
        {
            try
            {
                string nombre = Session["Nombres"]?.ToString() ?? "Carlos Mendoza";
                string rol = Session["Rol"]?.ToString() ?? "Firmante / Revisor";
                string urlFoto = Session["UrlFoto"]?.ToString() ?? "https://ui-avatars.com/api/?background=001e40&color=fff&name=" + Uri.EscapeDataString(nombre);

                // Buscar los controles en la página
                Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
                Label lblRolUsuario = (Label)FindControl("lblRolUsuario");
                Image imgPerfil = (Image)FindControl("imgPerfil");

                // También para el sidebar
                Label Label1 = (Label)FindControl("Label1");
                Image Image1 = (Image)FindControl("Image1");

                if (lblNombreUsuario != null) lblNombreUsuario.Text = nombre;
                if (lblRolUsuario != null) lblRolUsuario.Text = rol;
                if (imgPerfil != null) imgPerfil.ImageUrl = urlFoto;
                if (Label1 != null) Label1.Text = nombre;
                if (Image1 != null) Image1.ImageUrl = urlFoto;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error cargando usuario: " + ex.Message);
            }
        }

        private void CargarDocumentosPendientes()
        {
            // Cargar datos en los labels del resumen
            Label lblPorFirmar = (Label)FindControl("lblPorFirmar");
            Label lblFirmadosHoy = (Label)FindControl("lblFirmadosHoy");
            Label lblDocumentoPrioritario = (Label)FindControl("lblDocumentoPrioritario");
            Label lblDescripcionPrioritario = (Label)FindControl("lblDescripcionPrioritario");

            if (lblPorFirmar != null) lblPorFirmar.Text = "04";
            if (lblFirmadosHoy != null) lblFirmadosHoy.Text = "12";
            if (lblDocumentoPrioritario != null) lblDocumentoPrioritario.Text = "Resolución Directoral N° 145-2023-ZOFRATACNA";
            if (lblDescripcionPrioritario != null) lblDescripcionPrioritario.Text = "Aprobación de la modificación del Plan Operativo Institucional (POI)";
        }

        // ✅ Botón Firmar Prioritario
        protected void btnFirmarPrioritario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmFirmaDigital.aspx?id=145");
        }

        // ✅ Botón Revisar Prioritario (AGREGADO)
        protected void btnRevisarPrioritario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmVerDocumento.aspx?id=145");
        }

        // ✅ Botón Ver Todos (AGREGADO)
        protected void btnVerTodos_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmListaDocumentos.aspx");
        }

        // ✅ Cierre de sesión
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}