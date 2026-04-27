// ============================================================
// Nombre del programa  : frmMisDocumentosRevisor
// Descripción          : Lista los documentos pendientes de
//                        revisión/firma para el usuario firmante
//                        autenticado (mock o real). Permite ver el
//                        PDF embebido y registrar la decisión
//                        (Aprobado / Con Observación) llamando a
//                        USP_FIR_Documento_RegistrarRevision.
// Fecha desarrollo     : 27/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// ============================================================
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
        // ── Ciclo de vida ────────────────────────────────────────────────────
        protected void Page_Load(object sender, EventArgs e)
        {
            // Proteger la página: requiere sesión activa con rol FIR
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

        // ── Cargar datos del usuario en sidebar y topbar ─────────────────────
        private void CargarDatosUsuario()
        {
            string nombre = Session["Nombres"]?.ToString() ?? "Usuario";
            string rolDesc = Session["RolDescripcion"]?.ToString() ?? "Firmante";

            Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
            if (lblNombreUsuario != null) lblNombreUsuario.Text = nombre;

            Label lblRolUsuario = (Label)FindControl("lblRolUsuario");
            if (lblRolUsuario != null) lblRolUsuario.Text = rolDesc;

            Label lblRolBadge = (Label)FindControl("lblRolBadge");
            if (lblRolBadge != null) lblRolBadge.Text = rolDesc;

            Image imgPerfil = (Image)FindControl("imgPerfil");
            if (imgPerfil != null)
            {
                string urlFoto = Session["UrlFoto"]?.ToString();
                if (string.IsNullOrEmpty(urlFoto))
                    urlFoto = "https://ui-avatars.com/api/?background=001e40&color=fff&name=" + Uri.EscapeDataString(nombre);
                imgPerfil.ImageUrl = urlFoto;
            }
        }

        // ── Cargar documentos asignados al firmante desde BD ─────────────────
        // Lógica:
        //   1. El registrador guarda firmantes en FIR_DocumentoFirmante con
        //      IDUsuarioFirmante = login del SAS (ej: "japaza").
        //   2. El login mockeado llena Session["strUsuario"] con ese mismo valor.
        //   3. Buscamos en FIR_DocumentoFirmante los registros cuyo
        //      IDUsuarioFirmante = Session["strUsuario"] y estado = PENDIENTE.
        //   4. Solo mostramos documentos donde sea SU turno en el orden secuencial
        //      (no existen firmantes anteriores con estado distinto a FIRMADO).
        //   Esto usa USP_FIR_Documento_ListarFirmaPendiente que ya implementa
        //   exactamente esa lógica.
        private void CargarDocumentosPendientes()
        {
            string loginUsuario = Session["strUsuario"]?.ToString();
            if (string.IsNullOrEmpty(loginUsuario)) return;

            try
            {
                // Query que ignora el orden secuencial para permitir revisión simultánea
                // y filtra los que ya han sido procesados (EsAprobado no es NULL)
                string sql = @"
                    SELECT 
                        vd.IDDocumento, vd.Asunto, vd.CodigoDocumento,
                        vd.AreaResponsable, vd.FechaCreacionDoc,
                        vd.EstadoDocumento, vd.TipoDocumento,
                        vd.RutaArchivo,
                        f.IDFirmante, f.Orden, f.FechaCreacion AS FechaAsignacion,
                        me.Descripcion AS EstadoFirma
                    FROM dbo.FIR_DocumentoFirmante f
                    INNER JOIN dbo.FIR_VW_DocumentosPendientes vd ON vd.IDDocumento = f.IDDocumento
                    INNER JOIN dbo.FIR_Maestro me ON me.IDMaestro = f.IDEstadoFirma
                    WHERE f.IDUsuarioFirmante = @IDUsuario
                      AND me.Codigo = 'PENDIENTE'
                      AND f.EsAprobado IS NULL
                    ORDER BY f.FechaCreacion DESC";

                SqlParameter[] pars = { new SqlParameter("@IDUsuario", loginUsuario) };
                DataTable dt = ConexionBD.EjecutarConsultaFirmaSQL(sql, pars);

                Panel pnlSinDocumentos = (Panel)FindControl("pnlSinDocumentos");
                Panel pnlTabla = (Panel)FindControl("pnlTabla");
                Repeater rptDocumentos = (Repeater)FindControl("rptDocumentos");

                if (dt == null || dt.Rows.Count == 0)
                {
                    if (pnlSinDocumentos != null) pnlSinDocumentos.Visible = true;
                    if (pnlTabla != null) pnlTabla.Visible = false;
                    return;
                }

                if (pnlTabla != null) pnlTabla.Visible = true;
                if (pnlSinDocumentos != null) pnlSinDocumentos.Visible = false;
                if (rptDocumentos != null)
                {
                    rptDocumentos.DataSource = dt;
                    rptDocumentos.DataBind();
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al consultar documentos: " + ex.Message);
            }
        }

        // ── Comando del Repeater: abrir modal vía JS ─────────────────────────
        protected void rptDocumentos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName != "AbrirDoc") return;

            // CommandArgument = "IDFirmante|RutaArchivo|Asunto|CodigoDocumento"
            string arg = e.CommandArgument?.ToString() ?? "";
            // Separamos máximo en 4 partes (RutaArchivo puede contener '|' si hubiera)
            string[] parts = arg.Split(new char[] { '|' }, 4);

            if (parts.Length < 4) return;

            string idFirmante   = parts[0];
            string rutaArchivo  = parts[1];
            string asunto       = parts[2].Replace("'", "\\'");
            string codigoDoc    = parts[3].Replace("'", "\\'");

            // Emitir JS para abrir el modal con los datos del documento
            string script = $"abrirModal('{idFirmante}', '{rutaArchivo}', '{asunto}', '{codigoDoc}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "abrirModal", script, true);
        }

        // ── Guardar revisión (Aprobado / Observado) ──────────────────────────
        // Llama a USP_FIR_Documento_RegistrarRevision.
        // IMPORTANTE: En el sistema el registro original de frmRegistrarDocumento
        // NO inserta revisores en FIR_DocumentoRevision (jsonRevisores = "[]").
        // Los firmantes están en FIR_DocumentoFirmante.
        // Para que la revisión quede registrada usamos el IDFirmante y actualizamos
        // directamente FIR_DocumentoFirmante con ObservacionFirma y estado.
        // Si en el futuro se desea usar el flujo de FIR_DocumentoRevision,
        // se debe modificar frmRegistrarDocumento para poblar revisores.
        protected void btnGuardarRevision_Click(object sender, EventArgs e)
        {
            string loginUsuario = Session["strUsuario"]?.ToString();
            if (string.IsNullOrEmpty(loginUsuario)) return;

            HiddenField hfComentario = (HiddenField)FindControl("hfComentario");
            HiddenField hfDecision = (HiddenField)FindControl("hfDecision");
            HiddenField hfIDFirmante = (HiddenField)FindControl("hfIDFirmante");

            string comentario = hfComentario?.Value?.Trim() ?? "";
            string decision = hfDecision?.Value?.Trim() ?? "";
            string idFirmanteStr = hfIDFirmante?.Value?.Trim() ?? "";

            if (string.IsNullOrEmpty(idFirmanteStr) || !int.TryParse(idFirmanteStr, out int idFirmante))
            {
                MostrarMensaje("No se identificó el documento a revisar. Intente nuevamente.");
                return;
            }

            if (decision != "APROBADO" && decision != "OBSERVADO")
            {
                MostrarMensaje("Decisión inválida.");
                return;
            }

            if (decision == "OBSERVADO" && string.IsNullOrEmpty(comentario))
            {
                MostrarMensaje("Debe ingresar una observación.");
                return;
            }

            try
            {
                // Obtener el IDDocVersion asociado a este IDFirmante para buscar
                // su registro en FIR_DocumentoRevision (si existe) o usar
                // el procedimiento de firma con observación.
                // En la implementación actual, registrar la "revisión" del firmante
                // equivale a llamar a USP_FIR_Documento_RegistrarRevision si existe
                // un IDRevision; de lo contrario actualizamos ObservacionFirma.
                //
                // Flujo real:
                //   - Buscamos en FIR_DocumentoRevision si hay un IDRevision
                //     vinculado al IDDocVersion del firmante.
                //   - Si lo hay → llamamos a USP_FIR_Documento_RegistrarRevision.
                //   - Si no lo hay (jsonRevisores = "[]") → guardamos la
                //     observación en FIR_DocumentoFirmante.ObservacionFirma
                //     pero NO marcamos como firmado (eso corresponde a otro paso).

                // Paso 1: Obtener IDDocVersion del firmante
                int? idDocVersion = ObtenerIDDocVersionDeFirmante(idFirmante);

                if (idDocVersion.HasValue)
                {
                    // Paso 2: Verificar si existe un IDRevision en FIR_DocumentoRevision
                    int? idRevision = ObtenerIDRevisionPorDocVersionYRevisor(idDocVersion.Value, loginUsuario);

                    if (idRevision.HasValue)
                    {
                        // Llamar USP_FIR_Documento_RegistrarRevision
                        RegistrarRevisionConSP(idRevision.Value, decision, comentario, loginUsuario);
                    }
                    else
                    {
                        // No hay registro de revisión separado: guardar observación
                        // directamente en FIR_DocumentoFirmante
                        GuardarObservacionEnFirmante(idFirmante, decision, comentario, loginUsuario);
                    }
                }
                else
                {
                    MostrarMensaje("No se encontró la versión del documento asociada.");
                    return;
                }

                // Recargar lista
                CargarDocumentosPendientes();

                string msgOk = decision == "APROBADO"
                    ? "✓ Documento aprobado correctamente."
                    : "✓ Observación registrada correctamente.";
                MostrarMensaje(msgOk, esError: false);
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al registrar la revisión: " + ex.Message);
            }
        }

        // ── Helpers de BD ────────────────────────────────────────────────────

        private int? ObtenerIDDocVersionDeFirmante(int idFirmante)
        {
            string sql = @"
                SELECT TOP 1 dv.IDDocVersion
                FROM FIR_DocumentoFirmante df
                INNER JOIN FIR_DocumentoVersion dv ON dv.IDDocumento = df.IDDocumento
                WHERE df.IDFirmante = @IDFirmante
                ORDER BY dv.Iteracion DESC";

            SqlParameter[] p = { new SqlParameter("@IDFirmante", idFirmante) };
            DataTable dt = ConexionBD.EjecutarConsultaFirmaSQL(sql, p);

            if (dt != null && dt.Rows.Count > 0 && dt.Rows[0][0] != DBNull.Value)
                return Convert.ToInt32(dt.Rows[0][0]);
            return null;
        }

        private int? ObtenerIDRevisionPorDocVersionYRevisor(int idDocVersion, string loginUsuario)
        {
            string sql = @"
                SELECT TOP 1 IDRevision
                FROM FIR_DocumentoRevision
                WHERE IDDocVersion = @IDDocVersion
                  AND IDUsuarioRevisor = @IDUsuarioRevisor";

            SqlParameter[] p = {
                new SqlParameter("@IDDocVersion",     idDocVersion),
                new SqlParameter("@IDUsuarioRevisor", loginUsuario)
            };
            DataTable dt = ConexionBD.EjecutarConsultaFirmaSQL(sql, p);

            if (dt != null && dt.Rows.Count > 0 && dt.Rows[0][0] != DBNull.Value)
                return Convert.ToInt32(dt.Rows[0][0]);
            return null;
        }

        private void RegistrarRevisionConSP(int idRevision, string decision, string comentario, string loginUsuario)
        {
            // Obtener IDMaestro del nuevo estado de revisión
            string sqlEstado = @"
                SELECT IDMaestro FROM FIR_Maestro
                WHERE Tipo = 'ESTADO_REVISION'
                  AND Codigo = @Codigo";

            SqlParameter[] pe = { new SqlParameter("@Codigo", decision) };
            DataTable dtE = ConexionBD.EjecutarConsultaFirmaSQL(sqlEstado, pe);

            if (dtE == null || dtE.Rows.Count == 0)
                throw new Exception("Estado de revisión no encontrado en FIR_Maestro: " + decision);

            int idEstadoRevNuevo = Convert.ToInt32(dtE.Rows[0][0]);

            SqlParameter[] pars = {
                new SqlParameter("@IDRevision",            idRevision),
                new SqlParameter("@IDEstadoRevisionNuevo", idEstadoRevNuevo),
                new SqlParameter("@Correccion",            (object)comentario ?? DBNull.Value),
                new SqlParameter("@IDUsuarioModificador",  loginUsuario),
                new SqlParameter("@IDEquipo",              Request.UserHostAddress ?? Environment.MachineName)
            };

            ConexionBD.EjecutarAccionFirma("USP_FIR_Documento_RegistrarRevision", pars);
        }

        private void GuardarObservacionEnFirmante(int idFirmante, string decision, string comentario, string loginUsuario)
        {
            // El usuario ahora usa campos estructurados: EsAprobado (bool) y Comentario (string)
            bool esAprobado = (decision == "APROBADO");

            string sql = @"
                UPDATE FIR_DocumentoFirmante
                SET EsAprobado            = @EsAprobado,
                    Comentario            = @Comentario,
                    IDUsuarioModificador  = @IDUsuario,
                    FechaModificacion     = GETDATE()
                WHERE IDFirmante = @IDFirmante
                  AND IDUsuarioFirmante = @IDUsuarioFirmante";

            SqlParameter[] p = {
                new SqlParameter("@EsAprobado",        esAprobado),
                new SqlParameter("@Comentario",        (object)comentario ?? DBNull.Value),
                new SqlParameter("@IDUsuario",         loginUsuario),
                new SqlParameter("@IDFirmante",        idFirmante),
                new SqlParameter("@IDUsuarioFirmante", loginUsuario)
            };

            ConexionBD.EjecutarAccionFirmaSQL(sql, p);

            // Registrar en historial (auditoria) con las nuevas columnas
            string sqlAudit = @"
                INSERT INTO FIR_DocumentoFirmanteAuditoria
                    (IDFirmante, IDDocumento, IDUsuarioFirmante, Orden, IDRolFirmante,
                     IDEstadoFirma, EsAprobado, Comentario,
                     IDUsuarioCreador, FechaCreacion,
                     IDUsuarioModificador, FechaModificacion,
                     TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
                SELECT
                    IDFirmante, IDDocumento, IDUsuarioFirmante, Orden, IDRolFirmante,
                    IDEstadoFirma, EsAprobado, Comentario,
                    IDUsuarioCreador, FechaCreacion,
                    IDUsuarioModificador, FechaModificacion,
                    'M', @IDUsuario, @IDEquipo, GETDATE()
                FROM FIR_DocumentoFirmante
                WHERE IDFirmante = @IDFirmante";

            SqlParameter[] pa = {
                new SqlParameter("@IDUsuario", loginUsuario),
                new SqlParameter("@IDEquipo",  Request.UserHostAddress ?? Environment.MachineName),
                new SqlParameter("@IDFirmante",idFirmante)
            };

            ConexionBD.EjecutarAccionFirmaSQL(sqlAudit, pa);

            // Buscamos el IDDocumento para actualizar el estado global
            string sqlGetDoc = "SELECT IDDocumento FROM FIR_DocumentoFirmante WHERE IDFirmante = @IDFirmante";
            DataTable dtDoc = ConexionBD.EjecutarConsultaFirmaSQL(sqlGetDoc, new SqlParameter[] { new SqlParameter("@IDFirmante", idFirmante) });
            
            if (dtDoc.Rows.Count > 0)
            {
                int idDoc = Convert.ToInt32(dtDoc.Rows[0][0]);

                if (!esAprobado)
                {
                    // Si ALGUIEN observa, el documento pasa a estado OBSERVADO (ID 2)
                    string sqlUpdateDoc = "UPDATE FIR_Documento SET IDEstadoDoc = 2 WHERE IDDocumento = @IDDoc";
                    ConexionBD.EjecutarAccionFirmaSQL(sqlUpdateDoc, new SqlParameter[] { new SqlParameter("@IDDoc", idDoc) });
                }
                else
                {
                    // Si es APROBADO, verificamos si TODOS los demás ya aprobaron también
                    string sqlCheckAll = "SELECT COUNT(*) FROM FIR_DocumentoFirmante WHERE IDDocumento = @IDDoc AND (EsAprobado IS NULL OR EsAprobado = 0)";
                    DataTable dtCheck = ConexionBD.EjecutarConsultaFirmaSQL(sqlCheckAll, new SqlParameter[] { new SqlParameter("@IDDoc", idDoc) });
                    
                    int pendientesOAprobados = Convert.ToInt32(dtCheck.Rows[0][0]);
                    if (pendientesOAprobados == 0)
                    {
                        // Si ya no hay pendientes ni observaciones, pasa a APROBADO PARA FIRMA (ID 3)
                        string sqlUpdateDoc = "UPDATE FIR_Documento SET IDEstadoDoc = 3 WHERE IDDocumento = @IDDoc";
                        ConexionBD.EjecutarAccionFirmaSQL(sqlUpdateDoc, new SqlParameter[] { new SqlParameter("@IDDoc", idDoc) });
                    }
                }
            }
        }

        // ── UI helpers ───────────────────────────────────────────────────────

        private void MostrarMensaje(string msg, bool esError = true)
        {
            Panel pnlMensaje = (Panel)FindControl("pnlMensaje");
            Label lblMensaje = (Label)FindControl("lblMensaje");
            if (pnlMensaje != null) pnlMensaje.Visible = true;
            if (lblMensaje != null)
            {
                lblMensaje.Text = msg;
                lblMensaje.CssClass = esError ? "text-sm text-error font-medium" : "text-sm text-on-surface font-medium";
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