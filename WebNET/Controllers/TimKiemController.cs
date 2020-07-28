using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNET.Models;
using PagedList;


namespace WebNET.Controllers
{
    public class TimKiemController : Controller
    {
        farmfreshEntities db = new farmfreshEntities();
        // GET: TimKiem
        public ActionResult KQTimkiem(string sTukhoa )
        {
            var listSP = db.products.Where(n => n.product_name.Contains(sTukhoa));
            return View(listSP.OrderBy(n=>n.product_name));
        }
    }
}