using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcThuVien.Models
{    
    public class Phieumuon
    {
        ModelTV data = new ModelTV();
        public int iMasach { get; set; }
        public string sTensach { get; set; }
        public string sAnhbia { get; set; }
        public int iSoluong { get; set; }
        public Phieumuon(int Masach)
        {
            iMasach = Masach;
            Sach sach = data.Saches.Single(n => n.MaSach == iMasach);
            sTensach = sach.TenSach;
            sAnhbia = sach.AnhBia;
            iSoluong = 1;
        }
    }
}