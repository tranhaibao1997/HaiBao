namespace MvcThuVien.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Sach")]
    public partial class Sach
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Sach()
        {
            CTPhieuMuons = new HashSet<CTPhieuMuon>();
        }

        [Key]
        public int MaSach { get; set; }

        [Required]
        [StringLength(50)]
        public string TenSach { get; set; }

        [StringLength(50)]
        public string AnhBia { get; set; }

        public DateTime NgayCapNhat { get; set; }

        public int SoLuong { get; set; }

        public int MaKhoa { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTPhieuMuon> CTPhieuMuons { get; set; }

        public virtual Khoa Khoa { get; set; }
    }
}
