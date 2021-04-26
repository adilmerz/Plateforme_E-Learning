using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetFinFormationCoteWeb.Pages
{
    public partial class RédigerActualité : System.Web.UI.Page
    {
        Controllers ctr= new Controllers();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getActualite();
            }
        }

        void getActualite()
        {
            GridViewActualite.DataSource = ctr.Get("select id,titre,photo from actualite order by date desc");
            GridViewActualite.DataBind();
        }

        protected void BtnAjouter_Click1(object sender, EventArgs e)
        {
            

            
                string path = "";
                string extension = Path.GetExtension(FileUploadPhoto.FileName);
            string date = "" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Hour +
                          DateTime.Now.Minute + DateTime.Now.Second;
                string fileName = date + extension;
                path = HostingEnvironment.MapPath("~") + "photoActualité/" + fileName;


                string query = String.Format("insert into actualite(titre,date,photo,texte) values('{0}','{1}','{2}','{3}')", txtTitre.Text.Replace("'", "''"), txtDate.Text, fileName, txtParagraphe.Text.Replace("'", "''"));
                
                bool b = ctr.Set(query);

                if (b==true)
                {
                    FileUploadPhoto.SaveAs(path);
                    LabelValidation.Text = "Opération validé avec succés";
                    Response.Redirect("Rédiger_Actualité");
                }
                else
                {
                    LabelValidation.Text = "Opération non validé ";

                }
          
        }

        protected void GridViewActualite_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridViewActualite.Rows[e.RowIndex].Cells[0].Text;

            DataTable dt = ctr.Get("select photo from actualite where id=" + id);
           
            string query = String.Format("delete from actualite where id={0}", id);
            
            bool b = ctr.Set(query);

            string path = HostingEnvironment.MapPath("~") + "photoActualité/" + dt.Rows[0][0].ToString();
            if (b == true)
            {
                if (File.Exists(path))
                {
                    File.Delete(path);
                   
                }

                Response.Redirect("Rédiger_Actualité");
                
               
            }
            else
            {
               
                LabelGrid.Text = "Opération non validé ";
            }
        }

        protected void GridViewActualite_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewActualite.PageIndex = e.NewPageIndex;
            getActualite();
        }

       

        
    }
}