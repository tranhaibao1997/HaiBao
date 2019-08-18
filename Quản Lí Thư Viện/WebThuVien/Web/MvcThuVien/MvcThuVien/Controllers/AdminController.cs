using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcThuVien.Models;
using PagedList;
using System.IO;

namespace MvcThuVien.Controllers
{
    public class AdminController : Controller
    {
        private ModelTV data = new ModelTV();
        // GET: Admin
        public ActionResult Index()
        {
            if (Session["TaikhoanAdmin"] == null || Session["TaikhoanAdmin"].ToString() == "")
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
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
                Admin ad = data.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
                if (ad != null)
                {
                    Session["TaikhoanAdmin"] = ad;
                    Session["TenNguoiDung"] = tendn;
                    if(ad.Permission == true)
                    {
                        Session["rule"] = true;//admin
                    }
                    else
                    {
                        Session["rule"] = false;// nhan vien
                    }
                    return RedirectToAction("Sach", "Admin");
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
            //Session["TaikhoanAdmin"] = null;
            //Session["TenNguoiDung"] = null;
            //Session["rule"] = null;
            Session.Clear();
            return RedirectToAction("Login", "Admin");          
        }
        #region Sach
        public ActionResult Sach(/*int? page*/)
        {
            if (Session["TaikhoanAdmin"] == null || Session["TaikhoanAdmin"].ToString() == "")
            {
                return RedirectToAction("Login", "Admin");
            }
            //int pageNumber = (page ?? 1);
            //int pageSize = 7;
            //return View(data.Saches.ToList().OrderBy(n => n.MaSach).ToPagedList(pageNumber, pageSize));
            return View(data.Saches.ToList());
        }
        [HttpGet]
        public ActionResult ThemmoiSach()
        {
            ViewBag.MaKhoa = new SelectList(data.Khoas.ToList().OrderBy(n => n.TenKhoa), "MaKhoa", "TenKhoa");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        //upload hình ảnh
        public ActionResult ThemmoiSach(Sach sach, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaKhoa = new SelectList(data.Khoas.ToList().OrderBy(n => n.TenKhoa), "MaKhoa", "TenKhoa");
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            //Themvao CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    //luu ten file
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    //luu duong dan
                    var path = Path.Combine(Server.MapPath("~/Images"), fileName);
                    //kiem tra hinh tonm tai chua
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        //Luu hinh vao duong dan
                        fileUpload.SaveAs(path);
                    }
                    sach.AnhBia = fileName;
                    //luu vao CSDL
                    data.Saches.Add(sach);
                    data.SaveChanges();
                }
                return RedirectToAction("Sach");
            }
        }
        public ActionResult Chitietsach(int id)
        {
            Sach sach = data.Saches.SingleOrDefault(n => n.MaSach == id);
            ViewBag.Masach = sach.MaSach;
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sach);
        }
        //xoasach
        [HttpGet]
        public ActionResult Xoasach(int id)
        {
            Sach sach = data.Saches.SingleOrDefault(n => n.MaSach == id);
            ViewBag.Masach = sach.MaSach;
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sach);
        }
        [HttpPost, ActionName("Xoasach")]
        public ActionResult Xacnhanxoa(int id)
        {
            Sach sach = data.Saches.SingleOrDefault(n => n.MaSach == id);
            ViewBag.Masach = sach.MaSach;
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.Saches.Remove(sach);
            data.SaveChanges();
            return RedirectToAction("Sach");
        }
        [HttpGet]
        public ActionResult Suasach(int id)
        {
            Sach sach = data.Saches.SingleOrDefault(n => n.MaSach == id);
            //ViewBag.Masach = sach.MaSach;
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaKhoa = new SelectList(data.Khoas.ToList().OrderBy(n => n.TenKhoa), "MaKhoa", "TenKhoa", sach.MaKhoa);
            return View(sach);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suasach(Sach sach, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaKhoa = new SelectList(data.Khoas.ToList().OrderBy(n => n.TenKhoa), "MaKhoa", "TenKhoa");
            if (sach == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            //Themvao CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    //luu ten file
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    //luu duong dan
                    var path = Path.Combine(Server.MapPath("~/Images"), fileName);
                    //kiem tra hinh tonm tai chua
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        //Luu hinh vao duong dan
                        fileUpload.SaveAs(path);
                    }

                    Sach thisbook = data.Saches.SingleOrDefault(n => n.MaSach == sach.MaSach);
                    thisbook.TenSach = sach.TenSach;
                    thisbook.MaSach = sach.MaSach;
                    thisbook.MaKhoa = sach.MaKhoa;
                    thisbook.NgayCapNhat = sach.NgayCapNhat;
                    thisbook.SoLuong = sach.SoLuong;
                    thisbook.AnhBia = fileName;

                    data.SaveChanges();
                }
                return RedirectToAction("Sach");
            }
        }
        #endregion
        #region DocGia
        public ActionResult Docgia(/*int? page*/)
        {
            if (Session["TaikhoanAdmin"] == null || Session["TaikhoanAdmin"].ToString() == "")
            {
                return RedirectToAction("Login", "Admin");
            }
            //int pageNumber = (page ?? 1);
            //int pageSize = 7;
            //return View(data.TheDocGias.ToList().OrderBy(n => n.MaTheDocGia).ToPagedList(pageNumber, pageSize));
            return View(data.TheDocGias.ToList());
        }
        [HttpGet]
        public ActionResult Themmoidocgia()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoidocgia(TheDocGia tdg)
        {
            data.TheDocGias.Add(tdg);
            data.SaveChanges();
            return RedirectToAction("Docgia");
        }
        public ActionResult Chitietdocgia(int id)
        {
            TheDocGia tdg = data.TheDocGias.SingleOrDefault(n => n.MaTheDocGia == id);
            ViewBag.MaTheDocGia = tdg.MaTheDocGia;
            if (tdg == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(tdg);
        }
        [HttpGet]
        public ActionResult Xoadocgia(int id)
        {
            TheDocGia tdg = data.TheDocGias.SingleOrDefault(n => n.MaTheDocGia == id);
            ViewBag.MaTheDocGia = tdg.MaTheDocGia;
            if (tdg == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(tdg);
        }
        [HttpPost, ActionName("Xoadocgia")]
        public ActionResult Xacnhanxoadocgia(int id)
        {
            TheDocGia tdg = data.TheDocGias.SingleOrDefault(n => n.MaTheDocGia == id);
            ViewBag.MaTheDocGia = tdg.MaTheDocGia;
            if (tdg == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.TheDocGias.Remove(tdg);
            data.SaveChanges();
            return RedirectToAction("Docgia");
        }
        [HttpGet]
        public ActionResult Suadocgia(int id)
        {
            TheDocGia tdg = data.TheDocGias.SingleOrDefault(n => n.MaTheDocGia == id);
            //ViewBag.Masach = sach.MaSach;
            if (tdg == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(tdg);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suadocgia(TheDocGia tdg, HttpPostedFileBase fileUpload)
        {
            TheDocGia thisthe = data.TheDocGias.SingleOrDefault(n => n.MaTheDocGia == tdg.MaTheDocGia);
            thisthe.MaTheDocGia = tdg.MaTheDocGia;
            thisthe.HoTen = tdg.HoTen;
            thisthe.TaiKhoan = tdg.TaiKhoan;
            thisthe.MatKhau = tdg.MatKhau;
            thisthe.DiachiKH = tdg.DiachiKH;
            thisthe.Email = tdg.Email;
            thisthe.DienthoaiKH = tdg.DienthoaiKH;
            thisthe.Ngaysinh = tdg.Ngaysinh;
            thisthe.Ngaylapthe = tdg.Ngaylapthe;
            data.SaveChanges();
            return RedirectToAction("Docgia");

        }
        #endregion
        #region PhieuMuon
        public ActionResult PhieuMuon(/*int? page*/)
        {
            if (Session["TaikhoanAdmin"] == null || Session["TaikhoanAdmin"].ToString() == "")
            {
                return RedirectToAction("Login", "Admin");
            }
            //int pageNumber = (page ?? 1);
            //int pageSize = 7;
            //return View(data.PhieuMuonSaches.ToList().OrderBy(n => n.MaPhieuMuon).ToPagedList(pageNumber, pageSize));
            return View(data.PhieuMuonSaches.ToList());
        }
        public ActionResult ChitietPhieumuon(int id)
        {
            PhieuMuonSach pms = data.PhieuMuonSaches.SingleOrDefault(n => n.MaPhieuMuon == id);
            ViewBag.MaPhieuMuon = pms.MaPhieuMuon;
            if (pms == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(pms);
        }
        [HttpGet]
        public ActionResult XoaPhieumuon(int id)
        {
            PhieuMuonSach pms = data.PhieuMuonSaches.SingleOrDefault(n => n.MaPhieuMuon == id);
            ViewBag.MaPhieuMuon = pms.MaPhieuMuon;
            if (pms == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(pms);
        }
        [HttpPost, ActionName("XoaPhieumuon")]
        public ActionResult XacnhanxoaPhieumuon(int id)
        {
            PhieuMuonSach pms = data.PhieuMuonSaches.SingleOrDefault(n => n.MaPhieuMuon == id);
            ViewBag.MaPhieuMuon = pms.MaPhieuMuon;
            if (pms == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.PhieuMuonSaches.Remove(pms);
            data.SaveChanges();
            return RedirectToAction("PhieuMuon");
        }
        #endregion
        #region CTPhieuMuon
        public ActionResult CTPhieuMuon(/*int? page*/)
        {
            if (Session["TaikhoanAdmin"] == null || Session["TaikhoanAdmin"].ToString() == "")
            {
                return RedirectToAction("Login", "Admin");
            }
            //int pageNumber = (page ?? 1);
            //int pageSize = 7;
            //return View(data.CTPhieuMuons.ToList().OrderBy(n => n.MaPhieuMuon).ToPagedList(pageNumber, pageSize));
            return View(data.CTPhieuMuons.ToList());
        }
        [HttpGet]
        public ActionResult XoaCTPhieumuon(int idPhieu, int idSach)
        {
            //CTPhieuMuon ctpms = data.CTPhieuMuons.SingleOrDefault(n => n.MaPhieuMuon == id);
            //CTPhieuMuon ctpms = data.CTPhieuMuons.Where(n => n.MaPhieuMuon == id).SingleOrDefault();

            CTPhieuMuon ctpms = data.CTPhieuMuons.Where(n => n.MaPhieuMuon == idPhieu && n.MaSach == idSach).SingleOrDefault();

            ViewBag.MaPhieuMuon = ctpms.MaPhieuMuon;
            if (ctpms == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ctpms);
        }
        [HttpPost, ActionName("XoaCTPhieumuon")]
        public ActionResult XacnhanxoaCTPhieumuon(int idPhieu, int idSach)
        {
            //CTPhieuMuon ctpms = data.CTPhieuMuons.SingleOrDefault(n => n.MaPhieuMuon == id);

            CTPhieuMuon ctpms = data.CTPhieuMuons.Where(n => n.MaPhieuMuon == idPhieu && n.MaSach == idSach).SingleOrDefault();

            ViewBag.MaPhieuMuon = ctpms.MaPhieuMuon;
            if (ctpms == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.CTPhieuMuons.Remove(ctpms);
            data.SaveChanges();
            return RedirectToAction("PhieuMuon");
        }
        #endregion
    }
}