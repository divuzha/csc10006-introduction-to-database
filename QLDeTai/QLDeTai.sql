﻿USE master
GO

IF DB_ID('QLDETAI') IS NOT NULL
	DROP DATABASE QLDETAI
GO

CREATE DATABASE QLDETAI
GO

USE QLDETAI
GO

CREATE TABLE GIAOVIEN (
	MAGV CHAR(5),
	HOTEN NVARCHAR(40),
	LUONG FLOAT,
	PHAI NCHAR(3),
	NGSINH DATE,
	DIACHI NVARCHAR(100),
	GVQLCM CHAR(5),
	MABM NCHAR(5)

	CONSTRAINT PK_GIAOVIEN
	PRIMARY KEY(MAGV)
)

CREATE TABLE GV_DT (
	MAGV CHAR(5), 
	DIENTHOAI CHAR(12)

	CONSTRAINT PK_GV_DT
	PRIMARY KEY(MAGV, DIENTHOAI)
)

CREATE TABLE BOMON (
	MABM NCHAR(5),
	TENBM NVARCHAR(40),	 
	PHONG CHAR(5),
	DIENTHOAI CHAR(12), 
	TRUONGBM CHAR(5),
	MAKHOA CHAR(4), 	
	NGAYNHANCHUC DATE

	CONSTRAINT PK_BOMON
	PRIMARY KEY(MABM)
)

CREATE TABLE KHOA (
	MAKHOA CHAR(4), 
	TENKHOA NVARCHAR(40),
	NAMTL INT, 
	PHONG CHAR(5),
	DIENTHOAI CHAR(12),	
	TRUONGKHOA CHAR(5),
	NGAYNHANCHUC DATE

	CONSTRAINT PK_KHOA
	PRIMARY KEY(MAKHOA)
)

CREATE TABLE DETAI (
	MADT CHAR(3),
	TENDT NVARCHAR(100),
	CAPQL NVARCHAR(40),
	KINHPHI FLOAT, 
	NGAYBD DATE, 
	NGAYKT DATE, 	
	MACD NCHAR(4),
	GVCNDT CHAR(5)	

	CONSTRAINT PK_DETAI
	PRIMARY KEY(MADT)
)

CREATE TABLE CHUDE (
	MACD NCHAR(4), 
	TENCD NVARCHAR(50)

	CONSTRAINT PK_CHUDE
	PRIMARY KEY(MACD)
)

CREATE TABLE CONGVIEC (
	MADT CHAR(3), 
	SOTT INT,
	TENCV NVARCHAR(40),
	NGAYBD DATE,
	NGAYKT DATE

	CONSTRAINT PK_CONGVIEC
	PRIMARY KEY(MADT, SOTT)
)

CREATE TABLE THAMGIADT (
	MAGV CHAR(5), 
	MADT CHAR(3),
	STT INT,
	PHUCAP FLOAT, 
	KETQUA NVARCHAR(40)

	CONSTRAINT PK_THAMGIADT
	PRIMARY KEY(MAGV, MADT, STT)
)

CREATE TABLE NGUOITHAN (
	MAGV CHAR(5),
	TEN NVARCHAR(20),
	NGSINH DATE, 
	PHAI NCHAR(3)

	CONSTRAINT PK_NGUOITHAN
	PRIMARY KEY(MAGV, TEN)
)

ALTER TABLE GIAOVIEN
ADD
	CONSTRAINT FK_GIAOVIEN_GIAOVIEN
	FOREIGN KEY(GVQLCM)
	REFERENCES GIAOVIEN,

	CONSTRAINT FK_GIAOVIEN_BOMON
	FOREIGN KEY(MABM)
	REFERENCES BOMON

ALTER TABLE GV_DT
ADD
	CONSTRAINT FK_GV_DT_GIAOVIEN
	FOREIGN KEY(MAGV)
	REFERENCES GIAOVIEN

ALTER TABLE BOMON
ADD
	CONSTRAINT FK_BOMON_KHOA
	FOREIGN KEY(MAKHOA)
	REFERENCES KHOA,

	CONSTRAINT FK_BOMON_GIAOVIEN
	FOREIGN KEY(TRUONGBM)
	REFERENCES GIAOVIEN

ALTER TABLE KHOA
ADD
	CONSTRAINT FK_KHOA_GIAOVIEN
	FOREIGN KEY(TRUONGKHOA)
	REFERENCES GIAOVIEN

ALTER TABLE DETAI
ADD
	CONSTRAINT FK_DETAI_CHUDE
	FOREIGN KEY(MACD)
	REFERENCES CHUDE,

	CONSTRAINT FK_DETAI_GIAOVIEN
	FOREIGN KEY(GVCNDT)
	REFERENCES GIAOVIEN

ALTER TABLE CONGVIEC
ADD
	CONSTRAINT FK_CONGVIEC_DETAI
	FOREIGN KEY(MADT)
	REFERENCES DETAI

ALTER TABLE THAMGIADT
ADD
	CONSTRAINT FK_THAMGIADT_CONGVIEC
	FOREIGN KEY(MADT, STT)
	REFERENCES CONGVIEC,

	CONSTRAINT FK_THAMGIADT_GIAOVIEN
	FOREIGN KEY(MAGV)
	REFERENCES GIAOVIEN

