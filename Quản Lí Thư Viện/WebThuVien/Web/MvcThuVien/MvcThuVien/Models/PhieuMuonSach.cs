namespace MvcThuVien.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuMuonSach")]
    public partial class PhieuMuonSach
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhieuMuonSach()
        {
            CTPhieuMuons = new HashSet<CTPhieuMuon>();
        }

        [Key]
        public int MaPhieuMuon { get; set; }

        public int MaTheDocGia { get; set; }

        public DateTime NgayMuon { get; set; }

        public DateTime NgayTra { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTPhieuMuon> CTPhieuMuons { get; set; }

        public virtual TheDocGia TheDocGia { get; set; }
    }
}
