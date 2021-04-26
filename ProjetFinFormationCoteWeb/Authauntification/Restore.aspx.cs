using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetFinFormationCoteWeb.Views.Authauntification
{
    public partial class Restore : System.Web.UI.Page
    {
        Controllers ctr= new Controllers();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRestore_Click(object sender, EventArgs e)
        {
            DataTable dt = null;
            dt = ctr.Get(String.Format("select password  from Utilisateur where email='{0}' and nom='{1}' and prenom='{2}'", txtMail.Text, txtNom.Text,txtPrenom.Text));

            if (dt.Rows.Count > 0)
            {
                txtPw.Text = dt.Rows[0][0].ToString();
            }
            else
            {
                String message = "Informations sont Incorrect";

                Response.Write(ctr.Alert(message));
            }
        }
    }
}