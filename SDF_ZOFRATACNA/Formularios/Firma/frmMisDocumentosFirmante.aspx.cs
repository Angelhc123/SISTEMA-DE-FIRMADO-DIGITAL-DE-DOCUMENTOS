using SDF_ZOFRATACNA.App_Code.DAL;
using SDF_ZOFRATACNA.Models;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmMisDocumentosFirmante : System.Web.UI.Page
    {
        // ──────────────────────────────────────────────────────────────────────
        //  PAGE LOAD
        // ──────────────────────────────────────────────────────────────────────
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

        // ──────────────────────────────────────────────────────────────────────
        //  CARGAR DATOS USUARIO (sidebar + header)
        // ──────────────────────────────────────────────────────────────────────
        private void CargarDatosUsuario()
        {
            try
            {
                string nombre = Session["Nombres"]?.ToString() ?? "Firmante";
                string urlFoto = "https://ui-avatars.com/api/?background=001e40&color=fff&name="
                                 + Uri.EscapeDataString(nombre);

                Label  lblNombreSidebar   = (Label)FindControl("lblNombreSidebar");
                System.Web.UI.WebControls.Image imgPerfilSidebar = 
                    (System.Web.UI.WebControls.Image)FindControl("imgPerfilSidebar");

                if (lblNombreSidebar   != null) lblNombreSidebar.Text     = nombre;
                if (imgPerfilSidebar   != null) imgPerfilSidebar.ImageUrl = urlFoto;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("CargarDatosUsuario: " + ex.Message);
            }
        }

        // ──────────────────────────────────────────────────────────────────────
        //  BUSCAR (AutoPostBack del TextBox)
        // ──────────────────────────────────────────────────────────────────────
        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            CargarDocumentosPendientes();
        }

        // ──────────────────────────────────────────────────────────────────────
        //  CARGAR DOCUMENTOS PENDIENTES
        // ──────────────────────────────────────────────────────────────────────
        private void CargarDocumentosPendientes()
        {
            string usuario = Session["strUsuario"]?.ToString();

            TextBox txtBuscar = (TextBox)FindControl("txtBuscar");
            string filtro = txtBuscar != null ? txtBuscar.Text.Trim() : "";

            try
            {
                DataTable dt = Models.FIR_DocumentoFirmante.ListarPendientesFirma(usuario, filtro);

                // ── ESTADÍSTICAS ─────────────────────────────────────────────
                int total    = dt.Rows.Count;
                int miTurno  = 0;
                foreach (DataRow row in dt.Rows)
                    if (Convert.ToBoolean(row["EsMiTurno"])) miTurno++;

                Label lblPorFirmar  = (Label)FindControl("lblPorFirmar");
                Label lblBadge      = (Label)FindControl("lblBadgeFirmar");
                Label lblMiTurno    = (Label)FindControl("lblMiTurno");
                Label lblFirmadosHoy= (Label)FindControl("lblFirmadosHoy");

                if (lblPorFirmar  != null) lblPorFirmar.Text  = total.ToString();
                if (lblBadge      != null) lblBadge.Text      = total.ToString();
                if (lblMiTurno    != null) lblMiTurno.Text    = miTurno.ToString();

                // Firmados hoy
                if (lblFirmadosHoy != null)
                {
                    int hoy = Models.FIR_DocumentoFirmante.ContarFirmadosHoy(usuario);
                    lblFirmadosHoy.Text = hoy.ToString();
                }

                // ── PANELES ──────────────────────────────────────────────────
                Panel pnlSinDocumentos = (Panel)FindControl("pnlSinDocumentos");
                Panel pnlTabla         = (Panel)FindControl("pnlTabla");
                Repeater rpt           = (Repeater)FindControl("rptDocumentos");

                if (total == 0)
                {
                    if (pnlSinDocumentos != null) pnlSinDocumentos.Visible = true;
                    if (pnlTabla         != null) pnlTabla.Visible         = false;
                }
                else
                {
                    if (pnlSinDocumentos != null) pnlSinDocumentos.Visible = false;
                    if (pnlTabla         != null) pnlTabla.Visible         = true;
                    if (rpt              != null) { rpt.DataSource = dt; rpt.DataBind(); }
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar documentos: " + ex.Message);
            }
        }

        // ──────────────────────────────────────────────────────────────────────
        //  FIRMAR desde el Modal
        // ──────────────────────────────────────────────────────────────────────
        protected void btnFirmarDesdeModal_Click(object sender, EventArgs e)
        {
            HiddenField hfIDFirmante = (HiddenField)FindControl("hfIDFirmante");
            string idStr = hfIDFirmante?.Value ?? "0";

            if (!int.TryParse(idStr, out int idFirmante) || idFirmante == 0)
            {
                MostrarMensaje("No se encontró el documento a firmar.");
                return;
            }

            string usuario = Session["strUsuario"].ToString();
            string equipo  = Request.UserHostAddress ?? "127.0.0.1";

            try
            {
                Models.FIR_DocumentoFirmante.Firmar(
                    idDocumentoFirmante: idFirmante,
                    serieToken: "DEMO-" + DateTime.Now.Ticks,
                    huellaCertificado: "FIRMA-DIGITAL-DEMO",
                    observacion: "Documento firmado digitalmente",
                    idUsuarioModificador: usuario,
                    idEquipo: equipo
                );

                // ── PASO 4: Recargar + mensaje ────────────────────────────────
                CargarDocumentosPendientes();
                MostrarMensaje("✓ Documento firmado correctamente.", false);
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al firmar: " + ex.Message);
            }
        }

        // ──────────────────────────────────────────────────────────────────────
        //  HELPERS
        // ──────────────────────────────────────────────────────────────────────
        private void MostrarMensaje(string texto, bool esError = true)
        {
            Panel pnlMensaje = (Panel)FindControl("pnlMensaje");
            Label lblMensaje  = (Label)FindControl("lblMensaje");
            if (pnlMensaje != null && lblMensaje != null)
            {
                pnlMensaje.Visible = true;
                lblMensaje.Text    = texto;
                pnlMensaje.CssClass = esError
                    ? "mb-6 bg-red-50 border border-red-200 rounded-2xl p-4 text-red-700"
                    : "mb-6 bg-emerald-50 border border-emerald-200 rounded-2xl p-4 text-emerald-700";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}