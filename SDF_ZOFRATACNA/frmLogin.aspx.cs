using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SDF_ZOFRATACNA.App_Code.DAL;

namespace SDF_ZOFRATACNA.Recursos
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Opcional: Limpiar mensajes al cargar
            lblMessage.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string rolSeleccionado = ddlRol.SelectedValue;
            string correo = txtUsername.Text.Trim();
            string clave = txtPassword.Text.Trim();

            // Validación simple de campos vacíos
            if (string.IsNullOrEmpty(rolSeleccionado) || string.IsNullOrEmpty(correo) || string.IsNullOrEmpty(clave))
            {
                lblMessage.Text = "Por favor, complete todos los campos.";
                lblMessage.Visible = true;
                return;
            }

            try
            {
                // Parámetros para el Procedimiento Almacenado
                System.Data.SqlClient.SqlParameter[] pars = new System.Data.SqlClient.SqlParameter[]
                {
                    new System.Data.SqlClient.SqlParameter("@Correo", correo),
                    new System.Data.SqlClient.SqlParameter("@Clave", clave)
                };

                // Ejecución mediante la DAL (Capa de Acceso a Datos)
                System.Data.DataTable dtUsuario = ConexionBD.EjecutarConsultaFirma("USP_FIR_Usuario_Login", pars);

                if (dtUsuario != null && dtUsuario.Rows.Count > 0)
                {
                    string idUsuario = dtUsuario.Rows[0]["IDUsuario"].ToString();
                    string rolBD = dtUsuario.Rows[0]["Rol"].ToString();

                    // Opcional: Validar que el rol en BD coincida con el seleccionado (o usar el de la BD directamente)
                    // Para este ejemplo, usaremos el de la BD para redirigir
                    
                    Session["IDUsuario"] = idUsuario;
                    Session["Correo"] = correo;
                    Session["Rol"] = rolBD;

                    // Redirección basada en el ROL de la Base de Datos
                    switch (rolBD.ToUpper())
                    {
                        case "ADMIN":
                        case "ADMINISTRADOR":
                            Response.Redirect("/Formularios/Administracion/frmDashboardAdmin.aspx");
                            break;
                        case "REG":
                        case "REGISTRADOR":
                            Response.Redirect("/Formularios/Documentos/frmDashboardRegistrador.aspx");
                            break;
                        case "FIR":
                        case "FIRMATE":
                        case "FIRMADOR":
                        case "SIG":
                            Response.Redirect("/Formularios/Firma/frmDashboardFirmante.aspx");
                            break;
                        default:
                            lblMessage.Text = "Su rol no tiene un panel asignado.";
                            lblMessage.Visible = true;
                            break;
                    }
                }
                else
                {
                    lblMessage.Text = "Credenciales incorrectas o cuenta inactiva.";
                    lblMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error técnico: " + ex.Message;
                lblMessage.Visible = true;
            }
        }
    }
}