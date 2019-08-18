namespace MvcThuVien.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TheDocGia")]
    public partial class TheDocGia
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TheDocGia()
        {
            PhieuMuonSaches = new HashSet<PhieuMuonSach>();
        }

        [Key]
        public int MaTheDocGia { get; set; }

        [Required]
        [StringLength(50)]
        public string HoTen { get; set; }

        [StringLength(50)]
        public string TaiKhoan { get; set; }

        [Required]
        [StringLength(50)]     
        public string MatKhau { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(200)]
        public string DiachiKH { get; set; }

        [StringLength(50)]
        //[RegularExpression("")]
        public string DienthoaiKH { get; set; }

        public DateTime Ngaysinh { get; set; }

        public DateTime Ngaylapthe { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuMuonSach> PhieuMuonSaches { get; set; }
    }
}
