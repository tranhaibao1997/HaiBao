namespace MvcThuVien.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ModelThuVien : DbContext
    {
        public ModelThuVien()
            : base("name=ModelThuVien")
        {
        }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<CTPhieuMuon> CTPhieuMuons { get; set; }
        public virtual DbSet<Khoa> Khoas { get; set; }
        public virtual DbSet<PhieuMuonSach> PhieuMuonSaches { get; set; }
        public virtual DbSet<Sach> Saches { get; set; }
        public virtual DbSet<TheDocGia> TheDocGias { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>()
                .Property(e => e.UserAdmin)
                .IsUnicode(false);

            modelBuilder.Entity<Admin>()
                .Property(e => e.PassAdmin)
                .IsUnicode(false);

            modelBuilder.Entity<PhieuMuonSach>()
                .HasMany(e => e.CTPhieuMuons)
                .WithRequired(e => e.PhieuMuonSach)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Sach>()
                .Property(e => e.AnhBia)
                .IsUnicode(false);

            modelBuilder.Entity<Sach>()
                .HasMany(e => e.CTPhieuMuons)
                .WithRequired(e => e.Sach)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TheDocGia>()
                .Property(e => e.TaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<TheDocGia>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);

            modelBuilder.Entity<TheDocGia>()
                .Property(e => e.Email)
                .IsUnicode(false);
        }
    }
}
