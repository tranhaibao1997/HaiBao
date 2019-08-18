-- DATABASE CSDL 
-- XOA CSDL 
USE MASTER 
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'QLTV') 
DROP DATABASE QLTV
GO 
-- TAO CSDL 
CREATE DATABASE QLTV
GO -- SU DUNG CSDL SalesERPDAL 
USE QLTV
GO 
-- TABLES CSDL 
CREATE TABLE TheDocGia
(
	MaTheDocGia INT IDENTITY(1,1),
	HoTen nvarchar(50) NOT NULL,
	TaiKhoan varchar(50) UNIQUE,
	MatKhau varchar(50) NOT NULL,
	Email varchar(100) UNIQUE,
	DiachiKH nvarchar (200),
	DienthoaiKH NVARCHAR(50),
	Ngaysinh DATETIME,
	Ngaylapthe DATETIME,
	CONSTRAINT PK_TheDocGia PRIMARY KEY (MaTheDocGia)
)
GO
CREATE TABLE Khoa
(
MaKhoa INT IDENTITY(1,1),
TenKhoa nvarchar(50) NOT NULL,
CONSTRAINT PK_Khoa PRIMARY KEY(MaKhoa)
) 
GO
CREATE TABLE Sach
(
	MaSach INT IDENTITY(1,1),
	TenSach NVARCHAR(50) NOT NULL,
	AnhBia VARCHAR(50),
	NgayCapNhat DATETIME,		
	SoLuong INT CHECK(SoLuong>0),
	MaKhoa INT,
	CONSTRAINT PK_Sach PRIMARY KEY(Masach),
	CONSTRAINT FK_Khoa FOREIGN KEY(MaKhoa) REFERENCES dbo.Khoa(MaKhoa)
)

GO
CREATE TABLE PhieuMuonSach
(
	MaPhieuMuon INT IDENTITY(1,1),
	MaTheDocGia INT,
	NgayMuon DATETIME,
	NgayTra DATETIME,
	CONSTRAINT PK_PhieuMuonSach PRIMARY KEY(MaPhieuMuon),
	CONSTRAINT FK_DocGia FOREIGN KEY(MaTheDocGia) REFERENCES dbo.TheDocGia(MaTheDocGia)
) 
GO
CREATE TABLE CTPhieuMuon
(	
	MaPhieuMuon INT,
	MaSach INT,
	SoLuong INT,
	CONSTRAINT PK_CTPhieuMuon PRIMARY KEY(MaPhieuMuon,MaSach),
	CONSTRAINT FK_MaPhieuMuon FOREIGN KEY(MaPhieuMuon) REFERENCES dbo.PhieuMuonSach(MaPhieuMuon),
	CONSTRAINT FK_MaSach FOREIGN KEY(MaSach) REFERENCES dbo.Sach(MaSach)
) 

-- Khoa
GO 
INSERT INTO dbo.Khoa( TenKhoa )VALUES  ( N'Ngoại ngữ')
INSERT INTO dbo.Khoa( TenKhoa )VALUES  ( N'Công nghệ thông tin')
INSERT INTO dbo.Khoa( TenKhoa )VALUES  ( N'Đông phương')
INSERT INTO dbo.Khoa( TenKhoa )VALUES  ( N'Quan hệ quốc tế')
INSERT INTO dbo.Khoa( TenKhoa )VALUES  ( N'Quản trị kinh doanh')
INSERT INTO dbo.Khoa( TenKhoa )VALUES  ( N'Du lịch - Khách sạn')
INSERT INTO dbo.Khoa( TenKhoa )VALUES  ( N'Kinh tế - tài chính')
INSERT INTO dbo.Khoa( TenKhoa )VALUES  ( N'Lý luận chính trị')
INSERT INTO dbo.Khoa( TenKhoa )VALUES  ( N'Luật')

