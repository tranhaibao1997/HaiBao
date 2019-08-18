using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcThuVien.Models;
using PagedList;

namespace MvcThuVien.Controllers
{
    public class ThuVienController : Controller
    {
        ModelTV data = new ModelTV();
        private List<Sach> Laysachmoi(int count, string name)
        {
            //return data.Saches.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
            if (/*!String.IsNullOrEmpty(name)*/ name != "" && name != null)
                return (from s in data.Saches
                        where s.TenSach.ToUpper().Contains(name.ToUpper())
                        orderby s.NgayCapNhat descending
                        select s).Take(count).ToList();
            else
                return (from s in data.Saches
                        orderby s.NgayCapNhat descending
                        select s).Take(count).ToList();


        }
        // GET: ThuVien
        public ActionResult Index(int? page, FormCollection collector)
        {
            //số sản phẩm mỗi trang
            int pageSize = 6;
            //số trang
            int pageNum = (page ?? 1);
            string name = collector["SearchString"];
            var sachmoi = Laysachmoi(15, name);
            return View(sachmoi.ToPagedList(pageNum, pageSize));
        }
        // Thanh Tim Kiem
        public ActionResult Search()
        {
            return PartialView();
        }

        //Khoa
        public ActionResult Khoa()
        {
            var khoa = from k in data.Khoas select k;
            return PartialView(khoa);
        }
        public ActionResult SPTheokhoa(int id)
        {
            var sach = from s in data.Saches where s.MaKhoa == id select s;
            return View(sach);
        }
        public ActionResult Details(int id)
        {
            var sach = from s in data.Saches
                       where s.MaSach == id
                       select s;
            return View(sach.Single());
        }
        public ActionResult ThuVienPartial()
        {
            return PartialView();
        }
        public ActionResult DangnhapPartial()
        {
            return PartialView();
        }
    }
}