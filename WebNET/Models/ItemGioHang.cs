using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNET.Models
{
    public class ItemGioHang
    {
        public string HinhAnh { get; set; }

        public string TenSP { get; set; }
        public int MaSP { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public decimal ThanhTien { get; set; }

        public ItemGioHang(int iMaSP)
        {
            using (farmfreshEntities db =  new farmfreshEntities())
            {
                this.MaSP = iMaSP;
                product sp = db.products.Single(n => n.product_id == iMaSP);
                this.TenSP = sp.product_name;
                this.HinhAnh = sp.product_image;
                this.DonGia = sp.product_price.Value;
                this.SoLuong = 1;
                this.ThanhTien = DonGia * SoLuong;
            }
        }
        public ItemGioHang(int iMaSP, int sl)
        {
            using (farmfreshEntities db = new farmfreshEntities())
            {
                this.MaSP = iMaSP;
                product sp = db.products.Single(n => n.product_id == iMaSP);
                this.TenSP = sp.product_name;
                this.HinhAnh = sp.product_image;
                this.DonGia = sp.product_price.Value;
                this.SoLuong = sl;
                this.ThanhTien = DonGia * SoLuong;
            }
        }
        public ItemGioHang()
        {

        }
    }
}