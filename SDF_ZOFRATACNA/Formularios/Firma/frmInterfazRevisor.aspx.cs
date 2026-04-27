using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using SDF_ZOFRATACNA.App_Code.DAL;

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmInterfazRevisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

        private void CargarDatosUsuario()
        {
            try
            {
                string strNombre = Session["Nombres"]?.ToString() ?? "Revisor Demo";
                string strRol = Session["Rol"]?.ToString() ?? "Revisor Legal";
                string strUrlFoto = Session["UrlFoto"]?.ToString()
                                    ?? "https://ui-avatars.com/api/?background=001e40&color=fff&name="
                                    + Uri.EscapeDataString(strNombre);

                Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
                Label lblRolUsuario = (Label)FindControl("lblRolUsuario");
                Label lblNombreTop = (Label)FindControl("lblNombreTop");
                Image imgPerfil = (Image)FindControl("imgPerfil");
                Image imgPerfilTop = (Image)FindControl("imgPerfilTop");

                if (lblNombreUsuario != null) lblNombreUsuario.Text = strNombre;
                if (lblRolUsuario != null) lblRolUsuario.Text = strRol;
                if (lblNombreTop != null) lblNombreTop.Text = strNombre;
                if (imgPerfil != null) imgPerfil.ImageUrl = strUrlFoto;
                if (imgPerfilTop != null) imgPerfilTop.ImageUrl = strUrlFoto;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
            }
        }

        private void CargarExpediente()
        {
            string strIdRev = Request.QueryString["idRev"];

            if (string.IsNullOrEmpty(strIdRev))
            {
                Response.Redirect("~/Formularios/Firma/frmMisDocumentosRevisor.aspx");
                return;
            }

            try
            {
                SqlParameter[] pars = { new SqlParameter("@IDUsuarioRevisor", Session["IdUsuario"].ToString()) };
                DataTable dt = ConexionBD.EjecutarConsultaFirma("dbo.USP_FIR_Documento_ListarRevisionPendiente", pars);

                DataRow rowDoc = null;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["IDRevision"].ToString() == strIdRev)
                    {
                        rowDoc = row;
                        break;
                    }
                }

                if (rowDoc != null)
                {
                    Label lblExpedienteTitulo = (Label)FindControl("lblExpedienteTitulo");
                    Label lblAsuntoPdf = (Label)FindControl("lblAsuntoPdf");
                    Label lblRemitenteNombre = (Label)FindControl("lblRemitenteNombre");
                    Label lblRemitenteArea = (Label)FindControl("lblRemitenteArea");
                    Label lblFechaEmision = (Label)FindControl("lblFechaEmision");
                    HtmlGenericControl iframePdf = (HtmlGenericControl)FindControl("iframePdf");

                    if (lblExpedienteTitulo != null) lblExpedienteTitulo.Text = rowDoc["CodigoDocumento"].ToString();
                    if (lblAsuntoPdf != null) lblAsuntoPdf.Text = rowDoc["Asunto"].ToString();
                    if (lblRemitenteNombre != null) lblRemitenteNombre.Text = rowDoc["IDUsuarioCreador"].ToString(); 
                    if (lblRemitenteArea != null) lblRemitenteArea.Text = rowDoc["AreaResponsable"].ToString();
                    if (lblFechaEmision != null) lblFechaEmision.Text = Convert.ToDateTime(rowDoc["FechaCreacionDoc"]).ToString("dd 'de' MMMM 'de' yyyy");

                    string rutaPdf = rowDoc["RutaArchivo"]?.ToString();
                    if (!string.IsNullOrEmpty(rutaPdf) && iframePdf != null)
                    {
                        iframePdf.Attributes["src"] = ResolveUrl(rutaPdf);
                    }
                }
                else
                {
                    Response.Redirect("~/Formularios/Firma/frmMisDocumentosRevisor.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
            }
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            RegistrarRevision("APROBADO");
        }

        protected void btnObservar_Click(object sender, EventArgs e)
        {
            TextBox txtObservaciones = (TextBox)FindControl("txtObservaciones");
            if (txtObservaciones == null || string.IsNullOrWhiteSpace(txtObservaciones.Text))
            {
                Response.Write("<script>alert('Debe ingresar observaciones para observar el documento.');</script>");
                return;
            }
            RegistrarRevision("OBSERVADO");
        }

        private void RegistrarRevision(string codigoEstado)
        {
            try
            {
                string idRev = Request.QueryString["idRev"];
                string idUsuario = Session["IdUsuario"].ToString();
                
                TextBox txtObservaciones = (TextBox)FindControl("txtObservaciones");
                string observaciones = txtObservaciones != null ? txtObservaciones.Text : "";

                int idEstado = (codigoEstado == "APROBADO") ? 7 : 8;

                SqlParameter[] pars = {
                    new SqlParameter("@IDRevision", idRev),
                    new SqlParameter("@IDEstadoRevisionNuevo", idEstado),
                    new SqlParameter("@Correccion", observaciones),
                    new SqlParameter("@IDUsuarioModificador", idUsuario),
                    new SqlParameter("@IDEquipo", Request.UserHostAddress ?? "127.0.0.1")
                };

                ConexionBD.EjecutarAccionFirma("dbo.USP_FIR_Documento_RegistrarRevision", pars);

                string mensaje = codigoEstado == "APROBADO" ? "Documento aprobado con éxito." : "Documento observado y devuelto.";
                string script = $"alert('{mensaje}'); window.location.href='frmMisDocumentosRevisor.aspx';";
                ScriptManager.RegisterStartupScript(this, GetType(), "PopUp", script, true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error al registrar revisión: " + ex.Message.Replace("'", "") + "');</script>");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/Firma/frmMisDocumentosRevisor.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}