ALTER TABLE NGUOITHAN
ADD
	CONSTRAINT FK_NGUOITHAN_GIAOVIEN
	FOREIGN KEY(MAGV)
	REFERENCES GIAOVIEN

SET DATEFORMAT YMD
GO

INSERT GIAOVIEN(MAGV, HOTEN, LUONG, PHAI, NGSINH, DIACHI, GVQLCM)
VALUES('001', N'Nguyễn Hoài An', 2000.0, N'Nam', '1973-02-15', N'25/3 Lạc Long Quân, Q.10, TP HCM', NULL),
	('002', N'Trần Hà Hương', 2500.0, N'Nữ', '1960-06-20', N'125 Trần Hưng Đạo, Q.1, TP HCM', NULL),
	('003', N'Nguyễn Ngọc Ánh', 2200.0, N'Nữ', '1975-05-11', N'12/21 Võ Văn Ngân Thủ Đức, TP HCM', '002'),
	('004', N'Trương Nam Sơn', 2300.0, N'Nam', '1959-06-20', N'215 Lý Thường Kiệt, TP Biên Hòa', NULL),
	('005', N'Lý Hoàng Hà', 2500.0, N'Nam', '1954-10-23', N'22/5 Nguyễn Xí, Q.Bình Thạnh, TP HCM', NULL),
	('006', N'Trần Bạch Tuyết', 1500.0, N'Nữ', '1980-05-20', N'127 Hùng Vương, TP Mỹ Tho', '004'),
	('007', N'Nguyễn An Trung', 2100.0, N'Nam', '1976-06-05', N'3/2, TP Biên Hòa', NULL),
	('008', N'Trần Trung Hiếu', 1800.0, N'Nam', '1977-08-06', N'22/11 Lý Thường Kiệt, TP Mỹ Tho', '007'),
	('009', N'Trần Hoàng Nam', 2000.0, N'Nam', '1975-11-22', N'234 Trần Não, An Phú, TP HCM', '001'),
	('010', N'Phạm Nam Thanh', 1500.0, N'Nam', '1980-12-12', N'221 Hùng Vương, Q.5, TP HCM', '007')

INSERT CHUDE(MACD, TENCD)
VALUES(N'NCPT', N'Nghiên cứu phát triển'),
	(N'QLGD', N'Quản lý giáo dục'),
	(N'UDCN', N'Ứng dụng công nghệ')

INSERT NGUOITHAN(MAGV, TEN, NGSINH, PHAI)
VALUES('001', N'Hùng', '1990-01-14', N'Nam'),
	('001', N'Thủy', '1994-12-08', N'Nữ'),
	('003', N'Hà', '1998-09-03', N'Nữ'),
	('003', N'Thu', '1998-09-03', N'Nữ'),
	('007', N'Mai', '2003-03-26', N'Nữ'),
	('007', N'Vy', '2000-02-14', N'Nữ'),
	('008', N'Nam', '1991-05-06', N'Nam'),
	('009', N'An', '1996-08-19', N'Nam'),
	('010', N'Nguyệt', '2006-01-14', N'Nữ')

INSERT GV_DT(MAGV, DIENTHOAI)
VALUES('001', '0838912112'),
	('001', '0903123123'),
	('002', '0913454545'),
	('003', '0838121212'),
	('003', '0903656565'),
	('003', '0937125125'),
	('006', '0937888888'),
	('008', '0653717171'),
	('008', '0913232323')

INSERT DETAI(MADT, TENDT, CAPQL, KINHPHI, NGAYBD, NGAYKT, MACD, GVCNDT)
VALUES('001', N'HTTT quản lý các trường ĐH', N'ĐHQG', 20.0, '2007-10-20', '2008-10-20', N'QLGD', '002'),
	('002', N'HTTT quản lý giáo vụ cho một Khoa', N'Trường', 20.0, '2000-10-12', '2001-10-12', N'QLGD', '002'),
	('003', N'Nghiên cứu chế tạo sợi Nanô Platin', N'ĐHQG', 300.0, '2008-05-15', '2010-05-15', N'NCPT', '005'),
	('004', N'Tạo vật liệu sinh học bằng màng ối người', N'Nhà nước', 100.0, '2007-01-01', '2009-12-31', N'NCPT', '004'),
	('005', N'Ứng dụng hóa học xanh', N'Trường', 200.0, '2003-10-10', '2004-12-10', N'UDCN', '007'),
	('006', N'Nghiên cứu tế bào gốc', N'Nhà nước', 4000.0, '2006-10-20', '2009-10-20', N'NCPT', '004'),
	('007', N'HTTT quản lý thư viện ở các trường ĐH', N'Trường', 20.0, '2009-05-10', '2010-05-10', N'QLGD', '001')

