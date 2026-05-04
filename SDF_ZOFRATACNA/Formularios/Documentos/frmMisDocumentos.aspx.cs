using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using SDF_ZOFRATACNA.App_Code.DAL;

namespace SDF_ZOFRATACNA.Formularios.Documentos
{
    public partial class frmMisDocumentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["strUsuario"] == null)
            {
                // Para pruebas, forzaremos el login a 'reg01' si no hay sesión
                Session["strUsuario"] = "reg01";
            }

            if (!IsPostBack)
            {
                litUsuario.Text = Session["strUsuario"].ToString();
                ViewState["FiltroActual"] = "TODOS";
                CargarDocumentos();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }

        protected void FiltrarBandeja(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            ViewState["FiltroActual"] = btn.CommandArgument;
            CargarDocumentos();
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            CargarDocumentos();
        }

        private void CargarDocumentos()
        {
            string estadoFiltroActual = ViewState["FiltroActual"].ToString();
            string login = Session["strUsuario"].ToString();
            
            DataTable dt = SDF_ZOFRATACNA.Models.FIR_Documento.ListarPorRegistrador(login);
            
            string filtro = "";
            if (estadoFiltroActual == "PENDIENTES")
                filtro = "CodigoEstado IN ('REG', 'EN_REV')";
            else if (estadoFiltroActual == "OBSERVADOS")
                filtro = "CodigoEstado = 'OBS'";
            else if (estadoFiltroActual == "FIRMADOS")
                filtro = "CodigoEstado IN ('FIRM_COM', 'FPAR', 'APR_FIRMA')";
                
            if (!string.IsNullOrEmpty(txtBuscar.Text))
            {
                if (filtro != "") filtro += " AND ";
                filtro += $"(CodigoDocumento LIKE '%{txtBuscar.Text.Trim().Replace("'", "''")}%' OR Asunto LIKE '%{txtBuscar.Text.Trim().Replace("'", "''")}%')";
            }
            
            dt.DefaultView.RowFilter = filtro;
            
            rptDocumentos.DataSource = dt.DefaultView;
            rptDocumentos.DataBind();
            
            phSinDatos.Visible = dt.DefaultView.Count == 0;
        }

        protected string ObtenerClaseEstado(string codigoEstado)
        {
            switch (codigoEstado)
            {
                case "REG":
                case "EN_REV":
                    return "inline-flex items-center justify-center px-3 py-1 rounded-full bg-surface-container-highest text-on-surface font-label text-xs font-bold uppercase tracking-wider";
                case "OBS":
                    return "inline-flex items-center justify-center px-3 py-1 rounded-full bg-error-container text-on-error-container font-label text-xs font-bold uppercase tracking-wider";
                case "FPAR":
                case "FIRM_COM":
                    return "inline-flex items-center justify-center px-3 py-1 rounded-full bg-primary-fixed text-on-primary-fixed font-label text-xs font-bold uppercase tracking-wider";
                default:
                    return "inline-flex items-center justify-center px-3 py-1 rounded-full bg-secondary-container text-on-secondary-container font-label text-xs font-bold uppercase tracking-wider";
            }
        }

        protected string ObtenerNombreEstado(string codigoEstado)
        {
            switch (codigoEstado)
            {
                case "REG": return "Registrado";
                case "EN_REV": return "En Revisión";
                case "OBS": return "Observado";
                case "FPAR": return "Firmado Parcial";
                case "FIRM_COM": return "Firmado";
                default: return "Pendiente";
            }
        }

        protected void rptDocumentos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "VerObservaciones")
            {
                int idDocumento = Convert.ToInt32(e.CommandArgument);
                MostrarModalObservaciones(idDocumento);
            }
            else if (e.CommandName == "VerDocumento")
            {
                int idDocumento = Convert.ToInt32(e.CommandArgument);
                string ruta = SDF_ZOFRATACNA.Models.FIR_Documento.ObtenerRutaPDF(idDocumento);
                if(!string.IsNullOrEmpty(ruta))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "AbrirPDF", $"window.open('{ResolveUrl(ruta)}', '_blank');", true);
                }
            }
        }

        private void MostrarModalObservaciones(int idDocumento)
        {
            hdnIdDocumentoObser.Value = idDocumento.ToString();
            
            string ruta = SDF_ZOFRATACNA.Models.FIR_Documento.ObtenerRutaPDF(idDocumento);
            if (!string.IsNullOrEmpty(ruta))
            {
                iframePDF.Src = ResolveUrl(ruta);
            }

            DataTable dtObs = SDF_ZOFRATACNA.Models.FIR_Observacion.ListarPorDocumento(idDocumento);
            
            rptListaObservaciones.DataSource = dtObs;
            rptListaObservaciones.DataBind();
            
            bool todosRevisados = SDF_ZOFRATACNA.Models.FIR_DocumentoRevisor.TodosRevisaron(idDocumento);
            if (!todosRevisados)
            {
                lblErrorUpload.Text = "Aún faltan personas por revisar. No puede subir la corrección hasta que TODOS terminen.";
                lblErrorUpload.Visible = true;
                fuCorreccion.Enabled = false;
                btnSubirCorreccion.Enabled = false;
                btnSubirCorreccion.CssClass = "px-4 py-2 rounded-lg text-sm font-bold text-white bg-secondary cursor-not-allowed opacity-50";
            }
            else
            {
                lblErrorUpload.Visible = false;
                fuCorreccion.Enabled = true;
                btnSubirCorreccion.Enabled = true;
                btnSubirCorreccion.CssClass = "px-4 py-2 rounded-lg text-sm font-bold text-white bg-primary-container hover:bg-primary shadow-md transition-colors cursor-pointer";
            }
            
            modalObservaciones.Visible = true;
            upModal.Update();
        }

        protected void btnCerrarModal_Click(object sender, EventArgs e)
        {
            modalObservaciones.Visible = false;
            upModal.Update();
        }

        protected void btnSubirCorreccion_Click(object sender, EventArgs e)
        {
            if (!fuCorreccion.HasFile)
            {
                lblErrorUpload.Text = "Debe seleccionar un archivo PDF.";
                lblErrorUpload.Visible = true;
                return;
            }

            int idDocumento = Convert.ToInt32(hdnIdDocumentoObser.Value);
            string login = Session["strUsuario"].ToString();
            
            // Subir archivo a Temp
            string fileName = Path.GetFileNameWithoutExtension(fuCorreccion.FileName) + "_" + DateTime.Now.ToString("yyyyMMdd_HHmmss") + ".pdf";
            string uploadPath = Server.MapPath("~/Temp/");
            if (!Directory.Exists(uploadPath)) Directory.CreateDirectory(uploadPath);
            
            string fullPath = Path.Combine(uploadPath, fileName);
            fuCorreccion.SaveAs(fullPath);
            
            string relativePath = "~/Temp/" + fileName;

            // Actualizar Base de Datos (Transacción)
            try
            {
                SDF_ZOFRATACNA.Models.FIR_Documento.SubirCorreccion(idDocumento, login, relativePath);
                
                // Cerrar modal y refrescar grilla
                modalObservaciones.Visible = false;
                CargarDocumentos();
                upBandeja.Update();
                upModal.Update();
            }
            catch (Exception ex)
            {
                lblErrorUpload.Text = "Error al guardar la corrección: " + ex.Message;
                lblErrorUpload.Visible = true;
            }
        }
        
        // Declaración manual de controles para evitar CS0103 debido al .designer.cs defectuoso
        protected global::System.Web.UI.ScriptManager ScriptManager1;
        protected global::System.Web.UI.WebControls.TextBox txtBuscar;
        protected global::System.Web.UI.UpdatePanel upBandeja;
        protected global::System.Web.UI.WebControls.LinkButton btnFiltroTodos;
        protected global::System.Web.UI.WebControls.LinkButton btnFiltroPendientes;
        protected global::System.Web.UI.WebControls.LinkButton btnFiltroObservados;
        protected global::System.Web.UI.WebControls.LinkButton btnFiltroFirmados;
        protected global::System.Web.UI.WebControls.Repeater rptDocumentos;
        protected global::System.Web.UI.WebControls.PlaceHolder phSinDatos;
        protected global::System.Web.UI.UpdatePanel upModal;
        protected global::System.Web.UI.HtmlControls.HtmlGenericControl modalObservaciones;
        protected global::System.Web.UI.WebControls.LinkButton btnCerrarModal;
        protected global::System.Web.UI.HtmlControls.HtmlIframe iframePDF;
        protected global::System.Web.UI.WebControls.Repeater rptListaObservaciones;
        protected global::System.Web.UI.WebControls.HiddenField hdnIdDocumentoObser;
        protected global::System.Web.UI.WebControls.FileUpload fuCorreccion;
        protected global::System.Web.UI.WebControls.Label lblErrorUpload;
        protected global::System.Web.UI.WebControls.Button btnCancelarCorreccion;
        protected global::System.Web.UI.WebControls.Button btnSubirCorreccion;
    }
}
