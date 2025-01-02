﻿USE QLDETAI
GO

--Q58 Cho biết tên giáo viên nào mà tham đề tải đủ tất cả các chủ đề
--EXCEPT
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(SELECT CD.MACD
				FROM CHUDE CD
				EXCEPT 
				SELECT DT.MACD
				FROM THAMGIADT TG JOIN DETAI DT ON TG.MADT = DT.MADT
				WHERE TG.MAGV = GV.MAGV)

SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV JOIN THAMGIADT TG ON GV.MAGV = TG.MAGV
				JOIN DETAI DT ON TG.MADT = DT.MADT
GROUP BY GV.MAGV, GV.HOTEN
HAVING COUNT(DISTINCT DT.MACD) = (SELECT COUNT(*) FROM CHUDE)
--NOT EXISTS
--COUNT

--Q59 Cho biết tên đề tài nào được tất cả giáo viên bộ môn HTTT tham gia
--EXCEPT
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(SELECT GV.MAGV
				FROM GIAOVIEN GV
				WHERE GV.MABM = 'HTTT'
				EXCEPT 
				SELECT TG.MAGV
				FROM THAMGIADT TG 
				WHERE DT.MADT = TG.MADT)	

--NOT EXISTS
--COUNT

--Q60 Cho biết tên đề tài có tất cả giảng viên bộ môn "Hệ thống thông tin" tham gia
--EXCEPT
SELECT TENDT
FROM DETAI DT 
WHERE NOT EXISTS(SELECT GV.MAGV 
				FROM GIAOVIEN GV
				WHERE GV.MABM = 'HTTT'
				EXCEPT
				SELECT TG.MAGV
				FROM THAMGIADT TG
				WHERE DT.MADT = TG.MADT)

--NOT EXISTS
--COUNT

--Q61 Cho biết giáo viên nào đã tham gia tất cả các đề tài có mã chủ đề là QLGD
--EXCEPT
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(SELECT DT.MADT
				FROM DETAI DT
				WHERE DT.MACD = 'QLGD'
				EXCEPT
				SELECT TG.MADT
				FROM THAMGIADT TG
				WHERE TG.MAGV = GV.MAGV)

--NOT EXISTS
--COUNT

--Q62 Cho biết tên giáo viên nào tham gia tất cả các đề tài mà Trần Trà Hương đã tham gia
--EXCEPT
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(SELECT DT.MADT
				FROM DETAI DT, THAMGIADT TG, GIAOVIEN GV
				WHERE DT.MADT = TG.MADT AND TG.MAGV = GV.MAGV AND GV.HOTEN = N'TRẦN TRÀ HƯƠNG'
				EXCEPT
				SELECT TG.MADT
				FROM THAMGIADT TG
				WHERE TG.MAGV = GV.MAGV)

--NOT EXISTS
--COUNT

--Q63 Cho biết tên đề tài nào được tất cả các giáo viên của bộ môn Hóa Hữu Cơ tham gia
--EXCEPT
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(SELECT GV.MAGV
				FROM GIAOVIEN GV, BOMON BM
				WHERE GV.MABM = BM.MABM AND BM.TENBM = N'HÓA HỮU CƠ'
				EXCEPT 
				SELECT TG.MAGV
				FROM THAMGIADT TG
				WHERE DT.MADT = TG.MADT)

--NOT EXISTS
--COUNT

--Q64 Cho biết tên giáo viên nào tham gia tất cả các công việc của đề tài 006
--EXCEPT
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(SELECT DT.MADT, CV.SOTT
				FROM CONGVIEC CV, DETAI DT
				WHERE CV.MADT = DT.MADT  AND DT.MADT = '006' 
				EXCEPT 
				SELECT TG.MADT, TG.STT
				FROM THAMGIADT TG
				WHERE TG.MAGV = GV.MAGV)

--NOT EXISTS
--COUNT

--Q65 Cho biết giáo viên nào đã tham gia tất cả đề tài của chủ đề Ứng dụng công nghệ
--EXCEPT
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(SELECT DT.MADT
				FROM DETAI DT, CHUDE CD
				WHERE DT.MACD = CD.MACD AND CD.TENCD = N'ỨNG DỤNG CÔNG NGHỆ'
				EXCEPT 
				SELECT TG.MADT
				FROM THAMGIADT TG
				WHERE TG.MAGV = GV.MAGV)

--NOT EXISTS
--COUNT

--Q66 Cho biết tên giáo viên nào đã tham gia tất cả các đề tài do Trầ Trà Hương làm chủ nhiệm
--EXCEPT
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(SELECT DT.MADT
				FROM DETAI DT, GIAOVIEN GV
				WHERE DT.GVCNDT = GV.MAGV AND GV.HOTEN = N'TRẦN TRÀ HƯƠNG'
				EXCEPT
				SELECT TG.MADT
				FROM THAMGIADT TG
				WHERE TG.MAGV = GV.MAGV)

--NOT EXISTS
--COUNT

--Q67 Cho biết tên đề tài nào mà được tất cả các giáo viên của khoa CNTT tham gia
--EXCEPT
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(SELECT GV.MAGV
				FROM GIAOVIEN GV, BOMON BM
				WHERE GV.MABM = BM.MABM AND BM.MAKHOA = 'CNTT'
				EXCEPT
				SELECT TG.MAGV
				FROM THAMGIADT TG
				WHERE DT.MADT = TG.MADT)

--NOT EXISTS
--COUNT

