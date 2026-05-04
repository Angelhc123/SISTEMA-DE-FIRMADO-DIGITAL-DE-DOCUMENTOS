using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Evitar caché de página para arrancar limpio si se usa el botón "Atrás"
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();

            if (!IsPostBack)
            {
                Session.Clear();
                Session.Abandon();
            }
        }

        protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblError.Visible = false;
            if (string.IsNullOrEmpty(ddlRoles.SelectedValue))
            {
                ddlUsuarios.Items.Clear();
                ddlUsuarios.Items.Insert(0, new ListItem("-- Seleccione un usuario --", ""));
                ddlUsuarios.Enabled = false;
                return;
            }

            try
            {
                // Conectar a la BD administracion usando la cadena del Web.config
                string strConn = ConfigurationManager.ConnectionStrings["SDF_Administracion"].ConnectionString;
                
                // Consulta que cruza Empleado con FIR_UsuarioRol filtrando por CodigoRol
                string sql = @"
                    SELECT E.LoginUsuario, (E.Nombre + ' ' + E.Apellido) AS NombreCompleto, UR.CodigoRol
                    FROM Empleado E 
                    INNER JOIN FIR_UsuarioRol UR ON E.LoginUsuario = UR.LoginUsuario 
                    WHERE (UR.CodigoRol = @CodigoRol OR (@CodigoRol = 'FIRMADOR_REVISOR' AND UR.CodigoRol IN ('FIRMADOR', 'REVISOR')))
                      AND UR.Activo = 1";

                using (SqlConnection cn = new SqlConnection(strConn))
                using (SqlCommand cmd = new SqlCommand(sql, cn))
                {
                    cmd.Parameters.AddWithValue("@CodigoRol", ddlRoles.SelectedValue);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        ddlUsuarios.DataSource = dt;
                        ddlUsuarios.DataTextField = "NombreCompleto";
                        ddlUsuarios.DataValueField = "LoginUsuario";
                        ddlUsuarios.DataBind();
                    }
                }

                ddlUsuarios.Items.Insert(0, new ListItem("-- Seleccione un usuario --", ""));
                ddlUsuarios.Enabled = true;
            }
            catch (Exception ex)
            {
                lblError.Text = "Error al cargar usuarios: " + ex.Message;
                lblError.Visible = true;
                ddlUsuarios.Enabled = false;
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;

            if (string.IsNullOrEmpty(ddlRoles.SelectedValue) || string.IsNullOrEmpty(ddlUsuarios.SelectedValue))
            {
                lblError.Text = "Debe seleccionar un Rol y un Usuario correctos.";
                lblError.Visible = true;
                return;
            }

            try
            {
                string loginUsuario = ddlUsuarios.SelectedValue;
                string rol = ddlRoles.SelectedValue;
                string nombreCompleto = ddlUsuarios.SelectedItem.Text;

                int idRol = 0;
                string perfilCorto = "";
                string unidadOrganica = "Área General";
                string urlDestino = "";

                // Recibimos el CodigoRol real desde el nombre concatenado que hicimos en la consulta, o directamente lo filtramos 
                // En este caso nos apoyaremos del StringSplit para derivarlo o aplicamos logica básica (Asumimos Firmador si es el mismo dashboard).
                // Con la actualizacion, Firmadores y Revisores son lo mismo operativamente:
                switch (rol)
                {
                    case "ADMIN":
                        idRol = 1; 
                        perfilCorto = "ADMIN";
                        urlDestino = "~/Formularios/Administracion/frmDashboardAdmin.aspx";
                        break;
                    case "REGISTRADOR":
                        idRol = 10; 
                        perfilCorto = "REG";
                        urlDestino = "~/Formularios/Documentos/frmDashboardRegistrador.aspx";
                        break;
                    case "FIRMADOR_REVISOR":
                        idRol = 17; // id genérico compartido o puedes derivar
                        perfilCorto = "FIR"; // O REV
                        // Ambos accederan a su propio Dashboard unificado o se manda al de Firmante por ahora:
                        urlDestino = "~/Formularios/Firma/frmDashboardFirmante.aspx";
                        break;
                }

                // Generar los valores de sesión (tal como los tenías de demo)
                Session["IdUsuario"] = loginUsuario;
                Session["Nombres"] = nombreCompleto;
                Session["strUsuario"] = loginUsuario;
                Session["Rol"] = perfilCorto;
                Session["UnidadOrganica"] = unidadOrganica;
                Session["IDRol"] = idRol;          
                Session["RolDescripcion"] = ddlRoles.SelectedItem.Text;
                Session["UrlFoto"] = "";

                Response.Redirect(urlDestino, false);
            }
            catch (Exception ex)
            {
                lblError.Text = "Error al iniciar sesión: " + ex.Message;
                lblError.Visible = true;
            }
        }
    }
}



