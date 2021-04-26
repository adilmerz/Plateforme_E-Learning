using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjetFinFormationCoteWeb;

namespace MonProjet
{
    public partial class Login : System.Web.UI.Page
    {
        Controllers ctr = new Controllers();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable dt = null;
            dt = ctr.Get(String.Format("select * from Utilisateur where email='{0}' and password='{1}'",txtMail.Text,txtPw.Text));

            if (dt.Rows.Count>0)
            {
                Response.Redirect("~/Pages/Home");
            }
            else
            {
                String message = "Mot de passe ou identifiant Incorrect";

               Response.Write(ctr.Alert(message));
            }

            
        }
    }
}