using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// ============================================================
// Nombre del programa  : frmConfiguracionAdmin
// Descripción          : Formulario de configuración del sistema
//                        para el Administrador. Permite el
//                        mantenimiento de la tabla GEN_Maestro
//                        (estados, roles y valores globales).
// Fecha desarrollo     : 24/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// Fecha mantenimiento  :
// Persona que lo realizó:
// Nro. solicitud mant. :
// Descripción mant.    :
// ============================================================

namespace SDF_ZOFRATACNA.Formularios.Administracion
{
    public partial class frmConfiguracionAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Compatibilidad mockup: asignar sesión por defecto si está vacía
                if (Session["Nombres"] == null)
                {
                    Session["Nombres"] = "Administrador Zofra";
                }

                // Mostrar nombre del usuario en la interfaz
                if (litUsuario != null)
                {
                    litUsuario.Text = Session["Nombres"].ToString();
                }

                // Cargar datos iniciales de la grilla
                CargarDatos();
            }
        }

        /// <summary>
        /// Carga los registros de la tabla GEN_Maestro.
        /// En producción se llama al SP USP_GEN_MAESTRO_LISTAR con el filtro indicado.
        /// </summary>
        private void CargarDatos(string strFiltro = "")
        {
            // Tabla de datos para GEN_Maestro (dt → DataTable)
            DataTable dtMaestro = new DataTable();
            dtMaestro.Columns.Add("Cod_Maestro");
            dtMaestro.Columns.Add("Dominio");
            dtMaestro.Columns.Add("Descripcion");
            dtMaestro.Columns.Add("Valor_Fisico");
            dtMaestro.Columns.Add("Ind_Activo", typeof(bool));

            // Datos de demostración (simulación BD)
            dtMaestro.Rows.Add("EST-001", "ESTADOS_DOC", "Pendiente de Firma",    "PND",     true);
            dtMaestro.Rows.Add("EST-002", "ESTADOS_DOC", "Firmado Digitalmente",  "FRM",     true);
            dtMaestro.Rows.Add("ROL-010", "ROLES_SYS",   "Gerente General",       "GG",      true);
            dtMaestro.Rows.Add("ROL-011", "ROLES_SYS",   "Asistente Externo",     "AST_EXT", false);

            // Enlazar al Repeater de catálogos
            rptCatalogos.DataSource = dtMaestro;
            rptCatalogos.DataBind();
        }

        protected void rptCatalogos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                // Recuperar código del registro seleccionado (string → str)
                string strCodigo = e.CommandArgument.ToString();

                txtCodigoInterno.Text     = strCodigo;
                txtCodigoInterno.ReadOnly = true;
                litModo.Text = $"<p class='text-xs text-primary font-bold'>Editando código {strCodigo}</p>";

                // Cargar campos de ejemplo (en producción se consulta la BD)
                txtDominio.Text      = "ESTADOS_DOC";
                txtDescripcion.Text  = "Ejemplo de descripción recuperada";
                txtValor.Text        = "EXP";
                chkActivo.Checked    = true;
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            // Limpiar formulario y habilitar el campo de código para nuevo registro
            LimpiarFormulario();
            txtCodigoInterno.ReadOnly = false;
            litModo.Text = "<p class='text-xs text-error font-bold'>Creando Nuevo Registro</p>";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // TODO: Llamar al SP USP_GEN_MAESTRO_GUARDAR con los valores del formulario
            // Refrescar grilla tras guardar
            CargarDatos();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertGuardar", "alert('Registro guardado correctamente');", true);
        }

        protected void txtBusqueda_TextChanged(object sender, EventArgs e)
        {
            // Recargar la grilla con el filtro ingresado
            CargarDatos(txtBusqueda.Text);
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            // Limpiar sesión y redirigir al login
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }

        /// <summary>
        /// Limpia todos los campos del formulario de edición.
        /// </summary>
        private void LimpiarFormulario()
        {
            txtCodigoInterno.Text = "";
            txtDominio.Text       = "";
            txtDescripcion.Text   = "";
            txtValor.Text         = "";
            chkActivo.Checked     = true;
        }
    }
}