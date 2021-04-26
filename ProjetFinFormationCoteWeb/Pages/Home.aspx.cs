using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetFinFormationCoteWeb.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        Controllers ctr= new Controllers();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetImage();
            GetActualite();

        }

        void GetImage()
        {
            RepeaterImage.DataSource = ctr.Get("select path from galerie order by dateup desc");
            RepeaterImage.DataBind();
        }
        void GetActualite()
        {
            RepeaterActualite.DataSource = ctr.Get("select top 1 * from actualite order by date desc");
            RepeaterActualite.DataBind();
        }

    }
}