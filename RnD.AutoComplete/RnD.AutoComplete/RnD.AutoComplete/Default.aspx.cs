using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using RnD.AutoComplete.Model;

namespace RnD.AutoComplete
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        //public static string[] GetData(string term)
        public static string GetData(string term)
        {
            // Get data from database
            List<string> datas = new List<string> { "ASP.NET", "WebForms", "MVC", "jQuery", "ActionResult", "SQL", "Java", "Windows", "PHP" };

            var viewDatas = datas.Where(t => t.StartsWith(term)).ToArray();

            JavaScriptSerializer js = new JavaScriptSerializer();
            string jsDatas = js.Serialize(viewDatas);
            return jsDatas;

        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            try
            {
                var receipt = new Receipt { Name = "Hello World!", Qty = 5, Price = 10, Amount = 50 };

                //Now save it on the session

                Session["receipt"] = receipt;

                Response.Redirect("About.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
