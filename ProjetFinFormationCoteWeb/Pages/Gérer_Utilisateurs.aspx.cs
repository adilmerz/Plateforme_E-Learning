using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetFinFormationCoteWeb.Pages
{
    public partial class Gérer_Utilisateurs : System.Web.UI.Page
    {       
        Controllers ctr=new Controllers();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               getUser(); 
            }
            
        }

        void getUser()
        {
            comboType.DataSource = ctr.Get("select * from typeusers ");
            comboType.DataValueField = "idT";
            comboType.DataTextField = "nom";
            comboType.DataBind();

            //----DropDownFilter--------/
            comboFilter.DataSource = ctr.Get("select * from typeusers ");
            comboFilter.DataValueField = "nom";
            comboFilter.DataTextField = "nom";
            comboFilter.DataBind();
            comboFilter.Items.Insert(0,"Afficher Tous");




            string query = @"SELECT Utilisateur.idU, Utilisateur.nom, Utilisateur.prenom, Utilisateur.email, Utilisateur.password, typeusers.nom AS nomT
                            FROM  typeusers INNER JOIN Utilisateur ON typeusers.idT = Utilisateur.idT";

            GridViewUsers.DataSource = ctr.Get(query);
            GridViewUsers.DataBind();

        }

        protected void GridViewUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtID.Text = GridViewUsers.SelectedRow.Cells[0].Text;
            txtNom.Text = GridViewUsers.SelectedRow.Cells[1].Text;
            txtPrenom.Text = GridViewUsers.SelectedRow.Cells[2].Text;
            txtMail.Text = GridViewUsers.SelectedRow.Cells[3].Text;
            txtPw.Text = GridViewUsers.SelectedRow.Cells[4].Text;
            comboType.SelectedItem.Text = GridViewUsers.SelectedRow.Cells[5].Text;

            ScriptManager.RegisterStartupScript(Page, typeof(Page), "ScrollToADiv", "setTimeout(scrollToDiv, 1);", true);

           

        }

        protected void ButtonVider_Click(object sender, EventArgs e)
        {
            Vider();
        }

        private void Vider()
        {
            txtID.Text = "";
            txtNom.Text = "";
            txtPrenom.Text = "";
            txtMail.Text = "";
            txtPw.Text = "";
            comboType.SelectedIndex = 2;
            LabelValidation.Text = "";
            LabelGrid.Text = "";
        }

        protected void BtnAjouter_Click(object sender, EventArgs e)
        {
            string query = String.Format("insert into utilisateur(nom,prenom,email,password,idT) values('{0}','{1}','{2}','{3}',{4})",txtNom.Text,txtPrenom.Text,txtMail.Text,txtPw.Text,comboType.SelectedValue);
            bool b = ctr.Set(query);
            if (b == true)
            {
                getUser();
                Vider();
                LabelValidation.Text = "Opération validé avec succés";
            }
            else
            {

                LabelValidation.Text = "Opération non validé ";

            }
        }

        protected void BtnModifier_Click(object sender, EventArgs e)
        {
            string query = String.Format("update utilisateur set nom='{0}' ,prenom='{1}' ,email='{2}' ,password ='{3}' ,idT={4} where idU={5}", txtNom.Text, txtPrenom.Text, txtMail.Text, txtPw.Text, comboType.SelectedValue,txtID.Text);
            bool b = ctr.Set(query);
            if (b == true)
            {

                getUser();
                Vider();
                LabelValidation.Text = "Opération validé avec succés";
               
            }
            else
            {
                LabelValidation.Text = "Opération non validé ";

            }
        }

        protected void BtnSupprimer_Click(object sender, EventArgs e)
        {
            string query = String.Format("delete from utilisateur  where idU={0}",  txtID.Text);
            bool b = ctr.Set(query);
            if (b == true)
            {

                getUser();
                Vider();
                LabelValidation.Text = "Opération validé avec succés";
            }
            else
            {
                LabelValidation.Text = "Opération non validé ";

            }
        }

        protected void BtnChercher_Click(object sender, EventArgs e)
        {
            string query = @"SELECT Utilisateur.idU, Utilisateur.nom, Utilisateur.prenom, Utilisateur.email, Utilisateur.password, typeusers.nom AS nomT
                            FROM  typeusers INNER JOIN Utilisateur ON typeusers.idT = Utilisateur.idT where Utilisateur.nom like '%"+txtCherch.Text+"%'";

            GridViewUsers.DataSource = ctr.Get(query);
            GridViewUsers.DataBind();
        }

        protected void comboFilter_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (comboFilter.SelectedIndex != 0)
            {
                string query =
                    @"SELECT Utilisateur.idU, Utilisateur.nom, Utilisateur.prenom, Utilisateur.email, Utilisateur.password, typeusers.nom AS nomT
                            FROM  typeusers INNER JOIN Utilisateur ON typeusers.idT = Utilisateur.idT where typeusers.nom like '%" +
                    comboFilter.SelectedValue + "%'";

                GridViewUsers.DataSource = ctr.Get(query);
                GridViewUsers.DataBind();
            }
            else
            {
                getUser();
            }
            


        }

        protected void GridViewUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewUsers.PageIndex = e.NewPageIndex;
            getUser();
        }

       

       

      

      
    }
}