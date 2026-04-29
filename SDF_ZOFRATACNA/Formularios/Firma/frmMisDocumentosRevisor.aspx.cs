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
                string sql = @"
                    SELECT 
                        vd.IDDocumento, vd.Asunto, vd.CodigoDocumento,
                        vd.AreaResponsable, vd.FechaCreacionDoc,
                        vd.IDUsuarioCreador,
                        vd.EstadoDocumento, vd.TipoDocumento,
                        vd.RutaArchivo,
                        f.IDFirmante, f.Orden, f.FechaCreacion AS FechaAsignacion,
                        me.Descripcion AS EstadoFirma
                    FROM dbo.FIR_DocumentoFirmante f
                    INNER JOIN dbo.FIR_VW_DocumentosPendientes vd ON vd.IDDocumento = f.IDDocumento
                    INNER JOIN dbo.FIR_Maestro me ON me.IDMaestro = f.IDEstadoFirma
                    WHERE f.IDUsuarioFirmante = @IDUsuario
                      AND me.Codigo = 'PENDIENTE'
                      AND f.EsAprobado IS NULL";

                if (!string.IsNullOrEmpty(filtroBusqueda))
                {
                    sql += " AND (vd.Asunto LIKE @Busqueda OR vd.CodigoDocumento LIKE @Busqueda OR vd.IDUsuarioCreador LIKE @Busqueda)";
                }

                sql += " ORDER BY f.FechaCreacion DESC";

                SqlParameter[] pars = { 
                    new SqlParameter("@IDUsuario", loginUsuario),
                    new SqlParameter("@Busqueda", "%" + filtroBusqueda + "%")
                };
                
                DataTable dt = ConexionBD.EjecutarConsultaFirmaSQL(sql, pars);

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
                    string sqlHist = "SELECT COUNT(*) FROM FIR_DocumentoFirmante WHERE IDUsuarioFirmante = @IDUsuario AND EsAprobado IS NOT NULL";
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

                // 1. Actualizar Firmante
                string sql = @"
                    UPDATE FIR_DocumentoFirmante
                    SET EsAprobado = @EsAprobado, Comentario = @Comentario,
                        IDUsuarioModificador = @IDUsuario, FechaModificacion = GETDATE()
                    WHERE IDFirmante = @IDFirmante";

                SqlParameter[] p = {
                    new SqlParameter("@EsAprobado", esAprobado),
                    new SqlParameter("@Comentario", (object)comentario ?? DBNull.Value),
                    new SqlParameter("@IDUsuario", loginUsuario),
                    new SqlParameter("@IDFirmante", idFirmante)
                };
                ConexionBD.EjecutarAccionFirmaSQL(sql, p);

                // 2. Auditoría
                string sqlAudit = @"
                    INSERT INTO FIR_DocumentoFirmanteAuditoria
                        (IDFirmante, IDDocumento, IDUsuarioFirmante, Orden, IDRolFirmante, IDEstadoFirma, EsAprobado, Comentario,
                         IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
                    SELECT IDFirmante, IDDocumento, IDUsuarioFirmante, Orden, IDRolFirmante, IDEstadoFirma, EsAprobado, Comentario,
                           IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, 'M', @IDUsuario, @IDEquipo, GETDATE()
                    FROM FIR_DocumentoFirmante WHERE IDFirmante = @IDFirmante";

                ConexionBD.EjecutarAccionFirmaSQL(sqlAudit, new SqlParameter[] {
                    new SqlParameter("@IDUsuario", loginUsuario),
                    new SqlParameter("@IDEquipo", Request.UserHostAddress ?? Environment.MachineName),
                    new SqlParameter("@IDFirmante", idFirmante)
                });

                // 3. Estado Global
                string sqlGetDoc = "SELECT IDDocumento FROM FIR_DocumentoFirmante WHERE IDFirmante = @IDFirmante";
                DataTable dtDoc = ConexionBD.EjecutarConsultaFirmaSQL(sqlGetDoc, new SqlParameter[] { new SqlParameter("@IDFirmante", idFirmante) });
                if (dtDoc.Rows.Count > 0)
                {
                    int idDoc = Convert.ToInt32(dtDoc.Rows[0]["IDDocumento"]);
                    if (!esAprobado) ActualizarEstadoGlobal(idDoc, 2, loginUsuario); // Observado
                    else if (VerificarUnanimidad(idDoc)) ActualizarEstadoGlobal(idDoc, 3, loginUsuario); // Aprobado
                }

                CargarDocumentosPendientes();
                MostrarMensaje(esAprobado ? "✓ Documento aprobado." : "✓ Observación registrada.", false);
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error: " + ex.Message);
            }
        }

        private bool VerificarUnanimidad(int idDoc)
        {
            string sql = "SELECT COUNT(*) FROM FIR_DocumentoFirmante WHERE IDDocumento = @IDDoc AND (EsAprobado IS NULL OR EsAprobado = 0)";
            DataTable dt = ConexionBD.EjecutarConsultaFirmaSQL(sql, new SqlParameter[] { new SqlParameter("@IDDoc", idDoc) });
            return (Convert.ToInt32(dt.Rows[0][0]) == 0);
        }

        private void ActualizarEstadoGlobal(int idDoc, int idEstado, string user)
        {
            string sql = "UPDATE FIR_Documento SET IDEstadoDoc = @IDEstado, IDUsuarioModificador = @IDUser, FechaModificacion = GETDATE() WHERE IDDocumento = @IDDoc";
            ConexionBD.EjecutarAccionFirmaSQL(sql, new SqlParameter[] {
                new SqlParameter("@IDEstado", idEstado),
                new SqlParameter("@IDUser", user),
                new SqlParameter("@IDDoc", idDoc)
            });
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