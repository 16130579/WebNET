using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebNET.Models;

namespace WebNET.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        // GET: Admin
        farmfreshEntities db = new farmfreshEntities();
        public ActionResult Index()
        {
            return View(db.products);
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session["TaiKhoan"] = null;
            return RedirectToAction("Index", "Home");
        }
        //Quan Ly San Pham
        [HttpGet]
        public ActionResult TaoMoi()
        {
            ViewBag.product_categoryId = new SelectList(db.categories.OrderBy(n => n.category_id), "category_id", "category_title");
            
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult TaoMoi(product product,HttpPostedFileBase product_image)
        {
            ViewBag.product_categoryId = new SelectList(db.categories.OrderBy(n => n.category_id), "category_id", "category_title");
            
           
            //kiem tra hinh anh ton tai chua
            if (product_image.ContentLength > 0)
            {
                var fileName = Path.GetFileName(product_image.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/img"), fileName);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.upload = "Hình ảnh đã tồn tại";
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
        [HttpGet]
        public ActionResult ChinhSua(int? id)
        {
            if (id==null)
            {
                Response.StatusCode = 404;
                return null;
            }
            product pd = db.products.SingleOrDefault(n => n.product_id==id);
            if(pd == null)
            {
                return HttpNotFound();
            }
            ViewBag.product_categoryId = new SelectList(db.categories.OrderBy(n => n.category_id), "category_id", "category_title",pd.product_categoryId);
            
            return View(pd);
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult ChinhSua(product model, HttpPostedFileBase product_image)
        {
            //kiem tra hinh anh ton tai chua
            if (product_image.ContentLength > 0)
            {
                var fileName = Path.GetFileName(product_image.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/img"), fileName);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.upload = "Hình ảnh đã tồn tại";
                    return View();
                }
                else
                {
                    product_image.SaveAs(path);
                    model.product_image = fileName;
                }

            }
            ViewBag.product_categoryId = new SelectList(db.categories.OrderBy(n => n.category_id), "category_id", "category_title", model.product_categoryId);
            
                db.Entry(model).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            
        }
        [HttpGet]
        public ActionResult Xoa(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            product pd = db.products.SingleOrDefault(n => n.product_id == id);
            if (pd == null)
            {
                return HttpNotFound();
            }
            ViewBag.product_categoryId = new SelectList(db.categories.OrderBy(n => n.category_id), "category_id", "category_title", pd.product_categoryId);
            

            return View(pd);
        }
        [HttpPost]
        public ActionResult Xoa(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product model = db.products.SingleOrDefault(n => n.product_id==id);
            if (model == null)
            {
                return HttpNotFound();

            }
            db.products.Remove(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //Quan Ly User
        public ActionResult UserView()
        {
            return View(db.users);
        }
        [HttpGet]
        public ActionResult ChinhSuaUser(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            user u = db.users.SingleOrDefault(n => n.user_id == id);
            if (u == null)
            {
                return HttpNotFound();
            }
            ViewBag.user_role = new SelectList(db.roles.OrderBy(n => n.id), "id", "name", u.user_role);
            
            return View(u);
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult ChinhSuaUser(user model)
        {
            ViewBag.user_role = new SelectList(db.roles.OrderBy(n => n.id), "id", "name", model.user_role);
            db.Entry(model).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("UserView");

        }
        [HttpGet]
        public ActionResult XoaUser(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            user pd = db.users.SingleOrDefault(n => n.user_id == id);
            if (pd == null)
            {
                return HttpNotFound();
            }
            ViewBag.user_role = new SelectList(db.roles.OrderBy(n => n.id), "id", "name", pd.user_role);
            return View(pd);
        }
        [HttpPost]
        public ActionResult XoaUser(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user model = db.users.SingleOrDefault(n => n.user_id == id);
            if (model == null)
            {
                return HttpNotFound();

            }
            db.users.Remove(model);
            db.SaveChanges();
            return RedirectToAction("UserView");
        }
        //Quan ly don hang
        public ActionResult QuanLyDonHang()
        {
            
            return View(db.orders);
        }
        [HttpGet]
        public ActionResult ChinhSuaDonHang(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            order u = db.orders.SingleOrDefault(n => n.orders_id == id);
            if (u == null)
            {
                return HttpNotFound();
            }

            ViewBag.orders_userId = new SelectList(db.users.OrderBy(n => n.user_id), "user_id", "user_fullName", u.orders_userId);
            return View(u);
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult ChinhSuaDonHang(order model)
        {
            ViewBag.orders_userId = new SelectList(db.users.OrderBy(n => n.user_id), "user_id", "user_fullName", model.orders_userId);
            db.Entry(model).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("QuanLyDonHang");

        }
        [HttpGet]
        public ActionResult XoaDonHang(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            order u = db.orders.SingleOrDefault(n => n.orders_id == id);
            if (u == null)
            {
                return HttpNotFound();
            }
            
            return View(u);
        }
        [HttpPost]
        public ActionResult XoaDonHang(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            order model = db.orders.SingleOrDefault(n => n.orders_id == id);
            var listOrderItem = db.orderitems.Where(n => n.orderItem_ordersId == id);
            if (model == null)
            {
                return HttpNotFound();

            }
            
            foreach (var item in listOrderItem)
            {
                db.orderitems.Remove(item);
            }
            db.orders.Remove(model);
            db.SaveChanges();
            return RedirectToAction("QuanLyDonHang");
        }
        [HttpGet]
        public ActionResult ChiTietDonHang(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //orderitem u = db.orderitems.SingleOrDefault(n => n.orderItem_ordersId == id);
            var listitem = db.orderitems.Where(n => n.orderItem_ordersId == id);
            //if (u == null)
            //{
            //    return HttpNotFound();
            //}
            ViewBag.list = listitem;
            //ViewBag.orders_userId = new SelectList(db.users.OrderBy(n => n.user_id), "user_id", "user_firstName", u.orders_userId);
            return View(listitem);
        }
    }
    
    
}