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
            var listspM = db.product.Where(n => n.product_status == 1);
            ViewBag.listsp = listspM;
            return View();
        }
        public ActionResult ChiTietSanPham(int id)
        {
            product product = db.product.Find(id);
            ViewBag.name = product.product_name;
            ViewBag.img = product.product_image;
            ViewBag.price = product.product_price;
            ViewBag.des = product.product_description;
          
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
            db.user.Add(tv);
            db.SaveChanges();
            return View();
        }
    }
}