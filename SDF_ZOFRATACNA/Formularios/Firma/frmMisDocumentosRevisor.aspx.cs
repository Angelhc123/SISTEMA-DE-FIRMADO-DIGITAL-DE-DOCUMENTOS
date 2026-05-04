using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using SDF_ZOFRATACNA.App_Code.DAL;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmMisDocumentosRevisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["strUsuario"] == null)
            {
                Response.Redirect("~/frmLogin.aspx");
                return;
            }

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
                string nombre = Session["Nombres"]?.ToString() ?? "Usuario";
                string rolDesc = Session["Rol"]?.ToString() ?? "Firmante";

                Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
                if (lblNombreUsuario != null) lblNombreUsuario.Text = nombre;

                Label lblRolUsuario = (Label)FindControl("lblRolUsuario");
                if (lblRolUsuario != null) lblRolUsuario.Text = rolDesc;

                Image imgPerfil = (Image)FindControl("imgPerfil");
                if (imgPerfil != null)
                {
                    string urlFoto = Session["UrlFoto"]?.ToString();
                    if (string.IsNullOrEmpty(urlFoto))
                        urlFoto = "https://ui-avatars.com/api/?background=001e40&color=fff&name=" + Uri.EscapeDataString(nombre);
                    imgPerfil.ImageUrl = urlFoto;
                }
            }
            catch { }
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            CargarDocumentosPendientes();
        }

        private void CargarDocumentosPendientes()
        {
            string loginUsuario = Session["strUsuario"]?.ToString();
            
            TextBox txtBuscar = (TextBox)FindControl("txtBuscar");
            string filtroBusqueda = txtBuscar != null ? txtBuscar.Text.Trim() : "";

            try
            {
                DataTable dt = SDF_ZOFRATACNA.Models.FIR_DocumentoFirmante.ListarPendientesRevision(loginUsuario, filtroBusqueda);

                // Estadísticas
                int total = dt.Rows.Count;
                int hoy = 0;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["FechaAsignacion"] != DBNull.Value)
                    {
                        DateTime fecha = Convert.ToDateTime(row["FechaAsignacion"]);
                        if (fecha.Date == DateTime.Today) hoy++;
                    }
                }

                Label lblCountTotal = (Label)FindControl("lblCountTotal");
                if (lblCountTotal != null) lblCountTotal.Text = total.ToString();

                Label lblHoy = (Label)FindControl("lblHoy");
                if (lblHoy != null) lblHoy.Text = hoy.ToString();

                Label lblCountSidebar = (Label)FindControl("lblCountSidebar");
                if (lblCountSidebar != null) lblCountSidebar.Text = total.ToString();

                // Cargar Historial
                Label lblHistorial = (Label)FindControl("lblHistorial");
                if (lblHistorial != null)
                {
                    string sqlHist = "SELECT COUNT(*) FROM FIR_DocumentoFirmante WHERE LoginUsuario = @IDUsuario AND EsAprobado IS NOT NULL";
                    DataTable dtHist = ConexionBD.EjecutarConsultaFirmaSQL(sqlHist, new SqlParameter[] { new SqlParameter("@IDUsuario", loginUsuario) });
                    if (dtHist.Rows.Count > 0) lblHistorial.Text = dtHist.Rows[0][0].ToString();
                }

                Panel pnlSinDocumentos = (Panel)FindControl("pnlSinDocumentos");
                Panel pnlTabla = (Panel)FindControl("pnlTabla");
                Repeater rptDocumentos = (Repeater)FindControl("rptDocumentos");

                if (total == 0)
                {
                    if (pnlSinDocumentos != null) pnlSinDocumentos.Visible = true;
                    if (pnlTabla != null) pnlTabla.Visible = false;
                }
                else
                {
                    if (pnlSinDocumentos != null) pnlSinDocumentos.Visible = false;
                    if (pnlTabla != null) pnlTabla.Visible = true;
                    if (rptDocumentos != null)
                    {
                        rptDocumentos.DataSource = dt;
                        rptDocumentos.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error: " + ex.Message);
            }
        }

        protected void btnGuardarRevision_Click(object sender, EventArgs e)
        {
            string loginUsuario = Session["strUsuario"]?.ToString();
            
            HiddenField hfComentario = (HiddenField)FindControl("hfComentario");
            HiddenField hfDecision = (HiddenField)FindControl("hfDecision");
            HiddenField hfIDFirmante = (HiddenField)FindControl("hfIDFirmante");

            string comentario = hfComentario != null ? hfComentario.Value.Trim() : "";
            string decision = hfDecision != null ? hfDecision.Value.Trim() : "";
            string idStr = hfIDFirmante != null ? hfIDFirmante.Value : "0";

            if (!int.TryParse(idStr, out int idFirmante)) return;

            try
            {
                bool esAprobado = (decision == "APROBADO");
                string idEquipo = Request.UserHostAddress ?? Environment.MachineName;

                SDF_ZOFRATACNA.Models.FIR_DocumentoFirmante.RegistrarRevision(idFirmante, esAprobado, comentario, loginUsuario, idEquipo);

                CargarDocumentosPendientes();
                MostrarMensaje(esAprobado ? "✓ Documento aprobado." : "✓ Observación registrada.", false);
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error: " + ex.Message);
            }
        }

        private void MostrarMensaje(string texto, bool esError = true)
        {
            Panel pnlMensaje = (Panel)FindControl("pnlMensaje");
            Label lblMensaje = (Label)FindControl("lblMensaje");

            if (pnlMensaje != null && lblMensaje != null)
            {
                pnlMensaje.Visible = true;
                lblMensaje.Text = texto;
                pnlMensaje.CssClass = esError ? "mb-6 bg-red-50 border border-red-200 rounded-2xl p-4 text-red-700" : "mb-6 bg-emerald-50 border border-emerald-200 rounded-2xl p-4 text-emerald-700";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}