--Q68 Cho biết tên giáo viên nào tham gia tất cả các công việc của đề tài Nghiên cứu tế bào gốc
--EXCEPT
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(SELECT DT.MADT, CV.SOTT
				FROM CONGVIEC CV, DETAI DT
				WHERE CV.MADT = DT.MADT AND DT.TENDT = N'NGHIÊN CỨU TẾ BÀO GỐC'
				EXCEPT
				SELECT TG.MADT, TG.STT
				FROM THAMGIADT TG
				WHERE TG.MAGV = GV.MAGV)

--NOT EXISTS
--COUNT

--Q69 Tìm tên tất cả các giáo viên được phân công làm các đề tài có kinh phí trên 100 triệu
--EXCEPT
SELECT HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(SELECT DT.MADT
				FROM DETAI DT
				WHERE DT.KINHPHI > 1000000
				EXCEPT
				SELECT TG.MADT
				FROM THAMGIADT TG
				WHERE TG.MAGV = GV.MAGV)

--NOT EXISTS
--COUNT

--Q70 Cho biết tên đề tài nào được tất cả các giáo viên khoa Sinh học tham gia
--EXCEPT
SELECT TENDT
FROM DETAI DT
WHERE NOT EXISTS(SELECT GV.MAGV	
				FROM GIAOVIEN GV, BOMON BM, KHOA K
				WHERE GV.MABM = BM.MABM AND BM.MAKHOA = K.MAKHOA AND K.TENKHOA = N'SINH HỌC'
				EXCEPT
				SELECT TG.MAGV
				FROM THAMGIADT TG
				WHERE TG.MADT = DT.MADT)

--NOT EXISTS
--COUNT

--Q71 Cho biết MAGV, HOTEN, NGSINH của giáo viên tham gia tất các các công việc của đề tài Ứng dụng hóa học xanh'
--EXCEPT
SELECT GV.MAGV, GV.HOTEN, GV.NGSINH
FROM GIAOVIEN GV
WHERE NOT EXISTS(SELECT DT.MADT, CV.SOTT
				FROM DETAI DT, CONGVIEC CV
				WHERE DT.MADT = CV.MADT AND DT.TENDT = N'ỨNG DỤNG HÓA HỌC XANH'
				EXCEPT
				SELECT TG.MADT, TG.STT
				FROM THAMGIADT TG
				WHERE TG.MAGV = GV.MAGV)
--NOT EXISTS
--COUNT

--Q72 Cho biết MAGV, HOTEN, TENBM, QVQLCM của giáo viên tham gia tất các các đề tài thuộc chủ đề Nghiên cứu phát triển
--EXCEPT
SELECT GV.MAGV, GV.HOTEN, BM.TENBM, GV.GVQLCM
FROM GIAOVIEN GV, BOMON BM
WHERE GV.MABM = BM.MABM AND NOT EXISTS(SELECT DT.MADT
									FROM DETAI DT, CHUDE CD
									WHERE DT.MACD = CD.MACD AND CD.TENCD = N'NGHIÊN CỨU PHÁT TRIỂN'
									EXCEPT
									SELECT TG.MADT
									FROM THAMGIADT TG
									WHERE TG.MAGV = GV.MAGV)
--NOT EXISTS
--COUNT

-- 73 Cho biết họ tên, ngày sinh, tên khoa, tên trưởng khoa 
--của giáo viên tham gia tất cả các đề tài có giáo viên “Nguyễn Hoài An” tham gia
SELECT GV.MAGV, GV.HOTEN, GV.NGSINH, K.TENKHOA, TK.HOTEN TRUONGKHOA
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM = BM.MABM
				JOIN KHOA K ON BM.MAKHOA = K.MAKHOA
				JOIN GIAOVIEN TK ON TK.MAGV = K.TRUONGKHOA
				JOIN THAMGIADT TG1 ON TG1.MAGV = GV.MAGV
				JOIN THAMGIADT TG2 ON TG2.MADT = TG1.MADT
				JOIN GIAOVIEN NHA ON TG2.MAGV = NHA.MAGV
WHERE GV.HOTEN != N'NGUYỄN HOÀI AN' AND NHA.HOTEN = N'NGUYỄN HOÀI AN'
GROUP BY GV.MAGV, GV.HOTEN, GV.NGSINH, K.TENKHOA, TK.HOTEN
HAVING COUNT(DISTINCT TG1.MADT) = (SELECT COUNT(DISTINCT TG3.MADT)
									FROM THAMGIADT TG3 JOIN GIAOVIEN GV3 ON TG3.MAGV = GV3.MAGV
									WHERE GV3.HOTEN = N'NGUYỄN HOÀI AN')

SELECT GV.MAGV, GV.HOTEN, GV.NGSINH, K.TENKHOA, TK.HOTEN TRUONGKHOA
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM = BM.MABM
				JOIN KHOA K ON K.MAKHOA = BM.MAKHOA
				JOIN GIAOVIEN TK ON TK.MAGV = K.TRUONGKHOA
WHERE GV.HOTEN != N'NGUYỄN HOÀI AN'
AND NOT EXISTS(SELECT TGNHA.MADT
				FROM THAMGIADT TGNHA JOIN GIAOVIEN NHA ON TGNHA.MAGV = NHA.MAGV
				WHERE NHA.HOTEN = N'NGUYỄN HOÀI AN'
				EXCEPT
				SELECT TG.MADT
				FROM THAMGIADT TG
				WHERE TG.MAGV = GV.MAGV)
AND EXISTS(SELECT TGNHA.MADT
			FROM THAMGIADT TGNHA JOIN GIAOVIEN NHA ON TGNHA.MAGV = NHA.MAGV
			WHERE NHA.HOTEN = N'NGUYỄN HOÀI AN')
