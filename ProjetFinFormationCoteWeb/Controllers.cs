using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;



namespace ProjetFinFormationCoteWeb
{
    public class Controllers
    {
        private SqlConnection _cn;
        private const String Str = "Data Source=.;Initial Catalog=DB_ELP;Integrated Security=True";

        public DataTable Get(String query)
        {
             try
                {
                 
                 using (_cn=new SqlConnection(Str))
            {
              
                    var cmd = new SqlCommand(query, _cn);
                    _cn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    var dt = new DataTable();
                    dt.Load(dr);
                    return dt;


            }
                }
             catch (Exception)
             {

                 return null;
             }


        }
        public Boolean Set(String query)
        {
            try
            {
            using (_cn = new SqlConnection(Str))
            {
                var cmd = new SqlCommand(query, _cn);
                 _cn.Open();
                 cmd.ExecuteNonQuery();
                 return true;
                

            }
                 }
             catch (Exception)
             {
                
                 return false;
             }

        }
       
        public String Alert(String msg)
        {
            


           return  String.Format("<script>alert('{0}');</script>", msg);

        }



     
    }
}