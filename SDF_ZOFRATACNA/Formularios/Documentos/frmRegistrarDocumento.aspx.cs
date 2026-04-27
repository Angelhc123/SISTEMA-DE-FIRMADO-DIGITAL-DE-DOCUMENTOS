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
                // Verificar sesión
                if (Session["IdUsuario"] == null)
                {
                    Response.Redirect("~/frmLogin.aspx");
                    return;
                }

                litUsuario.Text = Session["Nombres"].ToString();
                txtFechaEmision.Text = DateTime.Now.ToString("yyyy-MM-dd");

                // Cargar catálogos
                CargarTiposDocumento();
                CargarUsuariosPrueba();
            }
        }

        private void CargarTiposDocumento()
        {
            try
            {
                SqlParameter[] pars = { new SqlParameter("@Tipo", "TIPO_DOC") };
                DataTable dt = ConexionBD.EjecutarConsultaFirma("USP_FIR_Maestro_Listar", pars);
                ddlTipoDoc.DataSource = dt;
                ddlTipoDoc.DataBind();
                ddlTipoDoc.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar Tipos de Doc: " + ex.Message, true);
            }
        }

        private void CargarUsuariosPrueba()
        {
            // Cargar Firmantes
            var firmantes = new List<PersonaViewModel>
            {
                // IDs de rol obtenidos de FIR_Maestro
                new PersonaViewModel { LoginUsuario = "japaza", NombreCompleto = "Jorge Apaza Huanca", IDRol = 17, RolDescripcion = "Gerente General" },
                new PersonaViewModel { LoginUsuario = "accoa", NombreCompleto = "Ana Ccoa Flores", IDRol = 18, RolDescripcion = "Sub-Gerente" },
                new PersonaViewModel { LoginUsuario = "lhuanca", NombreCompleto = "Luis Huanca Pari", IDRol = 19, RolDescripcion = "Jefe de Area" }
            };

            foreach (var f in firmantes)
            {
                ddlFirmante.Items.Add(new ListItem(f.NombreCompleto + " - " + f.RolDescripcion, $"{f.LoginUsuario}|{f.IDRol}|{f.RolDescripcion}"));
            }
        }

        protected void btnAddFirmante_Click(object sender, EventArgs e)
        {
            if (ddlFirmante.SelectedIndex > 0)
            {
                string val = ddlFirmante.SelectedValue;
                string[] parts = val.Split('|');
                
                string login = parts[0];
                int idRol = int.Parse(parts[1]);
                string rolDesc = parts[2];
                string nombre = ddlFirmante.SelectedItem.Text.Split('-')[0].Trim();

                var list = ListaFirmantes;
                if (!list.Exists(x => x.LoginUsuario == login))
                {
                    list.Add(new PersonaViewModel { LoginUsuario = login, NombreCompleto = nombre, IDRol = idRol, RolDescripcion = rolDesc });
                    ListaFirmantes = list;
                    rptFirmantes.DataSource = list;
                    rptFirmantes.DataBind();
                }
                ddlFirmante.SelectedIndex = 0;
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

            if (ListaFirmantes.Count == 0)
            {
                cvFirmantes.IsValid = false;
                return;
            }

            try
            {
                // Guardar Archivo
                string uploadsFolder = Server.MapPath("~/Documentos/Uploads/");
                if (!Directory.Exists(uploadsFolder)) Directory.CreateDirectory(uploadsFolder);
                
                string nuevoNombre = Guid.NewGuid().ToString() + ".pdf";
                string rutaRelativa = "~/Documentos/Uploads/" + nuevoNombre;
                fileUploadPDF.SaveAs(Path.Combine(uploadsFolder, nuevoNombre));

                // Configurar JSON para Revisores
                string jsonRevisores = "[]"; // Ya no se usan pero el SP lo espera vacío para no romper firma
                int diasMaxRev = int.Parse(txtDiasMaxRevision.Text);

                // Configurar JSON para Firmantes
                List<FirmanteData> firData = new List<FirmanteData>();
                int orden = 1;
                foreach (var f in ListaFirmantes)
                {
                    firData.Add(new FirmanteData { IDUsuarioFirmante = f.LoginUsuario, Orden = orden++, IDRol = f.IDRol });
                }

                JavaScriptSerializer js = new JavaScriptSerializer();
                string jsonFirmantes = js.Serialize(firData);

                // Llamar a BD
                SqlParameter[] pars = {
                    new SqlParameter("@Asunto", txtAsunto.Text.Trim()),
                    new SqlParameter("@IDTipoDoc", int.Parse(ddlTipoDoc.SelectedValue)),
                    new SqlParameter("@AreaResponsable", ddlAreaResponsable.SelectedValue),
                    new SqlParameter("@FechaCreacionDoc", Convert.ToDateTime(txtFechaEmision.Text)),
                    new SqlParameter("@CodigoDocumento", txtCodigoReferencia.Text.Trim()),
                    new SqlParameter("@RutaArchivo", rutaRelativa),
                    new SqlParameter("@DiasMaxRevision", diasMaxRev),
                    new SqlParameter("@IDUsuarioCreador", Session["strUsuario"].ToString()),
                    new SqlParameter("@IDEquipo", Request.UserHostAddress ?? "127.0.0.1"),
                    new SqlParameter("@JsonRevisores", jsonRevisores),
                    new SqlParameter("@JsonFirmantes", jsonFirmantes)
                };

                ConexionBD.EjecutarAccionFirma("USP_FIR_Documento_Registrar", pars);

                MostrarMensaje("El documento se ha registrado y enviado a flujo con éxito.", false);

                // Limpiar formulario o esconder paneles
                pnlSuccess.Visible = true;
                pnlError.Visible = false;

                // Redirigir luego de un rato o deshabilitar botón (opcional)
                btnRegistrar.Enabled = false;
            }
            catch (Exception ex)
            {
                MostrarMensaje("Ocurrió un error al registrar: " + ex.Message, true);
            }
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
