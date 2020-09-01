using PagedList;
using Platform;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebNET.Models;

namespace WebNET.Controllers
{
    
    public class HomeController : Controller
    {

        farmfreshEntities db = new farmfreshEntities();
        // GET: Home
        public ActionResult Index(int? page)
        {
            var listspM = db.products.Where(n => n.product_status == 1);
            ViewBag.listsp = listspM;
            int pageSize = 4;
            int pageNumber = (page ?? 1);

            return View(listspM.OrderBy(n=>n.product_id).ToPagedList(pageNumber,pageSize));
        }
        public ActionResult ChiTietSanPham(int id)
        {
            product product = db.products.Find(id);
            ViewBag.name = product.product_name;
            ViewBag.img = product.product_image;
            ViewBag.price = product.product_price;
            ViewBag.des = product.product_description;
          
            return View();
        }
        //dang ky
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(user tv, FormCollection f)
        {
            //Them vao csdl
            string sEmail = f["user_email"].ToString();
            string sPass = f["user_password"].ToString();
            user t = db.users.SingleOrDefault(n => n.user_email == sEmail);
            if (t != null)
            {
                ViewBag.error = "Email đã tồn tại";
                return View();
            }
            else { 
                tv.user_role = 2;
                tv.user_password = CreateMD5(sPass);
            db.users.Add(tv);
            db.SaveChanges();
            return RedirectToAction("Login");
            }
        }
        public static string CreateMD5(string input)
        {
            // Use input string to calculate MD5 hash
            MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hashBytes = md5.ComputeHash(inputBytes);

            // Convert the byte array to hexadecimal string
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("X2"));
            }
            return sb.ToString();
        }
        [HttpGet]
        public ActionResult Login()
        {
           //return RedirectToAction("Index");
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            string sEmail = f["txtemail"].ToString();
            string sPass = f["txtpassword"].ToString();
            string passconvert = CreateMD5(sPass);
            user tv = db.users.SingleOrDefault(n => n.user_email == sEmail && n.user_password == passconvert);
            if (tv != null)
            {
                var listQuyen = db.Role_Quyen.Where(n => n.role_id == tv.user_role);
                string Quyen = "";
                foreach (var item in listQuyen)
                {
                    Quyen += item.Quyen.MaQuyen + ",";

                }
                Quyen = Quyen.Substring(0, Quyen.Length - 1);
                PhanQuyen(tv.user_email, Quyen);
                Session["TaiKhoan"] = tv;
                return RedirectToAction("Index");
            }
            //else if (sEmail.EqualsIgnoreCase("admin@gmail.com")&& sPass.EqualsIgnoreCase("admin"))
            //{
            //    return RedirectToAction("Index", "Admin");
            //} else
            {
                ViewBag.error = "Email hoặc mật khẩu không đúng";
                return View();
            }
        
            
        }
        public void PhanQuyen(string email, string Quyen)
        {
            FormsAuthentication.Initialize();
            var ticket = new FormsAuthenticationTicket(1, email, DateTime.Now, DateTime.Now.AddHours(3), false, Quyen, FormsAuthentication.FormsCookiePath);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));
            if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;
            Response.Cookies.Add(cookie);
        }
   
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session["TaiKhoan"] = null;
            Session["GioHang"] = null;
            return RedirectToAction("Index");
        }
        public ActionResult LoiDangNhap()
        {
            return View();
        }
        [HttpGet]
        public ActionResult UserInfo(int? id)
        {
            user u = (user)Session["TaiKhoan"];
             id = u.user_id ;
            user pd = db.users.SingleOrDefault(n => n.user_id == id);
            return View(pd);
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult UserInfo(user model)
        {
            model.user_role = 2;
            db.Entry(model).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            //ViewBag.error = "Cập nhật thành công";
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult UserPass(int? id)
        {
            user u = (user)Session["TaiKhoan"];
            id = u.user_id;
            user pd = db.users.SingleOrDefault(n => n.user_id == id);
            return View(pd);
        }


        [HttpPost]
        public ActionResult UserPass(user model, FormCollection f)
        {
            string sPass = f["user_password"].ToString();

            model.user_role = 2;
            model.user_password = CreateMD5(sPass);
            db.Entry(model).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            //ViewBag.error = "Cập nhật thành công";
            return RedirectToAction("Index");
        }

    }
}