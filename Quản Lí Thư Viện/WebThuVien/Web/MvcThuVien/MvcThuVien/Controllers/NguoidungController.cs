using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcThuVien.Models;

namespace MvcThuVien.Controllers
{
    public class NguoidungController : Controller
    {
        ModelTV data = new ModelTV();
        // GET: Nguoidung
        [HttpGet]
        public ActionResult Dangky()
        {
            return View();
        }
        //Nhận dữ liệu từ đăng ký và thực hiện tạo mới
        [HttpPost]
        public ActionResult Dangky(FormCollection collection, TheDocGia kh)
        {
            var hoten = collection["HotenKH"];
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            var matkhaunhaplai = collection["Matkhaunhaplai"];
            var diachi = collection["Diachi"];
            var email = collection["Email"];
            var dienthoai = collection["Dienthoai"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["Ngaysinh"]);
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên khách hàng không được để trống";
            }
            else if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi2"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Phải nhập mật khẩu";
            }
            else if (String.IsNullOrEmpty(matkhaunhaplai))
            {
                ViewData["Loi4"] = "Phải nhập lại mật khẩu";
            }
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi5"] = "Email không được bỏ trống";
            }
            else if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi6"] = "Phải nhập điệnt thoại";
            }
            else if (String.IsNullOrEmpty(diachi))
            {
                ViewData["Loi7"] = "Phải nhập địa chỉ";
            }
            else
            {
                kh.HoTen = hoten;
                kh.TaiKhoan = tendn;
                kh.MatKhau = matkhau;
                kh.Email = email;
                kh.DiachiKH = diachi;
                kh.DienthoaiKH = dienthoai;
                kh.Ngaysinh = DateTime.Parse(ngaysinh);
                kh.Ngaylapthe = DateTime.Now;
                var query = from tdn in data.TheDocGias where tdn.TaiKhoan == kh.TaiKhoan select tdn;
                if (query.Count() > 0)
                {
                    ViewBag.ThongBaoLoi = "Tài khoản đã có người đăng kí";
                    return this.Dangky();
                }
                else
                {
                    data.TheDocGias.Add(kh);
                    data.SaveChanges();
                    return RedirectToAction("Dangnhap");
                }               
            }
            return this.Dangky();
        }
        [HttpGet]
        public ActionResult Dangnhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangnhap(FormCollection collection)
        {
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Bạn phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Bạn phải nhập mật khẩu";
            }
            else
            {
                TheDocGia kh = data.TheDocGias.SingleOrDefault(n => n.TaiKhoan == tendn && n.MatKhau == matkhau);
                if (kh != null)
                {
                    Session["Taikhoan"] = kh;
                    Session["TenNguoiDung"] = tendn;
                    return RedirectToAction("Index", "ThuVien");
                }
                else
                {
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session["TaiKhoan"] = null;
            Session["TenNguoiDung"] = null;

            return RedirectToAction("Index", "ThuVien");
        }
    }
}