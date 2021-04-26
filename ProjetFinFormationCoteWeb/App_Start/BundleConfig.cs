using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace ProjetFinFormationCoteWeb
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254726
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                  "~/Scripts/WebForms/WebForms.js",
                  "~/Scripts/WebForms/WebUIValidation.js",
                  "~/Scripts/WebForms/MenuStandards.js",
                  "~/Scripts/WebForms/Focus.js",
                  "~/Scripts/WebForms/GridView.js",
                  "~/Scripts/WebForms/DetailsView.js",
                  "~/Scripts/WebForms/TreeView.js",
                  "~/Scripts/WebForms/WebParts.js"));

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                       "~/Scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            bundles.Add(new StyleBundle("~/bundles/MasterPage").Include(
                 "~/MasterPages/css/style.blue.css",
                 "~/MasterPages/css/custom.css",
                 "~/MasterPages/css/fontastic.css"
                 
                 ));

            bundles.Add(new ScriptBundle("~/bundles/Mspages").Include(
             "~/MasterPages/js/front.js"
             
             
             ));

            bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
                "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

           


            // Use the Development version of Modernizr to develop with and learn from. Then, when you’re
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need
            //bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
            //    "~/Scripts/modernizr-*"));
        }
    }
}