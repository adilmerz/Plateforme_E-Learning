using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

namespace ProjetFinFormationCoteWeb.Pages
{
    public partial class Forum : System.Web.UI.Page
    {
        private Controllers ctr = new Controllers();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDiscussions();

            }
        }


        private void getDiscussions()
        {
            string query = @"SELECT idP, (Utilisateur.nom+' '+ Utilisateur.prenom) AS nomComplet, typeusers.nom AS typeusers, publication.datePub, publication.publication , publication.nbrCmt
                        FROM Utilisateur INNER JOIN typeusers ON Utilisateur.idT = typeusers.idT INNER JOIN publication ON Utilisateur.idU = publication.idU";
            RepeaterDiscussion.DataSource = ctr.Get(query);
            RepeaterDiscussion.DataBind();

        }

        protected void ItemBound(object sender, RepeaterItemEventArgs args)
        {
            if (args.Item.ItemType == ListItemType.Item || args.Item.ItemType == ListItemType.AlternatingItem)
            {
                var RepeaterCommentaires = (Repeater) args.Item.FindControl("RepeaterCommentaires");
                var lblidP = (Label) args.Item.FindControl("lblidP");
                string query =
                    String.Format(@"SELECT idR, (Utilisateur.nom+' '+ Utilisateur.prenom) AS nomc, typeusers.nom AS typeusers, commentaire.commentaire, commentaire.dateCmt
              FROM commentaire INNER JOIN Utilisateur ON commentaire.idU = Utilisateur.idU INNER JOIN typeusers ON Utilisateur.idT = typeusers.idT INNER JOIN
              publication ON commentaire.idP = publication.idP WHERE (publication.idP = {0}) order by commentaire.dateCmt Desc",
                        lblidP.Text);

                RepeaterCommentaires.Visible = false;
                RepeaterCommentaires.DataSource = ctr.Get(query);
                RepeaterCommentaires.DataBind();



            }
        }

        protected void RepeaterDiscussion_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var RepeaterCommentaires = (Repeater) e.Item.FindControl("RepeaterCommentaires");
            var txtParagraphe = (TextBox) e.Item.FindControl("txtParagraphe");
            var lblidP = (Label) e.Item.FindControl("lblidP");
            //  var lblidCmt = (Label)e.Item



            if (e.CommandName == "BtnViewCmt")
            {

                if (RepeaterCommentaires.Visible)
                    RepeaterCommentaires.Visible = false;
                else
                    RepeaterCommentaires.Visible = true;
            }
            if (e.CommandName == "BtnSendCmt")
            {

                if (txtParagraphe.Text != "")
                {
                    string query =String.Format( "insert into commentaire(idP,commentaire,dateCmt,idU) values({0},'{1}','{2}','{3}')",
                            lblidP.Text, txtParagraphe.Text.Replace("'", "''"), DateTime.Now, 1);


                    bool b = ctr.Set(query);

                    if (b == false)
                    {

                       string msg = ctr.Alert("Opération non validé ");
                        Response.Write(msg);

                    }
                    else
                    {
                        getDiscussions();
                        txtParagraphe.Text = "";
                    }

                }


            }

        }



        //---------------------------------------
        protected void RepeaterCommentaires_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
         
            var lblidCmt = (Label) e.Item.FindControl("lblidCmt");



            if (e.CommandName == "btn")
            {

                string query = "delete from commentaire where idR ="+lblidCmt.Text;


                bool b = ctr.Set(query);

                if (b == false)
                {

                    string msg = ctr.Alert("Opération non validé ");
                    Response.Write(msg);
                    

                }
                else
                {
                    getDiscussions();
                  
                }


            }


        }


    }
}