using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetFinFormationCoteWeb.Pages
{
    public partial class TDM : System.Web.UI.Page
    {
        Controllers ctr = new Controllers();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetModule();
            }

        }

        private void GetModule()
        {
            RepeaterModuleTDM.DataSource = ctr.Get("select * from Module where idFil=3");
            RepeaterModuleTDM.DataBind();
        }

        protected void RepeaterModuleTDM_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "LinkModule")
            {
                var lablidM = (Label)e.Item.FindControl("lablidM");

                Response.Redirect("~/Pages/Cours.aspx/?idM=" + lablidM.Text + "&idFil=3");
            }


        }

    }
}