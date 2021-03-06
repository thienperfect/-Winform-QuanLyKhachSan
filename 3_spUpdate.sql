USE [DoAnCSDLNC_Index]
GO
/****** Object:  StoredProcedure [dbo].[sp_BaoCaoDoanhThu]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BaoCaoDoanhThu] @thang INT, @nam INT
AS
	IF (@thang = -1)
	BEGIN
		IF (@nam = -1)
		BEGIN 
			RAISERROR('Lỗi : Vui lòng chọn tiêu chí báo cáo',16,1)
			RETURN
		END
		ELSE
		BEGIN  
			SELECT YEAR(ngayThanhToan) AS 'Năm', SUM(tongTien) AS 'Tổng doanh thu'
			FROM HoaDon
			WHERE YEAR(ngayThanhToan) = @nam
			GROUP BY YEAR(ngayThanhToan)
			ORDER BY YEAR(ngayThanhToan)
		END 
	END
	ELSE
    BEGIN
		IF (@nam = -1)
		BEGIN 
			RAISERROR('Lỗi : Vui lòng chọn năm',16,1)
			RETURN
		END
		ELSE
		BEGIN  
			SELECT MONTH(ngayThanhToan) AS 'Tháng', (SELECT DISTINCT YEAR(ngayThanhToan) FROM HoaDon WHERE YEAR(ngayThanhToan) = @nam) AS 'Năm',SUM(tongTien) AS 'Tổng doanh thu'
			FROM HoaDon
			WHERE MONTH(ngayThanhToan) = @thang
			GROUP BY MONTH(ngayThanhToan)
			ORDER BY MONTH(ngayThanhToan)
		END
	END 
	
	 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_DangNhap]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--5. Đăng nhập - đăng xuất
CREATE PROCEDURE [dbo].[sp_DangNhap] @id VARCHAR(20), @mk VARCHAR(20), @maKH VARCHAR(20) OUT, @hoTen NVARCHAR(30) OUT 
AS
	IF (@id = '')
	BEGIN
		RAISERROR('Lỗi : Không được để trống tên đăng nhập hoặc mật khẩu',16,1)
		RETURN
	END
	IF (@mk = '')
	BEGIN
		RAISERROR('Lỗi : Không được để trống tên đăng nhập hoặc mật khẩu',16,1)
		RETURN
	END
	IF (EXISTS (SELECT * FROM KhachHang WHERE tenDangNhap = @id))
	BEGIN
		IF (EXISTS (SELECT * FROM KhachHang WHERE tenDangNhap = @id AND matKhau = @mk))
		BEGIN
			SET @maKH = (SELECT MAKH FROM KhachHang WHERE tenDangNhap = @id AND matKhau = @mk)
			SET @hoTen = (SELECT HOTEN FROM KhachHang WHERE tenDangNhap = @id AND matKhau = @mk)
		END
		ELSE
			RAISERROR('Sai mật khẩu, vui lòng nhập lại',16,1)
			RETURN -1
	END
	ELSE
		RAISERROR('Tên đăng nhập không tồn tại',16,1)
		RETURN -1


GO
/****** Object:  StoredProcedure [dbo].[sp_DatPhong]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DatPhong] @maDP CHAR(10), @maLoaiPhong CHAR(10), @maKH CHAR(10), @ngbd DATETIME, @ngtrp DATETIME, @ngdat DATETIME, @dongia INT, @mota NVARCHAR(50), @ttrang NVARCHAR(15), @maPhong CHAR(10) 
AS
	IF (EXISTS(SELECT * FROM LoaiPhong WHERE maLoaiPhong = @maLoaiPhong AND slTrong > 0))
	BEGIN
		INSERT INTO DatPhong(maDP,maLoaiPhong,maKH,ngayBatDau,ngayTraPhong,ngayDat,donGia,moTa,tinhTrang)
		VALUES  ( @maDP , -- maDP - char(10)
		          @maLoaiPhong , -- maLoaiPhong - char(10)
		          @maKH , -- maKH - char(10)
		          @ngbd , -- ngayBatDau - datetime
		          @ngtrp , -- ngayTraPhong - datetime
		          @ngdat , -- ngayDat - datetime
		          @dongia , -- donGia - int
		          @mota , -- moTa - nvarchar(50)
		          @ttrang  -- tinhTrang - nvarchar(15)
		        )
		--KH đặt phòng thành công thì số lượng phòng trống của loại phòng đó giảm xuống 1
		UPDATE LoaiPhong
		SET slTrong = slTrong - 1
		WHERE maLoaiPhong = @maLoaiPhong;
		--Chuyển trạng thái phòng KH vừa đặt sang 'đang sử dụng'
		UPDATE TrangThaiPhong
		SET tinhTrang = N'Đang sử dụng'
		WHERE maPhong IN (SELECT P.maPhong FROM Phong P, TrangThaiPhong T
						 WHERE P.maPhong = T.maPhong AND p.maPhong = @maPhong 
						 AND p.loaiPhong = @maLoaiPhong)
		WHILE (@ngbd <= @ngtrp)
		BEGIN
			INSERT INTO TrangThaiPhong
					( maPhong, ngay, tinhTrang )
			VALUES  ( @maPhong, -- maPhong - char(10)
					  @ngbd, -- ngay - datetime
					  N'Đang sử dụng'  -- tinhTrang - nvarchar(15)
					  )
			SET @ngbd = @ngbd + 1
		END
	END
	ELSE
		RAISERROR('Đã hết phòng trống',16,1)
		RETURN -1


GO
/****** Object:  StoredProcedure [dbo].[sp_LapHoaDon]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LapHoaDon] @maHD CHAR(20), @maDP CHAR(10), @tongTien INT, @ngLap DATETIME
AS
	IF (EXISTS(SELECT dp.tinhTrang FROM dbo.DatPhong dp WHERE  dp.tinhTrang = N'Chưa xác nhận' AND dp.maDP = @maDP))
	BEGIN
		RAISERROR(N'Mã đặt phòng chưa được xác nhận nên không thể lập hoá đơn',16,1)
		RETURN -1
	END
	ELSE
	BEGIN     
		INSERT INTO HoaDon( maHD, ngayThanhToan, tongTien, maDP )
		VALUES  ( @maHD,@ngLap,@tongTien,@maDP)
	
		--Tăng số lượng trống của loại phòng lên 1
		UPDATE LoaiPhong
		SET slTrong = slTrong + 1
		WHERE maLoaiPhong = (SELECT L.maLoaiPhong FROM LoaiPhong L, DatPhong D 
							 WHERE D.maLoaiPhong = L.maLoaiPhong AND D.maDP = @maDP)
	END


GO
/****** Object:  StoredProcedure [dbo].[sp_ThemKhachHang]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThemKhachHang] @MaKH CHAR(10),@HoTen NVARCHAR(30),@ID VARCHAR(20),@MK VARCHAR(20),@CMND VARCHAR(13),@DC nVARCHAR(50),@SDT VARCHAR(13),@MT nVARCHAR(50),@EM VARCHAR(20)
AS
	IF (EXISTS (SELECT * FROM KhachHang WHERE tenDangNhap = @ID))
	BEGIN
		RAISERROR('Lỗi : Tên đăng nhập đã tồn tại',16,1)
		RETURN
	END
	IF (EXISTS (SELECT * FROM KhachHang WHERE soCMND = @CMND))
	BEGIN
		RAISERROR('Lỗi : Số cmnd đã bị trùng',16,1)
		RETURN 
	END
	IF (LEN(@CMND) != 9 AND LEN(@CMND) != 12)
	BEGIN
		RAISERROR('Lỗi : Số cmnd phải có 9 hoặc 12 chữ số',16,1)
	END
	IF (LEN(@SDT) != 10 AND LEN(@SDT) != 11)
	BEGIN
		RAISERROR('Lỗi : Số điện thoại phải có 10 hoặc 11 chữ số',16,1)
	END
	ELSE
		INSERT INTO KhachHang VALUES (@MAKH,@HoTen,@ID,@MK,@CMND,@DC,@SDT,@MT,@EM)


GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKePhongTrong]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThongKePhongTrong]
AS 
	SELECT K.maKS AS 'Mã khách sạn', K.tenKS AS 'Tên khách sạn', K.thanhPho AS 'Thành phố', K.soSao AS 'Số sao', L.tenLoaiPhong AS 'Tên loại phòng', SUM(L.slTrong) AS 'Số lượng phòng trống'
	FROM LoaiPhong L, KhachSan K
	WHERE L.maKS = K.maKS
	GROUP BY K.maKS, K.tenKS, L.tenLoaiPhong, K.thanhPho, K.soSao
	ORDER BY K.thanhPho ASC,K.soSao ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_TimHoaDon]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimHoaDon] @maKH CHAR(10), @nglap DATETIME, @tongTien int
AS
	IF (@maKH = '')
	BEGIN
		IF(@nglap = '1/1/1753 1:1:1')
		BEGIN 
			IF(@tongTien = 0)
			BEGIN
				RAISERROR('Vui lòng điền thông tin vào để tìm kiếm hóa đơn',16,1)
				RETURN -1
			END
			ELSE
			BEGIN 
				EXEC sp_TimHoaDonTien @tongTien
			END 
		END
		ELSE
        BEGIN
			IF(@tongTien != 0)
			BEGIN
				SELECT maHD AS 'Mã hóa đơn', ngayThanhToan AS 'Ngày lập', tongTien AS 'Tổng tiền'
				FROM HoaDon 
				WHERE DAY(ngayThanhToan) = DAY(@nglap) AND
				MONTH(ngayThanhToan) = MONTH(@nglap) AND 
				YEAR(ngayThanhToan) = YEAR(@nglap) AND
				tongTien = @tongTien
			END
			ELSE
			BEGIN 
				EXEC sp_TimHoaDonNgay @nglap
			END 
		END 
	END
	ELSE
	BEGIN
		IF(@nglap = '1/1/1753 1:1:1')
		BEGIN 
			IF(@tongTien = 0)
			BEGIN
				EXEC sp_TimHoaDonMaKH @maKH
			END
			ELSE
			BEGIN 
				SELECT maHD AS 'Mã hóa đơn', ngayThanhToan AS 'Ngày lập', tongTien AS 'Tổng tiền'
				FROM HoaDon H, DatPhong D
				WHERE H.maDP = D.maDP AND H.tongTien = @tongTien AND D.maKH = @maKH
			END 
		END
		ELSE
        BEGIN
			IF(@tongTien = 0)
			BEGIN
				SELECT maHD AS 'Mã hóa đơn', ngayThanhToan AS 'Ngày lập', tongTien AS 'Tổng tiền'
				FROM HoaDon H, DatPhong D
				WHERE H.maDP = D.maDP AND DAY(ngayThanhToan) = DAY(@nglap) AND
				MONTH(ngayThanhToan) = MONTH(@nglap) AND 
				YEAR(ngayThanhToan) = YEAR(@nglap) AND D.maKH = @maKH
			END
			ELSE
			BEGIN 
				SELECT maHD AS 'Mã hóa đơn', ngayThanhToan AS 'Ngày lập', tongTien AS 'Tổng tiền'
				FROM HoaDon H, DatPhong D
				WHERE H.maDP = D.maDP AND DAY(ngayThanhToan) = DAY(@nglap) AND
				MONTH(ngayThanhToan) = MONTH(@nglap) AND 
				YEAR(ngayThanhToan) = YEAR(@nglap) AND D.maKH = @maKH 
				AND H.tongTien = @tongTien
			END 
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimHoaDonMaKH]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimHoaDonMaKH] @maKH CHAR(10)
AS
	SELECT H.maHD AS 'Mã hóa đơn', H.ngayThanhToan AS 'Ngày lập', H.tongTien AS 'Tổng tiền' 
	FROM HoaDon H, DatPhong D
	WHERE (H.maDP = D.maDP) AND (D.maKH = @maKH)


GO
/****** Object:  StoredProcedure [dbo].[sp_TimHoaDonNgay]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimHoaDonNgay] @Ngay DATETIME
AS
	SELECT maHD AS 'Mã hóa đơn', ngayThanhToan AS 'Ngày lập', tongTien AS 'Tổng tiền'
	FROM HoaDon
	WHERE DAY(ngayThanhToan) = DAY(@Ngay) AND MONTH(ngayThanhToan) = MONTH(@Ngay) AND YEAR(ngayThanhToan) = YEAR(@Ngay)



GO
/****** Object:  StoredProcedure [dbo].[sp_TimHoaDonTien]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimHoaDonTien] @Tien INT
AS
	SELECT maHD AS 'Mã hóa đơn', ngayThanhToan AS 'Ngày lập', tongTien AS 'Tổng tiền'
	FROM HoaDon
	WHERE tongTien = @Tien


GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemThongTinKhachSan]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimKiemThongTinKhachSan] @min INT, @max INT, @sao INT, @tp NVARCHAR(20)
AS
	--giá min = null
	IF (@min = -1)
	BEGIN
		IF (@max = -1)
		BEGIN 
			IF (@sao = -1)
			BEGIN
				IF (@tp = '')
				BEGIN 
					RAISERROR(N'Lỗi : Vui lòng chọn tiêu chí tìm kiếm',16,1)
					RETURN;
				END
				ELSE
				BEGIN 
					EXEC sp_TimKiemThongTinKhachSanTheoTP @tp
				END 
			END 
			ELSE
            BEGIN
				IF (@tp = '')
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.soSao = @sao
				END
				ELSE
				BEGIN 
					EXEC sp_TimKiemThongTinKhachSanTheoSaoTP @sao, @tp					
				END 
			END
		END
		ELSE
		BEGIN 
			IF (@sao = -1)
			BEGIN
				IF (@tp = '')
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.giaTB <= @max
				END
				ELSE
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.giaTB <= @max AND K.thanhPho = @tp
				END 
			END 
			ELSE
            BEGIN
				IF (@tp = '')
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.soSao = @sao AND K.giaTB <= @max
				END
				ELSE
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.soSao = @sao AND K.giaTB <= @max AND K.thanhPho = @tp					
				END 
			END
		END
	END 

	--Giá min # null
	ELSE
	BEGIN
		IF (@max = -1)
		BEGIN 
			IF (@sao = -1)
			BEGIN
				IF (@tp = '')
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.giaTB >= @min
				ELSE
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.giaTB >= @min AND K.thanhPho = @tp
				END 
			END 
			ELSE
            BEGIN
				IF (@tp = '')
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.soSao = @sao AND K.giaTB >= @min
				END
				ELSE
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.soSao = @sao AND K.giaTB >= @min AND K.thanhPho = @tp
				END 
			END
		END
		ELSE
		BEGIN 
			IF (@sao = -1)
			BEGIN
				IF (@tp = '')
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.giaTB <= @max AND K.giaTB >= @min
				END
				ELSE
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.giaTB <= @max AND K.giaTB >= @min AND K.thanhPho = @tp
				END 
			END 
			ELSE
            BEGIN
				IF (@tp = '')
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.soSao = @sao AND K.giaTB <= @max AND K.giaTB >= @min
				END
				ELSE
				BEGIN 
					SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
					FROM LoaiPhong L, KhachSan K
					WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.soSao = @sao AND K.giaTB <= @max AND K.thanhPho = @tp AND K.giaTB >= @min				
				END 
			END
		END
	END 

GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemThongTinKhachSanTheoGiaTP]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimKiemThongTinKhachSanTheoGiaTP] @giaMin INT,@giaMax INT,@tpho NVARCHAR(20)
AS
	SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
	FROM LoaiPhong L, KhachSan K
	WHERE L.maKS = K.maKS AND L.slTrong > 0 AND @giaMin <= k.giaTB AND K.giaTB <= @giaMax AND K.thanhPho = @tpho


GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemThongTinKhachSanTheoSaoTP]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimKiemThongTinKhachSanTheoSaoTP] @sao INT, @tpho NVARCHAR(20)
AS
	SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
	FROM LoaiPhong L, KhachSan K
	WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.soSao = @sao AND K.thanhPho = @tpho


GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemThongTinKhachSanTheoTP]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TimKiemThongTinKhachSanTheoTP] @tpho NVARCHAR(20)
AS
	SELECT L.maLoaiPhong AS 'Mã loại phòng',L.tenLoaiPhong AS 'Tên loại phòng',L.donGia AS 'Đơn giá phòng', L.moTa AS 'Mô tả', L.slTrong AS 'Số lượng trống', K.tenKS AS 'Tên khách sạn', K.giaTB AS 'Giá TB khách sạn', K.soSao AS 'Số sao',K.thanhPho AS 'Thành phố'
	FROM LoaiPhong L, KhachSan K
	WHERE L.maKS = K.maKS AND L.slTrong > 0 AND K.thanhPho = @tpho


GO
/****** Object:  StoredProcedure [dbo].[sp_XuatThongTinHoaDon]    Script Date: 01-Jul-18 09:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_XuatThongTinHoaDon] @maDP CHAR(10), @tongTien INT OUT
AS
	IF (EXISTS(SELECT * FROM DatPhong WHERE maDP = @maDP))
	BEGIN
		SET @tongTien = (SELECT DATEDIFF(day,ngayBatDau,ngayTraPhong)*donGia  FROM DatPhong WHERE maDP = @maDP);
	END 
	ELSE
    BEGIN
		RAISERROR('Lỗi : Mã đặt phòng không tồn tại',16,1)
	END 
GO
