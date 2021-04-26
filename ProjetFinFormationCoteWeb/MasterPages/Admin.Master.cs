using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetFinFormationCoteWeb
{
    public partial class Admin : System.Web.UI.MasterPage
    {

        public string pageName;
        protected void Page_Load(object sender, EventArgs e)
        {
            pageName = Path.GetFileNameWithoutExtension(Page.AppRelativeVirtualPath);
        }
    }
}