-- Sach
GO
-- Ngoai ngu
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'600 Essential Words For The Toeic' ,'600 Essential Words For The Toeic.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Luyện Tập TOELF' ,'luyen-tap-toefl.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'2000 Từ Vựng Tiếng Anh' ,'2000-tu-vung.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Luyện Thi Toeic 750' ,'luyen-thi-toeic-750.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'English Gramma To Use' ,'English Gramma To Use.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Luyện thi Toeic' ,'luyen-thi-toelf.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'English Gramma' ,'English Gramma.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Mastering Skills Toefl iBT' ,'Mastering Skills Toefl iBT.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Essential Worlds For The Ielts' ,'Essential Worlds For The Ielts.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Nói Tiếng Anh Theo Chủ Đề' ,'noi-tieng-anh-theo-chu-de.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Giải Thích Ngữ Pháp Tiếng Anh 2' ,'giai-thich-ngu-phap.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Từ Điển Anh Anh-Việt' ,'tu-dien-anh-anh-viet.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Giải Thích Ngữ Pháp Tiếng Anh' ,'giai-thich-ngu-phap-tieng-anh.png' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Văn Phạm Anh Ngữ' ,'van-pham-anh-ngu.jpg' ,GETDATE() , 2 ,1)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Học Đánh Vần Tiếng Anh' ,'hoc-danh-van.jpg' ,GETDATE() , 2 ,1)
--CNTT
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Adobe Indesign' ,'Adobe Indesign.jpg' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Microsolf Excel 2016 Hướng Dẫn' ,'microsoft excel 2016.jpg' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'CNTT và Truyền Thông Việt Nam' ,'CNTT va TTVN.jpg' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'PHP' ,'PHP.png' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Codes At Work' ,'Codes At Work.png' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Programming In C' ,'Programming In C.png' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Computer Networks' ,'Computer Networks.jpg' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Quản Lí Dự Án CNTT' ,'quan-li-du-an-cntt.jpg' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'HTML' ,'HTML.jpg' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Ứng Dụng CNTT và Truyền Thông' ,'ung-dung-cntt.jpg' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Hướng dẫn Autocad 2012' ,'Huong-dan-atuocad.jpg' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Visual Basis 6' ,'Visual Basis 6.jpg' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Hướng Dẫn PHP và MySQL' ,'huong-dan-php-mysql.jpg' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Worldpess For Web Developers' ,'Worldpess For Web Developers.jpg' ,GETDATE() , 2 ,2)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Java' ,'Java.jpg' ,GETDATE() , 2 ,2)
--Dong Phuong
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'10 Phút Học Tiếng Hàn Mỗi Ngày' ,'10-phut-hoc-tieng-han.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Tiếng Nhật Cho Mọi Người' ,'tieng-nhat-cho-moi-nguoi.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'200 Chữ Kanji Căn Bản' ,'200-kanji.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Tiếng Nhật Sơ Cấp' ,'tieng-nhat-so-cap.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Giao Tiếp Tiếng Hàn Tự Nhiên' ,'Giao-tiep-tieng-han.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Triết Học Đông Phương' ,'triet-hoc-dong-phuong.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Giáo Trình Sơ Cấp Tiếng Nhật' ,'giao-trinh-so-cap-nhat.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Từ Điển Tiếng Hàn' ,'tu-dien-tieng-Han.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Thực Hành Tiếng Hàn' ,'thuc-hanh-tieng-han.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Tự Học Tiếng Hàn' ,'tu-hoc-tieng-Han.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Tiếng Hàn Cho Người Du Lịch, Lao Động' ,'tieng-han-dulichlaodong.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Tự Học Tiếng Nhật' ,'tu-hoc-tieng-Nhat.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Tiếng Hàn Cho Người Việt' ,'tieng-han-cho-nguoi-viet.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Viết Tiếng Nhật' ,'viet-tieng-Nhat.jpg' ,GETDATE() , 2 ,3)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Tiếng Hàn Tổng Hợp' ,'tieng-han-tong-hop.jpg' ,GETDATE() , 2 ,3)
--QHQT
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Bài Giảng QHQT' ,'bai-giang-QHQT.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Quản Trị Học Trong Xu Thế Hội Nhập' ,'quan-tri-hoc-trong-xu-the.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Giáo Trình QHQT' ,'giao-trinh-QHQT.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Quản Trị Kinh Doanh' ,'quan-tri-kinh-doanh.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Giáo Trình Quản Trị Kinh Doanh Tập 1' ,'giaotrinhquantrikinhdoanhtap1.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Thúc Đẩy Quan Hệ Việt Nam - Ấn Độ' ,'thuc-day-quan-he.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Hợp Tác Ở Biển Đông Từ Góc Nhìn QHQT' ,'hop-tac-o-bien-dong.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Thuế 2018' ,'Thue-2018.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Lịch Sử QHQT' ,'lich-su-qhqt.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Tôn Giáo và QHQT' ,'ton-giao-va-qhqt.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Một Số Lí Luận QHQT' ,'mot-so-li-luan.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Quan Hệ Việt Nam - Hoa Kỳ' ,'quan-he-viet- nam-hoa-ki.jpg' ,GETDATE() , 2 ,4)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Quán Lí Hành Chính Nhà Nước' ,'quan-li-hanh-chinh-nha-nuoc.jpg' ,GETDATE() , 2 ,4)
--QTKD
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'10 Quy Luật Thành Công Trong Kinh Doanh' ,'10-quy-luat.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Phân Tích Tài Chính' ,'phan-tich-tai-chinh.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Đọc Hiểu Kinh Tế Học' ,'doc-hieu.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Quản Giá Chất Lượng Quản Trị Công Ty' ,'quan-gia.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Kĩ Năng Bán Hàng Quản Trị Kinh Doanh' ,'ki-nang-ban-hang.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Quản Lí Tài Chính' ,'quan-li-tai-chinh.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Kĩ Năng Quản Lí Hiệu Quả' ,'ki-nang-quan-li.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Quản Trị Kinh Doanh Cao Học' ,'quan-tri-kinh-doanh-cao-hoc.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Lãnh Đạo & Quản Trị Chiến Lược' ,'lanh-dao.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Quản Trị Kinh Doanh Khách Sạn' ,'quan-tri-kinh-doanh-khach-san.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'MBA Trong Quản Trị Kinh Doanh' ,'mba.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Tâm Lí Học Quản Trị Kinh Doanh' ,'tam-li.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Nghệ Thuật Quản Trị Kinh Doanh' ,'nghe-thuat-quan-tri.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Trí Tuệ Kinh Doanh Châu Á' ,'tri-tue.jpg' ,GETDATE() , 2 ,5)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Nhà Quản Trị Thành Công' ,'nha-quan-tri-thanh-cong.jpg' ,GETDATE() , 2 ,5)
-- Dulich - khach san
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Du lịch Việt Nam hội nhập trong ASEAN' ,'Biasach.jpg' ,GETDATE() , 2 ,6)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Báo cáo thường niên du lịch Việt Nam 2016' ,'Bia-Bao-cao-thuong-nien-2016.jpg' ,GETDATE() , 2 ,6)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Giao tiếp tiếng anh chuyên ngành khách sạn' ,'img171_9.jpg' ,GETDATE() , 2 ,6)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Đường vào nghề kinh doanh khách sạn' ,'duong-vao-nghe-kinh-doanh-khach-san-197x300.jpg' ,GETDATE() , 2 ,6)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Cẩm nang về dịch vụ nhà hàng khách sạn' ,'cam-nang-ve-dich-vu-khach-san-nha-hang-184x300.jpg' ,GETDATE() , 2 ,6)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Quản trị nguồn nhân lực ngành khách sạn' ,'quan-tri-nguon-nhan-luc.jpg' ,GETDATE() , 2 ,6)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Hotel management and operations' ,'hotel-management-and-operations-239x300.jpg' ,GETDATE() , 2 ,6)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Practical hotel management' ,'practical-hotel-management-200x300.jpg' ,GETDATE() , 2 ,6)
-- Kinh te - tai chinh
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Chiến thắng con quỷ trong bạn' ,'Chien-thang-con-quy.gif' ,GETDATE() , 2 ,7)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Khéo ăn nói sẽ có được thiên hạ' ,'Kheo-an-noi.jpg' ,GETDATE() , 2 ,7)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'13 nguyên tắc nghĩ giàu làm giàu' ,'13-nguyen-tac.gif' ,GETDATE() , 2 ,7)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Người nam châm' ,'nguoi-nam-cham-sach-ebook-190x300.jpg' ,GETDATE() , 2 ,7)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Đúng việc' ,'dung-viec-sach-ebook-171x300.gif' ,GETDATE() , 2 ,7)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Cú hích' ,'Cu-hich.jpg' ,GETDATE() , 2 ,7)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Tư duy nhanh và chậm' ,'tu-duy-nhanh-va-cham-233x300.jpg' ,GETDATE() , 2 ,7)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'7 thói quen hiệu quả' ,'7-thoi-quen-hieu-qua-195x300.gif' ,GETDATE() , 2 ,7)
-- ly luan chinh tri
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Chính trị luận' ,'chinh-tri-luan-ebook-200x300.jpg' ,GETDATE() , 2 ,8)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Tonye Blair-Hành trình chính trị' ,'Tony-Blair-hanh-trinh-chinh-tri.gif' ,GETDATE() , 2 ,8)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Brush và quyền lực nước Mỹ' ,'Bush-va-quyen-luc-nuoc-my.jpg' ,GETDATE() , 2 ,8)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Đường lối Đảng cộng sản Việt Nam' ,'duongloi.jpg' ,GETDATE() , 2 ,8)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Nhập môn triết học chính trị' ,'Triet-hoc-chinh-tri.jpg' ,GETDATE() , 2 ,8)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Chính trị thế giới sau năm 1945' ,'Chinh-tri-the-gioi-sau-nam-1945.jpg' ,GETDATE() , 2 ,8)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Hồi ký chính trị' ,'hoi-ky-chinh-tri-mahamad-201x300.gif' ,GETDATE() , 2 ,8)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Hilarry Rodham Linton-Người đàn bà quyền lực' ,'Nguoi-dan-ba-quyen-luc.gif' ,GETDATE() , 2 ,8)
-- luat
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Hệ thống mục lục ngân sách nhà nước' ,'hethong.jpg' ,GETDATE() , 2 ,9)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Bộ luật tố tụng hịnh sự' ,'hinhsu.jpg' ,GETDATE() , 2 ,9)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Luật xử lý vi phạm hành chính' ,'hanhchinh.jpg' ,GETDATE() , 2 ,9)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Pháp luật về đất đai' ,'datdai.jpg' ,GETDATE() , 2 ,9)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Luật phá sản 2014' ,'phasan.jpg' ,GETDATE() , 2 ,9)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Bộ luật tố tụng dân sự' ,'dansu.jpg' ,GETDATE() , 2 ,9)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Luật đất đai 2013' ,'datdai2013.jpg' ,GETDATE() , 2 ,9)
INSERT INTO dbo.Sach( TenSach ,AnhBia ,NgayCapNhat ,SoLuong ,MaKhoa)VALUES  ( N'Luật đấu thầu' ,'dauthau.jpg' ,GETDATE() , 2 ,9)
-- Admin
Go
CREATE TABLE Admin
(
	UserAdmin varchar(30) PRIMARY KEY,
	PassAdmin varchar(30) NOT NULL,
	Permission BIT NOT NULL,
	Hoten nvarchar(50)
)
GO
/****** Object:  Trigger [dbo].[Check_NgayTraSach]    Script Date: 5/22/2018 10:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[Check_NgayTraSach]
	ON [dbo].[PhieuMuonSach]
	FOR INSERT, UPDATE
	AS
	IF(UPDATE(NgayMuon))
	BEGIN	
		DECLARE @NgayMuon DATETIME, @NgayTra DATETIME
		SET @NgayMuon= (SELECT NgayMuon FROM Inserted)
		SET @NgayTra= (SELECT a.NgayTra FROM Inserted a, dbo.PhieuMuonSach b WHERE a.MaPhieuMuon= b.MaPhieuMuon)
		IF(@NgayMuon> @NgayTra)
		BEGIN
			PRINT 'Ngay muon phai nho hon ngay tra'
			ROLLBACK TRAN
		END
	END
GO
/****** Object:  Trigger [dbo].[CHECK_tuoi]    Script Date: 5/22/2018 10:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[CHECK_tuoi]
	ON [dbo].[TheDocGia]
	FOR  INSERT, UPDATE
	AS
	BEGIN
		DECLARE @Ngaysinh DATETIME
		SET @Ngaysinh=(SELECT Ngaysinh FROM Inserted)
		IF( YEAR(GETDATE())-YEAR(@Ngaysinh) <18)
		BEGIN
			PRINT 'doc gia chua du 18 tuoi'
			ROLLBACK TRAN
		END
	END