INSERT CONGVIEC(MADT, SOTT, TENCV, NGAYBD, NGAYKT)
VALUES('001', 1, N'Khởi tạo và Lập kế hoạch', '2007-10-20', '2008-12-20'),
	('001', 2, N'Xác định yêu cầu', '2008-12-21', '2008-03-21'),
	('001', 3, N'Phân tích hệ thống', '2008-03-22', '2008-05-22'),
	('001', 4, N'Thiết kế hệ thống', '2008-05-23', '2008-06-23'),
	('001', 5, N'Cài đặt thử nghiệm', '2008-06-24', '2008-10-20'),
	('002', 1, N'Khởi tạo và Lập kế hoạch', '2009-05-10', '2009-07-10'),
	('002', 2, N'Xác định yêu cầu', '2009-07-11', '2009-10-11'),
	('002', 3, N'Phân tích hệ thống', '2009-10-12', '2009-12-20'),
	('002', 4, N'Thiết kế hệ thống', '2009-12-21', '2010-03-22'),
	('002', 5, N'Cài đặt thử nghiệm', '2010-03-23', '2010-05-10'),
	('006', 1, N'Lấy mẫu', '2006-10-20', '2007-02-20'),
	('006', 2, N'Nuôi cấy', '2007-02-21', '2008-08-21')

INSERT THAMGIADT(MAGV, MADT, STT, PHUCAP, KETQUA)
VALUES('001', '002', 1, 0.0, NULL),
	('001', '002', 2, 2.0, NULL),
	('002', '001', 4, 2.0, N'Đạt'),
	('003', '001', 1, 1.0, N'Đạt'),
	('003', '001', 2, 0.0, N'Đạt'),
	('003', '001', 4, 1.0, N'Đạt'),
	('003', '002', 2, 0.0, NULL),
	('004', '006', 1, 0.0, N'Đạt'),
	('004', '006', 2, 1.0, N'Đạt'),
	('006', '006', 2, 1.5, N'Đạt'),
	('009', '002', 3, 0.5, NULL),
	('009', '002', 4, 1.5, NULL)

INSERT KHOA(MAKHOA, TENKHOA, NAMTL, PHONG, DIENTHOAI, TRUONGKHOA, NGAYNHANCHUC)
VALUES('CNTT', N'Công nghệ thông tin', 1995, 'B11', '0838123456', '002', '2005-02-20'),
	('HH', N'Hóa học', 1980, 'B41', '0838456456', '007', '2001-10-15'),
	('SH', N'Sinh học', 1980, 'B31', '0838454545', '004', '2000-10-11'),
	('VL', N'Vật lý', 1976, 'B21', '0838223223', '005', '2003-09-18')

INSERT BOMON(MABM, TENBM, PHONG, DIENTHOAI, TRUONGBM, MAKHOA, NGAYNHANCHUC)
VALUES(N'CNTT', N'Công nghệ tri thức', 'B15', '0838126126', NULL, 'CNTT', NULL),
	(N'HHC', N'Hóa hữu cơ', 'B44', '838222222', NULL, 'HH', NULL),
	(N'HL', N'Hóa lý', 'B42', '0838878787', NULL, 'HH', NULL),
	(N'HPT', N'Hóa phân tích', 'B43', '0838777777', '007', 'HH', '2007-10-15'),
	(N'HTTT', N'Hệ thống thông tin', 'B13', '0838125125', '002', 'CNTT', '2004-09-20'),
	(N'MMT', N'Mạng máy tính', 'B16', '0838676767', '001', 'CNTT', '2005-05-15'),
	(N'SH', N'Sinh hóa', 'B33', '0838898989', NULL, 'SH', NULL),
	(N'VLĐT', N'Vật lý điện tử', 'B23', '0838234234', NULL, 'VL', NULL),
	(N'VLƯD', N'Vật lý ứng dụng', 'B24', '0838454545', '005', 'VL', '2006-02-18'),
	(N'VS', N'Vi sinh', 'B32', '0838909090', '004', 'SH', '2007-01-01')

UPDATE GIAOVIEN
SET MABM = N'MMT'
WHERE MAGV = '001'

UPDATE GIAOVIEN
SET MABM = N'HTTT'
WHERE MAGV = '002'

UPDATE GIAOVIEN
SET MABM = N'HTTT'
WHERE MAGV = '003'

UPDATE GIAOVIEN
SET MABM = N'VS'
WHERE MAGV = '004'

UPDATE GIAOVIEN
SET MABM = N'VLĐT'
WHERE MAGV = '005'

UPDATE GIAOVIEN
SET MABM = N'VS'
WHERE MAGV = '006'

UPDATE GIAOVIEN
SET MABM = N'HPT'
WHERE MAGV = '007'

UPDATE GIAOVIEN
SET MABM = N'HPT'
WHERE MAGV = '008'

UPDATE GIAOVIEN
SET MABM = N'MMT'
WHERE MAGV = '009'

UPDATE GIAOVIEN
SET MABM = N'HPT'
WHERE MAGV = '010'

SELECT* FROM CONGVIEC
SELECT* FROM THAMGIADT
SELECT* FROM NGUOITHAN
SELECT* FROM KHOA
SELECT* FROM GIAOVIEN
SELECT* FROM CHUDE
SELECT* FROM DETAI
SELECT* FROM BOMON
SELECT* FROM GV_DT