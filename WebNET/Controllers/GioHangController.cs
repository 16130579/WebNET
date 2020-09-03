using Microsoft.Ajax.Utilities;
using Org.BouncyCastle.Asn1.Cms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNET.Models;

namespace WebNET.Controllers
{
    public class GioHangController : Controller
    {
        farmfreshEntities db = new farmfreshEntities();
        //Lay gio hang
        public List<ItemGioHang> LayGioHang()
        {

            //Gio hang da ton tai
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                //neu gio hang chua ton tai thi tao gio hang
                lstGioHang = new List<ItemGioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        //Them gio hang
        public ActionResult ThemGioHang(int MaSP, string strURL)
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            //kiem tra sp co ton tai k
            product sp = db.products.SingleOrDefault(n => n.product_id == MaSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Lay gio hang
            List<ItemGioHang> lstGioHang = LayGioHang();
            //TH1 neu sp da ton tai trong gio
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.MaSP == MaSP);
            if (spCheck != null)
            {
                //kiem tra sl ton truoc khi KH mua hang
                if (sp.product_quantity < spCheck.SoLuong)
                {
                    return View("ThongBao");
                }
                spCheck.SoLuong++;
                spCheck.ThanhTien = spCheck.SoLuong * spCheck.DonGia;
                return Redirect(strURL);
            }

            ItemGioHang itemGH = new ItemGioHang(MaSP);
            if (sp.product_quantity < itemGH.SoLuong)
            {
                return View("ThongBao");
            }
            lstGioHang.Add(itemGH);
            return Redirect(strURL);
        }
        //Tinh tong so luong
        public double TinhTongSoLuong()
        {
            //Lay gio hang
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.SoLuong);
        }
        //Tinh tong so tien
        public decimal TinhTongTien()
        {
            //Lay gio hang
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.ThanhTien);
        }


        public ActionResult GioHangPartial()
        {
            if (TinhTongSoLuong() == 0)
            {
                ViewBag.TongSoLuong = 0;
                return PartialView();
            }
            ViewBag.TongSoLuong = TinhTongSoLuong();
            return PartialView();
        }
        // GET: GioHang
        public ActionResult XemGioHang()
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            //Lay gio hang
            List<ItemGioHang> lstGioHang = LayGioHang();
            return View(lstGioHang);
        }
        //Chinh sua gio hang
        [HttpGet]
        public ActionResult SuaGioHang(int MaSP)
        {
            //kt session gio hang ton tai chua
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //kiem tra sp co ton tai k
            product sp = db.products.SingleOrDefault(n => n.product_id == MaSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //lay list gio hang tu session
            List<ItemGioHang> lstGioHang = LayGioHang();
            //kt sp do co ton tai trong gio hang k
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.MaSP == MaSP);
            if (spCheck == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //lay list gio hang tao giao dien
            ViewBag.GioHang = lstGioHang;
            //neu ton tai roi
            return View(spCheck);
        }

        //Cap nhat gio hang
        [HttpPost]
        public ActionResult CapNhatGioHang(ItemGioHang itemGH)
        {
            //kt so luong ton
            product spCheck = db.products.SingleOrDefault(n => n.product_id == itemGH.MaSP);
            if (spCheck.product_quantity < itemGH.SoLuong)
            {
                return View("ThongBao");
            }
            //cap nhat so luong trong session GH
            List<ItemGioHang> lstGH = LayGioHang();
            ItemGioHang itemGHUpdate = lstGH.Find(n => n.MaSP == itemGH.MaSP);
            itemGHUpdate.SoLuong = itemGH.SoLuong;
            itemGHUpdate.ThanhTien = itemGHUpdate.SoLuong * itemGHUpdate.DonGia;
            return RedirectToAction("XemGioHang");
        }
        public ActionResult XoaGioHang(int MaSP)
        {
            //kt session gio hang ton tai chua
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //kiem tra sp co ton tai k
            product sp = db.products.SingleOrDefault(n => n.product_id == MaSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //lay list gio hang tu session
            List<ItemGioHang> lstGioHang = LayGioHang();
            //kt sp do co ton tai trong gio hang k
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.MaSP == MaSP);
            if (spCheck == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //Xoa item trong gh
            lstGioHang.Remove(spCheck);
            return RedirectToAction("XemGioHang");
        }
        //Dat hang
        public ActionResult DatHang(user kh, addressdetail addressdetail)
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            user khachHang = new user();
            khachHang= (user)Session["TaiKhoan"] ;
            //khachHang = kh;
            //db.users.Add(khachHang);
            //db.SaveChanges();

            addressdetail detail = new addressdetail();
            detail.addressDetail_userId = khachHang.user_id;
            detail = addressdetail;
            db.addressdetails.Add(detail);
            db.SaveChanges();

            order ddh = new order();
            ddh.orders_createDate = DateTime.Now;
            ddh.orders_userId = khachHang.user_id;
            ddh.orders_shippingAddress = detail.addressDetail_address;
            ddh.orders_status = false;
            db.orders.Add(ddh);
            db.SaveChanges();

            //them chi tiet don hang
            List<ItemGioHang> lstGH = LayGioHang();
            foreach (var item in lstGH)
            {
                orderitem ctdh = new orderitem();
                ctdh.orderItem_ordersId = ddh.orders_id;
                ctdh.orderItem_productId = item.MaSP;
                ctdh.orderItem_productName = item.TenSP;
                ctdh.orderItem_quantity = item.SoLuong;
                ctdh.orderItem_price = item.DonGia;
                db.orderitems.Add(ctdh);
            }
            db.SaveChanges();
            Session["GioHang"] = null;
            return RedirectToAction("XemGioHang");
        }

        public ActionResult Checkout()
        {
            return View("Checkout");
        }
        public ActionResult ThanhCong()
        {
            return View();
        }
    }
}