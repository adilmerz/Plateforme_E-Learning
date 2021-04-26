using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetFinFormationCoteWeb.Pages
{
    public partial class Actualités : System.Web.UI.Page
    {
        Controllers ctr= new Controllers();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetActualite();
            }
            
        }

        void GetActualite()
        {
            RepeaterActualites.DataSource = ctr.Get("select * from actualite order by date desc");
            RepeaterActualites.DataBind();
        }
    }
}