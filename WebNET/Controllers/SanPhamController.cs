using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebNET.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: SanPham
        public ActionResult SanPham()
        {
            return View();
        }
        public ActionResult SanPhamPartial()
        {
            return PartialView();
        }
        public ActionResult ChiTietSanPham()
        {
            return View();
        }
    }
}