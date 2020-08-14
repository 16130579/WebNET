using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNET.Models;

namespace WebNET.Controllers
{

    public class HomeController : Controller
    {

        farmfreshEntities db = new farmfreshEntities();
        // GET: Home
        public ActionResult Index()
        {
            var listspM = db.products.Where(n => n.product_status == 1);
            ViewBag.listsp = listspM;
            return View();
        }
        public ActionResult ChiTietSanPham()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(user tv, FormCollection f)
        {
            //Them vao csdl
            db.users.Add(tv);
            db.SaveChanges();
            return View();
        }
    }
}