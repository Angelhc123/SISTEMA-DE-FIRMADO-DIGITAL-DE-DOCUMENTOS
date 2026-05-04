using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using SDF_ZOFRATACNA.Models;

namespace SDF_ZOFRATACNA.Formularios.Documentos
{
    public partial class frmRegistrarDocumento : System.Web.UI.Page
    {
        // Listas en memoria para ViewState
        [Serializable]
        public class PersonaViewModel
        {
            public string LoginUsuario { get; set; }
            public string NombreCompleto { get; set; }
            public string Email { get; set; }
            public string CodigoRol { get; set; }
            public int Orden { get; set; }
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
            // 1. Verificar sesión SIEMPRE (tanto en la primera carga como en PostBacks)
            if (Session["strUsuario"] == null)
            {
                Response.Redirect("~/frmLogin.aspx");
                return;
            }

            // 2. Carga inicial del formulario
            if (!IsPostBack)
            {
                litUsuario.Text = Session["Nombres"]?.ToString() ?? "Registrador";
                txtFechaEmision.Text = DateTime.Now.ToString("yyyy-MM-dd");

                CargarTiposDocumento();
                CargarAreasResponsables();
                CargarUsuariosFirmantes();
            }
        }

        private void CargarTiposDocumento()
        {
            try
            {
                var dt = FIR_Maestro.ListarPorTipo("TIPO_DOC");

                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlTipoDoc.DataSource = dt;
                    ddlTipoDoc.DataTextField = "Descripcion";
                    ddlTipoDoc.DataValueField = "Codigo";
                    ddlTipoDoc.DataBind();
                }

                ddlTipoDoc.Items.Insert(0, new ListItem("-- Seleccione --", ""));
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar Tipos: " + ex.Message, true);
            }
        }

        private void CargarAreasResponsables()
        {
            try
            {
                ddlAreaResponsable.Items.Clear();
                ddlAreaResponsable.Items.Add(new ListItem("-- Seleccione --", ""));
                ddlAreaResponsable.Items.Add(new ListItem("Gerencia General", "Gerencia General"));
                ddlAreaResponsable.Items.Add(new ListItem("Asesoría Legal", "Asesoría Legal"));
                ddlAreaResponsable.Items.Add(new ListItem("Administración", "Administración"));
                ddlAreaResponsable.Items.Add(new ListItem("Operaciones", "Operaciones"));
                ddlAreaResponsable.Items.Add(new ListItem("Sub-Gerencia Administrativa", "Sub-Gerencia Administrativa"));
                ddlAreaResponsable.Items.Add(new ListItem("Secretaria General", "Secretaria General"));
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar Áreas: " + ex.Message, true);
            }
        }

        private void CargarUsuariosFirmantes()
        {
            try
            {
                var dt = FIR_UsuarioPrueba.ListarFirmantes();

                ddlFirmante.Items.Clear();
                ddlFirmante.Items.Add(new ListItem("-- Añadir Firmante --", ""));

                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (System.Data.DataRow row in dt.Rows)
                    {
                        string login = row["LoginUsuario"].ToString();
                        string nombre = row["NombreCompleto"].ToString();
                        string email = row["Email"].ToString();
                        string rol = row["CodigoRol"].ToString();

                        ddlFirmante.Items.Add(new ListItem(
                            $"{nombre} - {rol}",
                            $"{login}|{nombre}|{email}|{rol}"
                        ));
                    }
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar Firmantes: " + ex.Message, true);
            }
        }

        protected void btnAddFirmante_Click(object sender, EventArgs e)
        {
            if (ddlFirmante.SelectedIndex > 0 && !string.IsNullOrEmpty(ddlFirmante.SelectedValue))
            {
                string val = ddlFirmante.SelectedValue;
                string[] parts = val.Split('|');

                if (parts.Length >= 4)
                {
                    string login = parts[0];
                    string nombre = parts[1];
                    string email = parts[2];
                    string rol = parts[3];

                    var list = ListaFirmantes;

                    if (!list.Exists(x => x.LoginUsuario == login))
                    {
                        list.Add(new PersonaViewModel
                        {
                            LoginUsuario = login,
                            NombreCompleto = nombre,
                            Email = email,
                            CodigoRol = rol,
                            Orden = list.Count + 1
                        });

                        ListaFirmantes = list;
                        rptFirmantes.DataSource = list;
                        rptFirmantes.DataBind();

                        ddlFirmante.SelectedIndex = 0;
                    }
                    else
                    {
                        MostrarMensaje("Este firmante ya ha sido agregado.", true);
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

            // Reordenar
            for (int i = 0; i < list.Count; i++)
                list[i].Orden = i + 1;

            ListaFirmantes = list;
            rptFirmantes.DataSource = list;
            rptFirmantes.DataBind();
        }

        protected void cvFirmantes_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = ListaFirmantes.Count > 0;
            if (!args.IsValid)
                MostrarMensaje("Debe agregar al menos un firmante.", true);
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
                MostrarMensaje("El archivo debe ser PDF.", true);
                return;
            }

            // Cambiado a 45MB para soportar archivos pesados, acorde al Web.config
            if (fileUploadPDF.PostedFile.ContentLength > 45 * 1024 * 1024)
            {
                MostrarMensaje("El archivo no puede superar los 45MB.", true);
                return;
            }

            if (ListaFirmantes.Count == 0)
            {
                cvFirmantes_ServerValidate(null, new ServerValidateEventArgs("", false));
                return;
            }

            try
            {
                // Guardar archivo temporal
                string tempFolder = Server.MapPath("~/Temp/");
                if (!Directory.Exists(tempFolder))
                    Directory.CreateDirectory(tempFolder);

                string tempFile = Path.Combine(tempFolder, Guid.NewGuid().ToString() + ".pdf");
                fileUploadPDF.SaveAs(tempFile);

                // Construir lista de firmantes
                var firmantes = new List<FIR_Documento.FirmanteJson>();
                foreach (var f in ListaFirmantes)
                {
                    firmantes.Add(new FIR_Documento.FirmanteJson
                    {
                        IDUsuarioFirmante = f.LoginUsuario,
                        NombreFirmante = f.NombreCompleto,
                        CorreoFirmante = f.Email,
                        Orden = f.Orden,
                        CodigoRol = "VB" // <- FIX: Pasamos validación de 'AUT', 'CON', 'VB'. Asumimos 'Visto Bueno' por defecto.
                    });
                }

                // Registrar documento usando modelo
                int idDocumento = FIR_Documento.Registrar(
                    asunto: txtAsunto.Text.Trim(),
                    codigoTipoDocumento: ddlTipoDoc.SelectedValue,
                    areaResponsable: ddlAreaResponsable.SelectedValue,
                    fechaDocumento: Convert.ToDateTime(txtFechaEmision.Text),
                    codigoDocumento: txtCodigoReferencia.Text.Trim(),
                    rutaArchivoPDF: tempFile,
                    loginRegistrador: Session["strUsuario"].ToString(),
                    idEquipo: Request.UserHostAddress ?? Environment.MachineName,
                    firmantes: firmantes
                );

                if (idDocumento > 0)
                {
                    MostrarMensaje("✓ Documento registrado correctamente.", false);
                    LimpiarFormulario();

                    string script = @"
                        setTimeout(function() {
                            window.location.href = 'frmMisDocumentos.aspx';
                        }, 2000);";
                    ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                }
                else
                {
                    MostrarMensaje("Error al registrar el documento.", true);
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error: " + ex.Message, true);
            }
        }

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