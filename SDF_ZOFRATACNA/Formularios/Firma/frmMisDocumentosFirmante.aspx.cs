using SDF_ZOFRATACNA.App_Code.DAL;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmMisDocumentosFirmante : System.Web.UI.Page
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
                string nombre = Session["Nombres"]?.ToString() ?? "Firmante Demo";
                string urlFoto = "https://ui-avatars.com/api/?background=001e40&color=fff&name=" + Uri.EscapeDataString(nombre);

                Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
                Label lblNombreSidebar = (Label)FindControl("lblNombreSidebar");
                Image imgPerfil = (Image)FindControl("imgPerfil");
                Image imgPerfilSidebar = (Image)FindControl("imgPerfilSidebar");

                if (lblNombreUsuario != null) lblNombreUsuario.Text = nombre;
                if (lblNombreSidebar != null) lblNombreSidebar.Text = nombre;
                if (imgPerfil != null) imgPerfil.ImageUrl = urlFoto;
                if (imgPerfilSidebar != null) imgPerfilSidebar.ImageUrl = urlFoto;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error cargando usuario: " + ex.Message);
            }
        }

        private void CargarDocumentosPendientes()
        {
            try
            {
                if (Session["strUsuario"] == null) return;
                string usuario = Session["strUsuario"].ToString();

                SqlParameter[] pars = { new SqlParameter("@IDUsuarioFirmante", usuario) };
                // El SP ya filtra los documentos donde el usuario debe firmar.
                // Aseguramos que solo mostramos los que están en estado 2 (Aprobado para firma)
                DataTable dtAll = ConexionBD.EjecutarConsultaFirma("USP_FIR_Documento_ListarFirmaPendiente", pars);
                
                // Filtrado por IDEstadoDoc = 2 (Aprobado) según el último cambio del usuario
                DataTable dt = dtAll.Clone();
                foreach (DataRow row in dtAll.Rows)
                {
                    if (row["IDEstadoDoc"] != DBNull.Value && Convert.ToInt32(row["IDEstadoDoc"]) == 2)
                    {
                        dt.ImportRow(row);
                    }
                }

                Label lblPorFirmar = (Label)FindControl("lblPorFirmar");
                Label lblBadgeFirmar = (Label)FindControl("lblBadgeFirmar");
                Label lblDocumentoPrioritario = (Label)FindControl("lblDocumentoPrioritario");
                Label lblDescripcionPrioritario = (Label)FindControl("lblDescripcionPrioritario");
                LinkButton btnFirmarPrioritario = (LinkButton)FindControl("btnFirmarPrioritario");
                HtmlGenericControl pnlColaEspera = (HtmlGenericControl)FindControl("pnlColaEspera");

                int totalPendientes = dt.Rows.Count;
                if (lblPorFirmar != null) lblPorFirmar.Text = totalPendientes.ToString();
                if (lblBadgeFirmar != null) lblBadgeFirmar.Text = totalPendientes.ToString();

                if (dt.Rows.Count == 0)
                {
                    if (lblDocumentoPrioritario != null) lblDocumentoPrioritario.Text = "No hay documentos pendientes de firma";
                    if (lblDescripcionPrioritario != null) lblDescripcionPrioritario.Text = "";
                    if (btnFirmarPrioritario != null) btnFirmarPrioritario.Enabled = false;
                    if (pnlColaEspera != null)
                    {
                        pnlColaEspera.Controls.Clear();
                        pnlColaEspera.Controls.Add(new LiteralControl("<div class='text-center py-8 text-on-surface-variant'>No hay documentos en espera</div>"));
                    }
                    return;
                }

                // El primer documento (orden más bajo) es el prioritario
                DataRow prioritario = dt.Rows[0];
                int idFirmantePrioritario = Convert.ToInt32(prioritario["IDFirmante"]);
                string asunto = prioritario["Asunto"].ToString();
                string codigo = prioritario["CodigoDocumento"].ToString();
                string area = prioritario["AreaResponsable"].ToString();
                int orden = Convert.ToInt32(prioritario["Orden"]);
                string ruta = ResolveUrl(prioritario["RutaArchivo"].ToString());
                DateTime fecha = Convert.ToDateTime(prioritario["FechaCreacionDoc"]);
                string creador = prioritario["IDUsuarioCreador"]?.ToString() ?? "Desconocido";

                if (lblDocumentoPrioritario != null) lblDocumentoPrioritario.Text = asunto;
                if (lblDescripcionPrioritario != null) lblDescripcionPrioritario.Text = $"Código: {codigo} | Área: {area} | Orden: {orden} | Remitente: {creador} | Ingresado: {fecha:dd/MM/yyyy}";

                ViewState["IDFirmantePrioritario"] = idFirmantePrioritario;
                ViewState["RutaPrioritario"] = ruta;

                // Contar firmados hoy (simulado)
                Label lblFirmadosHoy = (Label)FindControl("lblFirmadosHoy");
                if (lblFirmadosHoy != null) lblFirmadosHoy.Text = "0";

                // Generar lista de espera (documentos desde el índice 1)
                GenerarListaEspera(dt);
            }
            catch (Exception ex)
            {
                Label lblDocumentoPrioritario = (Label)FindControl("lblDocumentoPrioritario");
                if (lblDocumentoPrioritario != null) lblDocumentoPrioritario.Text = "Error al cargar: " + ex.Message;
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
            }
        }

        private void GenerarListaEspera(DataTable dt)
        {
            HtmlGenericControl pnlColaEspera = (HtmlGenericControl)FindControl("pnlColaEspera");
            if (pnlColaEspera == null) return;
            
            pnlColaEspera.Controls.Clear();

            if (dt.Rows.Count <= 1)
            {
                pnlColaEspera.Controls.Add(new LiteralControl("<div class='text-center py-8 text-on-surface-variant'>No hay más documentos en espera</div>"));
                return;
            }

            StringBuilder html = new StringBuilder();

            for (int i = 1; i < dt.Rows.Count; i++)
            {
                DataRow row = dt.Rows[i];
                string asunto = row["Asunto"].ToString();
                string codigo = row["CodigoDocumento"].ToString();
                string area = row["AreaResponsable"].ToString();
                int orden = Convert.ToInt32(row["Orden"]);
                DateTime fecha = Convert.ToDateTime(row["FechaCreacionDoc"]);
                string ruta = ResolveUrl(row["RutaArchivo"].ToString());

                html.Append($@"
                <div class=""flex flex-col sm:flex-row sm:items-center justify-between p-4 hover:bg-surface-container-high transition-colors rounded-lg gap-4 border-b border-outline-variant/10"">
                    <div class=""flex items-start gap-4"">
                        <div class=""w-10 h-10 rounded-lg bg-surface-container flex flex-col items-center justify-center border border-outline-variant/20 flex-shrink-0"">
                            <span class=""text-[10px] font-label uppercase font-bold"">Ord</span>
                            <span class=""font-headline font-bold text-sm text-primary"">{orden:D2}</span>
                        </div>
                        <div>
                            <h4 class=""font-body font-medium text-on-surface text-sm mb-1"">{asunto}</h4>
                            <p class=""font-body text-xs text-on-surface-variant"">{area} • Código: {codigo} • Ingresado: {fecha:dd/MM/yyyy HH:mm}</p>
                        </div>
                    </div>
                    <div class=""flex items-center justify-end gap-2"">
                        <button type=""button"" onclick=""verPDF('{ruta}')"" class=""bg-surface-container text-primary px-3 py-1.5 rounded text-xs font-medium hover:bg-surface-container-high transition-colors flex items-center gap-1"">
                            <span class=""material-symbols-outlined text-[16px]"">visibility</span> Ver
                        </button>
                        <span class=""bg-surface-container text-on-surface-variant text-[11px] font-semibold px-2 py-1 rounded font-label"">En espera(orden {orden})</span>
                    </div>
                </div>");
            }

            pnlColaEspera.Controls.Add(new LiteralControl(html.ToString()));
        }

        protected void btnFirmarPrioritario_Click(object sender, EventArgs e)
        {
            try
            {
                if (ViewState["IDFirmantePrioritario"] == null) return;
                int idFirmante = Convert.ToInt32(ViewState["IDFirmantePrioritario"]);
                string usuario = Session["strUsuario"].ToString();
                string equipo = Request.UserHostAddress ?? "127.0.0.1";

                SqlParameter[] pars = {
                    new SqlParameter("@IDFirmante", idFirmante),
                    new SqlParameter("@SerieToken", "DEMO-" + DateTime.Now.Ticks.ToString()),
                    new SqlParameter("@HuellaCertificado", "FIRMA-DIGITAL-DEMO"),
                    new SqlParameter("@Observacion", "Documento firmado digitalmente"),
                    new SqlParameter("@IDUsuarioModificador", usuario),
                    new SqlParameter("@IDEquipo", equipo)
                };

                ConexionBD.EjecutarAccionFirma("USP_FIR_Documento_Firmar", pars);

                ClientScript.RegisterStartupScript(this.GetType(), "ok", "<script>alert('Documento firmado correctamente.'); window.location.reload();</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "err", $"<script>alert('Error al firmar: {ex.Message.Replace("'", "")}');</script>");
            }
        }

        protected void btnRevisarPrioritario_Click(object sender, EventArgs e)
        {
            string ruta = ViewState["RutaPrioritario"]?.ToString();
            if (!string.IsNullOrEmpty(ruta))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "pdf", $"<script>window.open('{ruta}', '_blank');</script>");
            }
        }

        protected void btnVerTodos_Click(object sender, EventArgs e)
        {
            CargarDocumentosPendientes();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}