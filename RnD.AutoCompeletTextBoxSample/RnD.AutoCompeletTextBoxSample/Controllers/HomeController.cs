using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RnD.AutoCompeletTextBoxSample.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            return View();
        }

        public JsonResult GetData(string term)
        {
            // Get data from database
            string[] datas = { "ASP.NET", "WebForms", "MVC", "jQuery", "ActionResult", "SQL", "Java", "Windows", "PHP" };
            return this.Json(datas.Where(t => t.StartsWith(term)), JsonRequestBehavior.AllowGet);
        }
    }
}
