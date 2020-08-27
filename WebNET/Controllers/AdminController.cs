using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNET.Models;

namespace WebNET.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        farmfreshEntities db = new farmfreshEntities();
        public ActionResult Index()
        {
            return View(db.products);
        }
        [HttpGet]
        public ActionResult TaoMoi()
        {
            ViewBag.product_categoryId = new SelectList(db.categories.OrderBy(n => n.category_id), "category_id", "category_title");
            ViewBag.product_createBy = new SelectList(db.admins.OrderBy(n => n.admin_id), "admin_id", "admin_name");
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult TaoMoi(product product,HttpPostedFileBase product_image)
        {
            ViewBag.product_categoryId = new SelectList(db.categories.OrderBy(n => n.category_id), "category_id", "category_title");
            ViewBag.product_createBy = new SelectList(db.admins.OrderBy(n => n.admin_id), "admin_id", "admin_name");
           
            //kiem tra hinh anh ton tai chua
            if (product_image.ContentLength > 0)
            {
                var fileName = Path.GetFileName(product_image.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/img"), fileName);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.upload = "Hinh anh da ton tai";
                    return View();
                }
                else
                {
                    product_image.SaveAs(path);
                    product.product_image = fileName;
                }
                
            }
            db.products.Add(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}