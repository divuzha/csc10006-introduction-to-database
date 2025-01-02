﻿USE QLDETAI
GO

--Q1
SELECT HOTEN, LUONG
FROM GIAOVIEN
WHERE PHAI = N'NỮ'

--Q2
SELECT HOTEN, LUONG*1.1 LUONGSAU
FROM GIAOVIEN

--Q3
SELECT MAGV
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM = BM.MABM
WHERE (HOTEN = N'NGUYỄN %' AND LUONG > 2000) OR (GV.MAGV = BM.TRUONGBM AND YEAR(BM.NGAYNHANCHUC) > 1995)

--Q4
SELECT HOTEN
FROM GIAOVIEN GV
JOIN BOMON BM ON GV.MABM = BM.MABM
JOIN KHOA K ON BM.MAKHOA = K.MAKHOA
WHERE TENKHOA = N'CÔNG NGHỆ THÔNG TIN'

--Q5
SELECT BM.*, GV.*
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MAGV = BM.TRUONGBM

--Q6
SELECT GV.HOTEN, BM.*
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM = BM.MABM

--Q7
SELECT DT.TENDT, GV.HOTEN GVCNDT
FROM DETAI DT JOIN GIAOVIEN GV ON DT.GVCNDT = GV.MAGV

--Q8
SELECT K.TENKHOA, GV.*
FROM KHOA K JOIN GIAOVIEN GV ON K.TRUONGKHOA = GV.MAGV

--Q9
SELECT DISTINCT GV.*
FROM GIAOVIEN GV
JOIN BOMON BM ON BM.MABM = GV.MABM
JOIN THAMGIADT TG ON TG.MAGV = GV.MAGV
WHERE TENBM = N'VI SINH' AND MADT = '006'

--Q10
SELECT MADT, HOTEN, NGSINH, DIACHI
FROM GIAOVIEN GV
JOIN DETAI DT ON DT.GVCNDT = GV.MAGV
JOIN CHUDE CD ON CD.MACD = DT.MACD
WHERE CAPQL = N'THÀNH PHỐ'

--Q11
SELECT GV1.HOTEN, GV2.HOTEN GVQLCM
FROM GIAOVIEN GV1 JOIN GIAOVIEN GV2 ON GV1.GVQLCM = GV2.MAGV

--Q12
SELECT GV1.HOTEN
FROM GIAOVIEN GV1 JOIN GIAOVIEN GV2 ON GV1.GVQLCM = GV2.MAGV
WHERE GV2.HOTEN = N'NGUYỄN THANH TÙNG'

--Q13
SELECT HOTEN
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MAGV = BM.TRUONGBM
WHERE TENBM = N'HỆ THỐNG THÔNG TIN'

--Q14
SELECT DISTINCT HOTEN
FROM GIAOVIEN GV
JOIN DETAI DT ON DT.GVCNDT = GV.MAGV
JOIN CHUDE CD ON CD.MACD = DT.MACD
WHERE TENCD = N'QUẢN LÝ GIÁO DỤC'

--Q15
SELECT TENCV
FROM CONGVIEC CV JOIN DETAI DT ON CV.MADT = DT.MADT
WHERE TENDT = N'HTTT %' 
AND CAPQL = N'ĐHQG' 
AND MONTH(CV.NGAYBD) = 3
AND YEAR(CV.NGAYBD) = 2008

--Q16
SELECT GV1.HOTEN, GV2.HOTEN GVQLCM
FROM GIAOVIEN GV1 JOIN GIAOVIEN GV2 ON GV1.GVQLCM = GV2.MAGV

SET DATEFORMAT DMY
GO

--Q17
SELECT*
FROM CONGVIEC
WHERE NGAYBD BETWEEN '01/01/2007' AND '01/08/2007'

--Q18
SELECT GV.HOTEN
FROM GIAOVIEN GV JOIN GIAOVIEN THH ON THH.HOTEN = N'TRẦN HÀ HƯƠNG' AND GV.MABM = THH.MABM
WHERE GV.HOTEN <> N'TRẦN HÀ HƯƠNG'

--Q19
SELECT DISTINCT GV.*
FROM GIAOVIEN GV
JOIN BOMON BM ON BM.TRUONGBM = GV.MAGV
JOIN DETAI DT ON DT.GVCNDT = GV.MAGV

--Q20
SELECT DISTINCT GV.*
FROM GIAOVIEN GV
JOIN BOMON BM ON BM.TRUONGBM = GV.MAGV
JOIN KHOA K ON K.TRUONGKHOA = GV.MAGV

--Q21
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV
JOIN BOMON BM ON BM.TRUONGBM = GV.MAGV
JOIN DETAI DT ON DT.GVCNDT = GV.MAGV

--Q22
SELECT DISTINCT GV.MAGV
FROM GIAOVIEN GV
JOIN KHOA K ON K.TRUONGKHOA = GV.MAGV
JOIN DETAI DT ON DT.GVCNDT = GV.MAGV

--Q23
SELECT DISTINCT GV.MAGV
FROM GIAOVIEN GV 
JOIN BOMON BM ON GV.MABM = BM.MABM AND GV.MABM = N'HTTT'
JOIN THAMGIADT TG ON TG.MAGV = GV.MAGV AND TG.MADT = '001'

--Q24
SELECT GV1.*
FROM GIAOVIEN GV1 JOIN GIAOVIEN GV2 ON GV2.MAGV = '002' AND GV1.MABM = GV2.MABM
WHERE GV1.MAGV <> GV2.MABM AND GV1.MAGV <> '002'

--Q25
SELECT GV.*
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MAGV = BM.TRUONGBM

--Q26
SELECT HOTEN, LUONG 
FROM GIAOVIEN

--Q27
SELECT COUNT(MAGV) SLGV, SUM(LUONG) TONGLUONG
FROM GIAOVIEN

--Q28
SELECT MABM, COUNT(MAGV) SLGV, AVG(LUONG)
FROM GIAOVIEN
GROUP BY MABM

--Q29
SELECT TENCD, COUNT(MADT) SLDT
FROM CHUDE CD JOIN DETAI DT ON CD.MACD = DT.MACD
GROUP BY TENCD

--Q30
SELECT HOTEN, COUNT(DISTINCT MADT) SLDT
FROM GIAOVIEN GV JOIN THAMGIADT TG ON GV.MAGV = TG.MAGV
GROUP BY HOTEN

--Q31
SELECT HOTEN, COUNT(MADT) SLDT
FROM GIAOVIEN GV JOIN DETAI DT ON  GV.MAGV = DT.GVCNDT
GROUP BY HOTEN

--Q32
SELECT HOTEN, COUNT(NT.MAGV) SLNT
FROM GIAOVIEN GV JOIN NGUOITHAN NT ON GV.MAGV = NT.MAGV
GROUP BY HOTEN, GV.MAGV

--Q33
SELECT HOTEN
FROM GIAOVIEN GV JOIN THAMGIADT TG ON GV.MAGV = TG.MAGV
GROUP BY GV.HOTEN, GV.MAGV, GV.DIACHI, GV.GVQLCM, GV.LUONG, GV.MABM, GV.NGSINH, GV.PHAI
HAVING COUNT(DISTINCT MADT) > 3

--Q34
SELECT COUNT(DISTINCT MAGV) SLGV
FROM DETAI DT JOIN THAMGIADT TG ON DT.MADT = TG.MADT
WHERE TENDT = N'NGHIÊN CỨU TẾ BÀO GỐC'