/*
Lớp: 22CLC08
Mã đề: 1
MSSV: 22127098
Họ tên: Đinh Vũ Gia Hân
Vị trí ngồi: B8
*/

USE QLTSinh
GO

-- 1)
SELECT K.MaKhoi, K.TenKhoi
FROM Khoi K JOIN ThiSinh TS ON K.MaKhoi = TS.Khoi
WHERE TS.HoKhau LIKE N'% Dong Nai'
GROUP BY K.MaKhoi, K.TenKhoi
HAVING COUNT(TS.SBD) >= ALL(SELECT COUNT(TS1.SBD)
							FROM Khoi K1 JOIN ThiSinh TS1 ON K1.MaKhoi = TS1.Khoi
							WHERE TS1.HoKhau LIKE N'% Dong Nai'
							GROUP BY K1.MaKhoi, K1.TenKhoi)

-- 2)
SELECT N.MaNganh, N.TenNganh, TS.SBD, TS.HoTen, SUM(DT.Diem)
FROM Nganh N JOIN ThiSinh TS ON N.MaNganh = TS.Nganh
			 JOIN DuThi DT ON DT.SBD = TS.SBD
GROUP BY N.MaNganh, N.TenNganh, TS.SBD, TS.HoTen
HAVING SUM(DT.Diem) >= ALL(SELECT SUM(DT1.Diem)
						   FROM Nganh N1 JOIN ThiSinh TS1 ON N1.MaNganh = TS1.Nganh
										JOIN DuThi DT1 ON DT1.SBD = TS1.SBD
						   WHERE N1.MaNganh = N.MaNganh
						   GROUP BY N1.MaNganh, N1.TenNganh, TS1.SBD, TS1.HoTen)
						   
-- 3)
SELECT DISTINCT K.MaKhoi
FROM Khoi K JOIN Nganh_Khoi NK ON K.MaKhoi = NK.MaKhoi
			JOIN Nganh N ON NK.MaNganh = N.MaNganh
WHERE NOT EXISTS((SELECT N1.MaNganh
				  FROM Nganh N1
				  WHERE N1.TenNganh LIKE N'%Cong nghe%')
				  EXCEPT 
				 (SELECT N2.MaNganh
				  FROM Khoi K2 JOIN Nganh_Khoi NK2 ON K2.MaKhoi = NK2.MaKhoi
							   JOIN Nganh N2 ON NK2.MaNganh = N2.MaNganh
				  WHERE K2.MaKhoi = K.MaKhoi))

-- 4)
CREATE PROC sp_ThongKeNganh @MaNganh char(3), @Ketqua int out
AS
BEGIN
	IF (NOT EXISTS(SELECT*
				   FROM NGANH N
				   WHERE N.MaNganh = @MaNganh))
	BEGIN
		PRINT 'Ma nganh khong ton tai'
		RETURN 0
	END

	SELECT @Ketqua = COUNT(DISTINCT TS.SBD)
	FROM ThiSinh TS JOIN  DuThi DT ON TS.SBD = DT.SBD
					JOIN Nganh_Khoi NK ON TS.Nganh = NK.MaNganh AND TS.Khoi = NK.MaKhoi
	WHERE TS.Nganh = @MaNganh
	GROUP BY TS.SBD, NK.DiemChuan
	HAVING COUNT(DT.MaBT) = 3 AND SUM(DT.Diem) >= NK.DiemChuan

	RETURN @Ketqua
END

DECLARE @Ketqua int
EXEC sp_ThongKeNganh '101', @Ketqua out
PRINT 'So luong thi sinh dau: ' + cast(@Ketqua as char(3))
