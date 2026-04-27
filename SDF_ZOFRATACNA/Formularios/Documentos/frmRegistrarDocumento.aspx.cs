using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

using SDF_ZOFRATACNA.App_Code.DAL;

namespace SDF_ZOFRATACNA.Formularios.Documentos
{
    public partial class frmRegistrarDocumento : System.Web.UI.Page
    {
        // Clases para serializar
        public class FirmanteData
        {
            public string IDUsuarioFirmante { get; set; }
            public int Orden { get; set; }
            public int IDRol { get; set; }
        }

        // Listas en memoria para ViewState
        [Serializable]
        public class PersonaViewModel
        {
            public string LoginUsuario { get; set; }
            public string NombreCompleto { get; set; }
            public int IDRol { get; set; }
            public string RolDescripcion { get; set; }
        }

        private List<PersonaViewModel> ListaFirmantes
        {
            get
            {
                if (ViewState["ListaFirmantes"] == null)
                    ViewState["ListaFirmantes"] = new List<PersonaViewModel>();
                return (List<PersonaViewModel>)ViewState["ListaFirmantes"];
            }
            set { ViewState["ListaFirmantes"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verificar sesión COMPLETA
                if (Session["IdUsuario"] == null || Session["strUsuario"] == null)
                {
                    Response.Redirect("~/frmLogin.aspx");
                    return;
                }

                // Mostrar información del usuario logueado
                litUsuario.Text = Session["Nombres"]?.ToString() ?? "Registrador";
                txtFechaEmision.Text = DateTime.Now.ToString("yyyy-MM-dd");

                // Cargar catálogos
                CargarTiposDocumento();
                CargarAreasResponsables();
                CargarUsuariosFirmantes(); // Ahora carga desde BD o Mock según disponibilidad
            }
        }

        /// <summary>
        /// Carga los tipos de documento desde la base de datos
        /// </summary>
        private void CargarTiposDocumento()
        {
            try
            {
                SqlParameter[] pars = { new SqlParameter("@Tipo", "TIPO_DOC") };
                DataTable dt = ConexionBD.EjecutarConsultaFirma("USP_FIR_Maestro_Listar", pars);
                
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlTipoDoc.DataSource = dt;
                    ddlTipoDoc.DataTextField = "Descripcion";
                    ddlTipoDoc.DataValueField = "IDMaestro";
                    ddlTipoDoc.DataBind();
                }
                
                ddlTipoDoc.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar Tipos de Documento: " + ex.Message, true);
            }
        }

        /// <summary>
        /// Carga las áreas responsables (puede venir de BD o ser estático)
        /// </summary>
        private void CargarAreasResponsables()
        {
            try
            {
                // Intentar cargar desde BD primero
                SqlParameter[] pars = { new SqlParameter("@Tipo", "AREA_RESPONSABLE") };
                DataTable dt = ConexionBD.EjecutarConsultaFirma("USP_FIR_Maestro_Listar", pars);
                
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlAreaResponsable.DataSource = dt;
                    ddlAreaResponsable.DataTextField = "Descripcion";
                    ddlAreaResponsable.DataValueField = "Codigo";
                    ddlAreaResponsable.DataBind();
                }
                else
                {
                    // Fallback: áreas estáticas
                    ddlAreaResponsable.Items.Clear();
                    ddlAreaResponsable.Items.Add(new ListItem("Gerencia General", "GER"));
                    ddlAreaResponsable.Items.Add(new ListItem("Asesoría Legal", "LEG"));
                    ddlAreaResponsable.Items.Add(new ListItem("Administración", "ADM"));
                    ddlAreaResponsable.Items.Add(new ListItem("Operaciones", "OPE"));
                    ddlAreaResponsable.Items.Add(new ListItem("Sub-Gerencia Administrativa", "SUB"));
                    ddlAreaResponsable.Items.Add(new ListItem("Secretaria General", "SEC"));
                }
                
                ddlAreaResponsable.Items.Insert(0, new ListItem("-- Seleccione --", ""));
            }
            catch (Exception)
            {
                // Si hay error, usar áreas estáticas
                ddlAreaResponsable.Items.Clear();
                ddlAreaResponsable.Items.Add(new ListItem("-- Seleccione --", ""));
                ddlAreaResponsable.Items.Add(new ListItem("Gerencia General", "GER"));
                ddlAreaResponsable.Items.Add(new ListItem("Asesoría Legal", "LEG"));
                ddlAreaResponsable.Items.Add(new ListItem("Administración", "ADM"));
                ddlAreaResponsable.Items.Add(new ListItem("Operaciones", "OPE"));
                ddlAreaResponsable.Items.Add(new ListItem("Sub-Gerencia Administrativa", "SUB"));
                ddlAreaResponsable.Items.Add(new ListItem("Secretaria General", "SEC"));
            }
        }

