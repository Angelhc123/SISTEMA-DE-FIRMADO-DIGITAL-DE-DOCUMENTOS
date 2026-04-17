using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Revision
{
    public partial class frmInterfazRevisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Aquí podrías cargar datos de la base de datos
                CargarDatosExpediente();
            }
        }

        private void CargarDatosExpediente()
        {
            // Ejemplo de carga dinámica
            lblExpedienteTitulo.Text = "Revisión de Expediente #EXP-2026-0012";
            lblRemitente.Text = "Dra. Ana López (Gerencia)";
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            string comentario = txtObservaciones.Text.Trim();

            // Lógica para guardar el Visto Bueno en BD
            // Response.Write("<script>alert('Expediente aprobado correctamente');</script>");
        }

        protected void btnObservar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtObservaciones.Text))
            {
                // Validación: Si observa, debe comentar por qué
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Debe indicar el motivo de la observación');", true);
                return;
            }

            // Lógica para devolver el documento
            string motivo = txtObservaciones.Text;
            // Ejecutar procedimiento almacenado...
        }
    }
}