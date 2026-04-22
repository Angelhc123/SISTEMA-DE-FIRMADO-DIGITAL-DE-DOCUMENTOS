using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDF_ZOFRATACNA.Formularios.Documentos
{
    public partial class frmArchivoRegistrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["strUsuario"] == null)
            //{
            //    Response.Redirect("~/frmLogin.aspx");
            //}
            //if (!IsPostBack)
            //{
            //    if (litUsuario != null)
            //    {
            //        litUsuario.Text = Session["strUsuario"].ToString();
            //    }
            //}
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}