using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Administracion
{
    public partial class frmConfiguracionAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // TODO: Dummy session for testing
                if (Session["strUsuario"] == null)
                {
                    Session["strUsuario"] = "Administrador Zofra";
                }

                if (litUsuario != null)
                {
                    litUsuario.Text = Session["strUsuario"].ToString();
                }

                CargarDatos();
            }
        }

        private void CargarDatos(string filtro = "")
        {
            // Simulación de datos de la tabla GEN_Maestro
            // En producción, aquí llamas a tu procedimiento almacenado USP_GEN_MAESTRO_LISTAR
            DataTable dt = new DataTable();
            dt.Columns.Add("Cod_Maestro");
            dt.Columns.Add("Dominio");
            dt.Columns.Add("Descripcion");
            dt.Columns.Add("Valor_Fisico");
            dt.Columns.Add("Ind_Activo", typeof(bool));

            dt.Rows.Add("EST-001", "ESTADOS_DOC", "Pendiente de Firma", "PND", true);
            dt.Rows.Add("EST-002", "ESTADOS_DOC", "Firmado Digitalmente", "FRM", true);
            dt.Rows.Add("ROL-010", "ROLES_SYS", "Gerente General", "GG", true);
            dt.Rows.Add("ROL-011", "ROLES_SYS", "Asistente Externo", "AST_EXT", false);

            rptCatalogos.DataSource = dt;
            rptCatalogos.DataBind();
        }

        protected void rptCatalogos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string codigo = e.CommandArgument.ToString();
                // Aquí buscarías el registro específico por ID
                txtCodigoInterno.Text = codigo;
                txtCodigoInterno.ReadOnly = true;
                litModo.Text = $"<p class='text-xs text-primary font-bold'>Editando código {codigo}</p>";

                // Cargar campos de prueba
                txtDominio.Text = "ESTADOS_DOC";
                txtDescripcion.Text = "Ejemplo de descripción recuperada";
                txtValor.Text = "EXP";
                chkActivo.Checked = true;
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
            txtCodigoInterno.ReadOnly = false;
            litModo.Text = "<p class='text-xs text-error font-bold'>Creando Nuevo Registro</p>";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // Lógica para guardar en DB
            // string desc = txtDescripcion.Text;
            // bool estado = chkActivo.Checked;

            // Refrescar grilla
            CargarDatos();
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Registro guardado correctamente');", true);
        }

        protected void txtBusqueda_TextChanged(object sender, EventArgs e)
        {
            CargarDatos(txtBusqueda.Text);
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }

        private void LimpiarFormulario()
        {
            txtCodigoInterno.Text = "";
            txtDominio.Text = "";
            txtDescripcion.Text = "";
            txtValor.Text = "";
            chkActivo.Checked = true;
        }
    }
}