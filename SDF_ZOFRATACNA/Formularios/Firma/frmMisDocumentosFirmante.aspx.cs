using SDF_ZOFRATACNA.App_Code.DAL;
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
                // ── QUERY PRINCIPAL ──────────────────────────────────────────
                // Solo documentos en estado 3 (En Firma) donde el firmante tiene
                // estado PENDIENTE. Calcula EsMiTurno con la misma lógica
                // del código original (no existe firmante anterior sin FIRMADO).
                string sql = @"
                    SELECT
                        vd.IDDocumento, vd.Asunto, vd.CodigoDocumento,
                        vd.AreaResponsable, vd.FechaCreacionDoc,
                        vd.IDUsuarioCreador,
                        vd.EstadoDocumento, vd.TipoDocumento,
                        vd.RutaArchivo,
                        f.IDFirmante, f.Orden, f.FechaCreacion AS FechaAsignacion,
                        d.IDEstadoDoc,
                        CAST(CASE WHEN NOT EXISTS (
                            SELECT 1 FROM dbo.FIR_DocumentoFirmante f2
                            INNER JOIN dbo.FIR_Maestro me2 ON me2.IDMaestro = f2.IDEstadoFirma
                            WHERE f2.IDDocumento = f.IDDocumento
                              AND f2.Orden < f.Orden
                              AND me2.Codigo <> 'FIRMADO'
                        ) THEN 1 ELSE 0 END AS BIT) AS EsMiTurno
                    FROM dbo.FIR_DocumentoFirmante f
                    INNER JOIN dbo.FIR_VW_DocumentosPendientes vd ON vd.IDDocumento = f.IDDocumento
                    INNER JOIN dbo.FIR_Documento d ON d.IDDocumento = vd.IDDocumento
                    INNER JOIN dbo.FIR_Maestro me ON me.IDMaestro = f.IDEstadoFirma
                    WHERE f.IDUsuarioFirmante = @IDUsuario
                      AND me.Codigo = 'PENDIENTE'
                      AND d.IDEstadoDoc = 3";

                if (!string.IsNullOrEmpty(filtro))
                {
                    sql += @" AND (vd.Asunto            LIKE @Busqueda
                                OR vd.CodigoDocumento   LIKE @Busqueda
                                OR vd.IDUsuarioCreador  LIKE @Busqueda)";
                }

                sql += " ORDER BY EsMiTurno DESC, f.Orden ASC, vd.FechaCreacionDoc ASC";

                SqlParameter[] pars = {
                    new SqlParameter("@IDUsuario", usuario),
                    new SqlParameter("@Busqueda",  "%" + filtro + "%")
                };

                DataTable dt = ConexionBD.EjecutarConsultaFirmaSQL(sql, pars);

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

                // Firmados hoy: consulta independiente
                if (lblFirmadosHoy != null)
                {
                    string sqlHoy = @"
                        SELECT COUNT(*) FROM dbo.FIR_DocumentoFirmante f
                        INNER JOIN dbo.FIR_Maestro me ON me.IDMaestro = f.IDEstadoFirma
                        WHERE f.IDUsuarioFirmante = @IDUsuario
                          AND me.Codigo = 'FIRMADO'
                          AND CAST(f.FechaModificacion AS DATE) = CAST(GETDATE() AS DATE)";
                    DataTable dtHoy = ConexionBD.EjecutarConsultaFirmaSQL(
                        sqlHoy, new SqlParameter[] { new SqlParameter("@IDUsuario", usuario) });
                    lblFirmadosHoy.Text = dtHoy.Rows.Count > 0 ? dtHoy.Rows[0][0].ToString() : "0";
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
                // ── PASO 0: Obtener el IDDocumento directamente (evita subconsultas ambiguas) ──
                string sqlGetDoc = @"
                    SELECT TOP 1 IDDocumento 
                    FROM dbo.FIR_DocumentoFirmante 
                    WHERE IDFirmante = @IDFirmante";

                DataTable dtDoc = ConexionBD.EjecutarConsultaFirmaSQL(
                    sqlGetDoc,
                    new SqlParameter[] { new SqlParameter("@IDFirmante", idFirmante) });

                if (dtDoc.Rows.Count == 0)
                {
                    MostrarMensaje("No se encontró el registro de firma.");
                    return;
                }

                int idDocumento = Convert.ToInt32(dtDoc.Rows[0]["IDDocumento"]);

                // ── PASO 1: Ejecutar SP de firma ──────────────────────────────
                SqlParameter[] pars = {
                    new SqlParameter("@IDFirmante",          idFirmante),
                    new SqlParameter("@SerieToken",          "DEMO-" + DateTime.Now.Ticks),
                    new SqlParameter("@HuellaCertificado",   "FIRMA-DIGITAL-DEMO"),
                    new SqlParameter("@Observacion",         "Documento firmado digitalmente"),
                    new SqlParameter("@IDUsuarioModificador",usuario),
                    new SqlParameter("@IDEquipo",            equipo)
                };
                ConexionBD.EjecutarAccionFirma("USP_FIR_Documento_Firmar", pars);

                // ── PASO 2: Contar firmantes aún PENDIENTES en ese documento ──
                // Se obtiene el IDMaestro de PENDIENTE una sola vez con TOP 1
                string sqlPendientes = @"
                    SELECT COUNT(*) 
                    FROM dbo.FIR_DocumentoFirmante f
                    INNER JOIN dbo.FIR_Maestro me ON me.IDMaestro = f.IDEstadoFirma
                    WHERE f.IDDocumento = @IDDocumento
                      AND me.Codigo    = 'PENDIENTE'";

                int pendientes = Convert.ToInt32(
                    ConexionBD.EjecutarConsultaFirmaSQL(
                        sqlPendientes,
                        new SqlParameter[] { new SqlParameter("@IDDocumento", idDocumento) }
                    ).Rows[0][0]);

                // ── PASO 3: Si ya no hay pendientes → estado 4 (Completado) ──
                if (pendientes == 0)
                {
                    string sqlCerrar = @"
                        UPDATE dbo.FIR_Documento
                        SET IDEstadoDoc       = 4,
                            FechaModificacion = GETDATE(),
                            IDUsuarioModificador = @User
                        WHERE IDDocumento = @IDDocumento";

                    ConexionBD.EjecutarAccionFirmaSQL(sqlCerrar, new SqlParameter[] {
                        new SqlParameter("@User",        usuario),
                        new SqlParameter("@IDDocumento", idDocumento)
                    });
                }

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