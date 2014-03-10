using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RnD.AutoComplete.Model;

namespace RnD.AutoComplete
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Receipt receipt = null;
            if (Session["receipt"] != null)
            {
                receipt = (Receipt)Session["receipt"];

                this.tdName.InnerText = receipt.Name;
                this.tdQty.InnerText = receipt.Qty.ToString();
                this.tdPrice.InnerText = receipt.Price.ToString();
                this.tdAmount.InnerText = receipt.Amount.ToString();
            }
        }
    }
}
