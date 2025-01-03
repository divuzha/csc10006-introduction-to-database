USE [QLLopHoc]
GO
INSERT [dbo].[GIAOVIEN] ([magv], [hoten], [gioitinh], [ngaysinh], [diachi]) VALUES (N'1000        ', N'Lê Văn Luyện', N'Nam       ', CAST(N'1980-05-01' AS Date), N'4 Nguyễn Đình Chiểu')
INSERT [dbo].[GIAOVIEN] ([magv], [hoten], [gioitinh], [ngaysinh], [diachi]) VALUES (N'1001        ', N'Quan Văn Ón', N'Nam       ', CAST(N'1976-11-04' AS Date), N'35 Nguyễn Trãi')
INSERT [dbo].[GIAOVIEN] ([magv], [hoten], [gioitinh], [ngaysinh], [diachi]) VALUES (N'1002        ', N'Bùi Huy Thông', N'Nam       ', CAST(N'1990-05-30' AS Date), N'34 Võ Văn Tần')
INSERT [dbo].[GIAOVIEN] ([magv], [hoten], [gioitinh], [ngaysinh], [diachi]) VALUES (N'1003        ', N'Trần Thị Thảo Nhi', N'Nữ        ', CAST(N'1985-02-23' AS Date), N'10 Vườn Chuối')
INSERT [dbo].[GIAOVIEN] ([magv], [hoten], [gioitinh], [ngaysinh], [diachi]) VALUES (N'1004        ', N'Đỗ Nguyên Kha', N'Nam       ', CAST(N'1978-10-01' AS Date), N'19 Cô Giang')
GO
INSERT [dbo].[HOCSINH] ([mahs], [hoten], [gioitinh], [ngaysinh], [diachi], [malop]) VALUES (N'22127091    ', N'Phạm Mai Duyên', N'Nữ        ', CAST(N'2004-10-15' AS Date), N'10 Trần Hưng Đại', 9)
INSERT [dbo].[HOCSINH] ([mahs], [hoten], [gioitinh], [ngaysinh], [diachi], [malop]) VALUES (N'22127098    ', N'Đinh Vũ Gia Hân', N'Nữ        ', CAST(N'2004-03-23' AS Date), N'28 Huỳnh Tịnh Của', 8)
INSERT [dbo].[HOCSINH] ([mahs], [hoten], [gioitinh], [ngaysinh], [diachi], [malop]) VALUES (N'22127104    ', N'Phạm Thị Mỹ Hạnh', N'Nữ        ', CAST(N'2004-02-24' AS Date), N'44 Dương Bá Trạc', 7)
INSERT [dbo].[HOCSINH] ([mahs], [hoten], [gioitinh], [ngaysinh], [diachi], [malop]) VALUES (N'22127232    ', N'Lê Thị Ngọc Linh', N'Nữ        ', CAST(N'2004-08-25' AS Date), N'5 Quang Phổ', 6)
INSERT [dbo].[HOCSINH] ([mahs], [hoten], [gioitinh], [ngaysinh], [diachi], [malop]) VALUES (N'22127450    ', N'Trần Minh Thư', N'Nữ        ', CAST(N'2004-05-12' AS Date), N'17 Nguyễn Thái Bình', 5)
GO
INSERT [dbo].[LOPHOC] ([malop], [tenlop], [nam], [gvcn], [lop_tr]) VALUES (5, N'22CLC05   ', 2022, N'1000        ', N'22127450    ')
INSERT [dbo].[LOPHOC] ([malop], [tenlop], [nam], [gvcn], [lop_tr]) VALUES (6, N'22CLC06   ', 2022, N'1001        ', N'22127232    ')
INSERT [dbo].[LOPHOC] ([malop], [tenlop], [nam], [gvcn], [lop_tr]) VALUES (7, N'22CLC07   ', 2022, N'1002        ', N'22127104    ')
INSERT [dbo].[LOPHOC] ([malop], [tenlop], [nam], [gvcn], [lop_tr]) VALUES (8, N'22CLC08   ', 2022, N'1003        ', N'22127098    ')
INSERT [dbo].[LOPHOC] ([malop], [tenlop], [nam], [gvcn], [lop_tr]) VALUES (9, N'22CLC09   ', 2022, N'1004        ', N'22127091    ')
GO
