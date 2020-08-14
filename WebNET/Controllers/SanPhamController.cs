using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNET.Models;

namespace WebNET.Controllers
{
    
    public class SanPhamController : Controller
    {
        farmfreshEntities db = new farmfreshEntities();
        // GET: SanPham
        public ActionResult SanPham()
        {
            //var listsp = db.products.Where(n => n.product_status == 1);
         
            return View();
        }
        public ActionResult SanPhamPartial()
        {
            //var listsp = db.products.Where(n => n.product_status == 1);
            return PartialView();
        }
       
    }
}