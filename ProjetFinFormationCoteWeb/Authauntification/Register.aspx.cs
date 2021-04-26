using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetFinFormationCoteWeb.Views.Authauntification
{
    public partial class Register : System.Web.UI.Page
    {  
        Controllers ctr = new Controllers();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var parameters = new ParameterCollection
            {
                {"nom", txtNom.Text},
                {"prenom", txtPrenom.Text},
                {"email", txtMail.Text},
                {"password", txtPw.Text}
            };

            String query = String.Format("insert into Utilisateur(nom,prenom,email,password,idT) values('{0}','{1}','{2}','{3}',3)",txtNom.Text,txtPrenom.Text,txtMail.Text,txtPw.Text);

            if (ctr.Set(query))
            {
                ctr.Alert("Succes");
                Response.Redirect("Login.aspx");
            }
            else
            {
                ctr.Alert("Verifier Votre information");
            }

            

        }
    }
}