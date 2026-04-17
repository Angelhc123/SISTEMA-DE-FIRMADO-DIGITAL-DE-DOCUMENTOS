using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Documentos
{
    public partial class frmRegistrarDocumento : System.Web.UI.Page
    {
                protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["strUsuario"] = "Usuario Registrador";
                if (Session["strUsuario"] != null)
                {
                    litUsuario.Text = Session["strUsuario"].ToString();
                }
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