        /// <summary>
        /// Carga los usuarios firmantes (prioriza BD, fallback a datos de prueba)
        /// </summary>
        private void CargarUsuariosFirmantes()
        {
            try
            {
                // Intentar cargar desde la base de datos
                SqlParameter[] pars = { new SqlParameter("@Tipo", "FIRMANTES") };
                DataTable dt = ConexionBD.EjecutarConsultaFirma("USP_FIR_UsuariosFirmantes_Listar", pars);
                
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        string login = row["LoginUsuario"].ToString();
                        string nombre = row["Nombres"].ToString();
                        int idRol = Convert.ToInt32(row["IDRol"]);
                        string rolDesc = row["RolDescripcion"].ToString();
                        
                        ddlFirmante.Items.Add(new ListItem(
                            $"{nombre} - {rolDesc}", 
                            $"{login}|{idRol}|{rolDesc}"
                        ));
                    }
                }
                else
                {
                    // Fallback: Datos de prueba (consistentes con frmLogin)
                    CargarUsuariosPrueba();
                }
            }
            catch (Exception)
            {
                // Si hay error, usar datos de prueba
                CargarUsuariosPrueba();
            }
        }

        /// <summary>
        /// Datos de prueba para firmantes (coinciden con los del frmLogin mejorado)
        /// </summary>
        private void CargarUsuariosPrueba()
        {
            var firmantes = new List<PersonaViewModel>
            {
                new PersonaViewModel { 
                    LoginUsuario = "japaza", 
                    NombreCompleto = "Jorge Apaza Huanca", 
                    IDRol = 17, 
                    RolDescripcion = "Gerente General" 
                },
                new PersonaViewModel { 
                    LoginUsuario = "accoa", 
                    NombreCompleto = "Ana Ccoa Flores", 
                    IDRol = 18, 
                    RolDescripcion = "Sub-Gerente" 
                },
                new PersonaViewModel { 
                    LoginUsuario = "lhuanca", 
                    NombreCompleto = "Luis Huanca Pari", 
                    IDRol = 19, 
                    RolDescripcion = "Jefe de Area" 
                }
            };

            foreach (var f in firmantes)
            {
                ddlFirmante.Items.Add(new ListItem(
                    f.NombreCompleto + " - " + f.RolDescripcion, 
                    $"{f.LoginUsuario}|{f.IDRol}|{f.RolDescripcion}"
                ));
            }
            
            ddlFirmante.Items.Insert(0, new ListItem("-- Añadir Firmante --", ""));
        }

        protected void btnAddFirmante_Click(object sender, EventArgs e)
        {
            if (ddlFirmante.SelectedIndex > 0 && !string.IsNullOrEmpty(ddlFirmante.SelectedValue))
            {
                string val = ddlFirmante.SelectedValue;
                string[] parts = val.Split('|');
                
                if (parts.Length == 3)
                {
                    string login = parts[0];
                    int idRol = int.Parse(parts[1]);
                    string rolDesc = parts[2];
                    string nombreCompleto = ddlFirmante.SelectedItem.Text.Split('-')[0].Trim();

                    var list = ListaFirmantes;
                    
                    // Validar que no esté ya agregado
                    if (!list.Exists(x => x.LoginUsuario == login))
                    {
                        list.Add(new PersonaViewModel 
                        { 
                            LoginUsuario = login, 
                            NombreCompleto = nombreCompleto, 
                            IDRol = idRol, 
                            RolDescripcion = rolDesc 
                        });
                        
                        ListaFirmantes = list;
                        rptFirmantes.DataSource = list;
                        rptFirmantes.DataBind();
                        
                        // Limpiar selección
                        ddlFirmante.SelectedIndex = 0;
                    }
                    else
                    {
                        MostrarMensaje("Este firmante ya ha sido agregado al flujo.", true);
                    }
                }
            }
        }

        protected void RemoveFirmante_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string login = btn.CommandArgument;
            
            var list = ListaFirmantes;
            list.RemoveAll(x => x.LoginUsuario == login);
            ListaFirmantes = list;
            
            rptFirmantes.DataSource = list;
            rptFirmantes.DataBind();
        }

        protected void cvFirmantes_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = ListaFirmantes.Count > 0;
            
            if (!args.IsValid)
            {
                MostrarMensaje("Debe agregar al menos un firmante al documento.", true);
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            // Validar PDF
            if (!fileUploadPDF.HasFile)
            {
                MostrarMensaje("Debe cargar un documento PDF.", true);
                return;
            }

            string ext = Path.GetExtension(fileUploadPDF.FileName).ToLower();
            if (ext != ".pdf")
            {
                MostrarMensaje("El archivo debe ser un documento PDF.", true);
                return;
            }

            // Validar tamaño máximo (10MB)
            if (fileUploadPDF.PostedFile.ContentLength > 10 * 1024 * 1024)
            {
                MostrarMensaje("El archivo no puede superar los 10MB.", true);
                return;
            }

            if (ListaFirmantes.Count == 0)
            {
                cvFirmantes_ServerValidate(null, new ServerValidateEventArgs("", false));
                return;
            }

            try
            {
                // Crear carpeta Temp si no existe
                string tempFolder = Server.MapPath("~/Temp/");
                if (!Directory.Exists(tempFolder)) 
                    Directory.CreateDirectory(tempFolder);
                
                // Generar nombre único para el archivo
                string tipoDoc = ddlTipoDoc.SelectedItem.Text.Replace(" ", "_").Replace("/", "_");
                string areaResp = ddlAreaResponsable.SelectedItem.Text.Replace(" ", "_");
                string fechaStr = DateTime.Now.ToString("yyyyMMdd_HHmmss_fff");
                string guid = Guid.NewGuid().ToString().Substring(0, 8);
                
                string nuevoNombre = $"{tipoDoc}_{areaResp}_{fechaStr}_{guid}.pdf";
                string rutaRelativa = "~/Temp/" + nuevoNombre;
                string rutaFisica = Path.Combine(tempFolder, nuevoNombre);
                
                // Guardar archivo
                fileUploadPDF.SaveAs(rutaFisica);
                
                // Validar que se guardó correctamente
                if (!File.Exists(rutaFisica))
                {
                    throw new Exception("No se pudo guardar el archivo PDF.");
                }

                // Configurar JSON para Firmantes
                List<FirmanteData> firData = new List<FirmanteData>();
                int orden = 1;
                foreach (var f in ListaFirmantes)
                {
                    firData.Add(new FirmanteData 
                    { 
                        IDUsuarioFirmante = f.LoginUsuario, 
                        Orden = orden++, 
                        IDRol = f.IDRol 
                    });
                }

                JavaScriptSerializer js = new JavaScriptSerializer();
                string jsonFirmantes = js.Serialize(firData);
                string jsonRevisores = "[]"; // Array vacío para compatibilidad

                // Validar datos obligatorios
                if (string.IsNullOrWhiteSpace(txtAsunto.Text))
                {
                    MostrarMensaje("El asunto del documento es obligatorio.", true);
                    return;
                }

                if (ddlTipoDoc.SelectedValue == "0")
                {
                    MostrarMensaje("Debe seleccionar un tipo de documento.", true);
                    return;
                }

                if (string.IsNullOrWhiteSpace(ddlAreaResponsable.SelectedValue))
                {
                    MostrarMensaje("Debe seleccionar un área responsable.", true);
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtCodigoReferencia.Text))
                {
                    MostrarMensaje("El código de referencia es obligatorio.", true);
                    return;
                }

                // Obtener ID del usuario creador desde sesión
                string idUsuarioCreador = Session["strUsuario"]?.ToString();
                if (string.IsNullOrEmpty(idUsuarioCreador))
                {
                    MostrarMensaje("Error de sesión: No se identificó al usuario creador.", true);
                    return;
                }

                // Llamar al procedimiento almacenado
                SqlParameter[] pars = {
                    new SqlParameter("@Asunto", txtAsunto.Text.Trim()),
                    new SqlParameter("@IDTipoDoc", int.Parse(ddlTipoDoc.SelectedValue)),
                    new SqlParameter("@AreaResponsable", ddlAreaResponsable.SelectedItem.Text),
                    new SqlParameter("@FechaCreacionDoc", Convert.ToDateTime(txtFechaEmision.Text)),
                    new SqlParameter("@CodigoDocumento", txtCodigoReferencia.Text.Trim()),
                    new SqlParameter("@RutaArchivo", rutaRelativa),
                    new SqlParameter("@IDUsuarioCreador", idUsuarioCreador),
                    new SqlParameter("@IDEquipo", Request.UserHostAddress ?? Environment.MachineName),
                    new SqlParameter("@JsonRevisores", jsonRevisores),
                    new SqlParameter("@JsonFirmantes", jsonFirmantes)
                };

                ConexionBD.EjecutarAccionFirma("USP_FIR_Documento_Registrar", pars);

                // Éxito - Limpiar formulario
                MostrarMensaje("✓ El documento se ha registrado y enviado al flujo de firmas con éxito.", false);
                
                // Limpiar campos después del registro exitoso
                LimpiarFormulario();
                
                // Opcional: Redirigir después de 3 segundos
                string script = @"
                    setTimeout(function() {
                        window.location.href = 'frmDashboardRegistrador.aspx';
                    }, 3000);
                ";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
            }
            catch (SqlException sqlEx)
            {
                MostrarMensaje("Error en la base de datos: " + sqlEx.Message, true);
                // Log del error detallado (implementar según necesidades)
            }
            catch (Exception ex)
            {
                MostrarMensaje("Ocurrió un error al registrar: " + ex.Message, true);
                // Log del error detallado
            }
        }

        /// <summary>
        /// Limpia todos los campos del formulario después de un registro exitoso
        /// </summary>
        private void LimpiarFormulario()
        {
            txtAsunto.Text = "";
            txtCodigoReferencia.Text = "";
            txtFechaEmision.Text = DateTime.Now.ToString("yyyy-MM-dd");
            ddlTipoDoc.SelectedIndex = 0;
            ddlAreaResponsable.SelectedIndex = 0;
            ddlFirmante.SelectedIndex = 0;
            ListaFirmantes.Clear();
            rptFirmantes.DataSource = null;
            rptFirmantes.DataBind();
            
            // Nota: El FileUpload no se puede limpiar fácilmente desde servidor
            // Se recomienda redirigir a una página nueva o usar JavaScript
        }

        private void MostrarMensaje(string msg, bool esError)
        {
            if (esError)
            {
                pnlError.Visible = true;
                pnlSuccess.Visible = false;
                litError.Text = msg;
            }
            else
            {
                pnlError.Visible = false;
                pnlSuccess.Visible = true;
                litSuccess.Text = msg;
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