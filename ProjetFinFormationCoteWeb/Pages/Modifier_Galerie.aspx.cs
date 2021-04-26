using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetFinFormationCoteWeb.Pages
{
    public partial class Modifier_Galerie : System.Web.UI.Page
    { 
        Controllers ctr = new Controllers();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RemplirGrid();
            }
        }

        void RemplirGrid()
        {
            GridViewGalerie.DataSource = ctr.Get("select id , path from galerie order by dateup desc");
            GridViewGalerie.DataBind();
        }
        protected void BtnAjouter_Click(object sender, EventArgs e)
        {

            string path = "";
            string fileName =  "Galerie/" + FileUploadPhoto.FileName.Replace(" ","").Replace("'","");
            path = HostingEnvironment.MapPath("~")+fileName ;
            

            string query = String.Format("insert into galerie (path,dateup) values('{0}','{1}')", fileName, DateTime.Now);

            bool b = ctr.Set(query);

            if (b == true)
            {
                FileUploadPhoto.SaveAs(path);

                Response.Redirect("Modifier_Galerie");
            }
            else
            {
                LabelValidation.Text = "Opération non validé ";
            }
        }

        protected void GridViewGalerie_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridViewGalerie.Rows[e.RowIndex].Cells[0].Text;

            DataTable dt = ctr.Get("select path from galerie where id=" + id);

            string path = HostingEnvironment.MapPath("~") + dt.Rows[0][0].ToString();

            string query = String.Format("delete from galerie where id={0}", id);

            bool b = ctr.Set(query);

            if (b == true)
            {
                if (File.Exists(path))
                {
                    File.Delete(path);

                }
                Response.Redirect("Modifier_Galerie");
            }
            else
            {
                LabelGrid.Text = "Opération non validé ";
            }

        }

       
    }
}