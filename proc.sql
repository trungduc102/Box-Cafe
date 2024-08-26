use BoxCF

go

-- combo
ALTER proc [dbo].[sp_combo_in_ngay] @ngayBd datetime, @ngayKt datetime
as
begin

	declare @t table (mahd int, gia int)

	insert into @t
	select distinct hd.MaHD, Gia from Combo cb
	join ComboCT ct on ct.MaCB = cb.MaCB
	join HoaDon hd on ct.MaHD = hd.MaHD
	where ct.MaHD in (select MaHD from HoaDon hd where hd.NgayTao <= @ngayBd and hd.NgayTao >= @ngayKt) and hd.MaKM is null

	insert into @t
	select distinct hd.MaHD, cast(Gia * (1 - (km.PhanTram / 100.0)) as float) from Combo cb
	join ComboCT ct on ct.MaCB = cb.MaCB
	join HoaDon hd on ct.MaHD = hd.MaHD
	join KhuyenMai km on km.MaKM = hd.MaKM
	where ct.MaHD in (select MaHD from HoaDon hd where hd.NgayTao <= @ngayBd and hd.NgayTao >= @ngayKt)



	select sum(gia)  from @t

end



go

create proc sp_box_in_ngay @ngayBd datetime, @ngayKt datetime
as
begin
	
    declare	@discount as float 
	declare	@notDiscount as float 

	-- set discount
	set @discount = (select sum(cast (TienThucNhan * (1 -  ( km.PhanTram / 100.0)) as float)) from PhieuDatBox pd
	join HoaDon hd on hd.MaHD = pd.MaHD
	join KhuyenMai km on km.MaKM = hd.MaKM
	where  hd.MaHD not in (select ComboCT.MaHD from ComboCT) 
	and hd.NgayTao <= @ngayBd and hd.NgayTao >= @ngayKt and hd.MaKM is not null)

	-- set no discount
	set @notDiscount = (select SUM(cast(TienThucNhan as float)) from PhieuDatBox pd
	join HoaDon hd on hd.MaHD = pd.MaHD
	and hd.NgayTao <= @ngayBd and hd.NgayTao >= @ngayKt and hd.MaKM is null)


	select 
		case 
			when @discount is null then 0 
			when @discount is not null then @discount
		end + 
		
		case 
			when @notDiscount is null then 0 
			when @notDiscount is not null then @notDiscount
		end
end

go

alter proc sp_product_in_ngay @ngayBd datetime, @ngayKt datetime
as
begin

	declare	@discount as float 
	declare	@notDiscount as float 

	-- set discount
	set @discount = (select sum(ThanhTien *  SoLuong - (ThanhTien *  SoLuong * km.PhanTram / 100.0)) from HoaDonCT 
	join HoaDon hd on hd.MaHD = HoaDonCT.MaHD
	join KhuyenMai km on km.MaKM = hd.MaKM
	where hd.NgayTao <= '8/30/2023  23:59:00' and hd.NgayTao >= '8/30/2023 00:00:00' and hd.MaKM is not null)

	-- set no discount
	set @notDiscount = (select sum(ThanhTien *  SoLuong) from HoaDonCT 
	join HoaDon hd on hd.MaHD = HoaDonCT.MaHD
	where hd.NgayTao <= @ngayBd and hd.NgayTao >= @ngayKt and hd.MaKM is null)


	select 
		case 
			when @discount is null then 0 
			when @discount is not null then @discount
		end + 
		
		case 
			when @notDiscount is null then 0 
			when @notDiscount is not null then @notDiscount
		end

end

go

exec sp_product_in_ngay '8/30/2023  23:59:00', '8/30/2023 00:00:00'


select sum(ThanhTien *  SoLuong - (ThanhTien *  SoLuong * km.PhanTram / 100.0)) from HoaDonCT 
	join HoaDon hd on hd.MaHD = HoaDonCT.MaHD
	join KhuyenMai km on km.MaKM = hd.MaKM
	where hd.NgayTao <= '8/30/2023  23:59:00' and hd.NgayTao >= '8/30/2023 00:00:00' and hd.MaKM is not null



select * from HoaDonCT 
	join HoaDon hd on hd.MaHD = HoaDonCT.MaHD
	join KhuyenMai km on km.MaKM = hd.MaKM
	where hd.NgayTao <= '8/30/2023  23:59:00' and hd.NgayTao >= '8/30/2023 00:00:00' and hd.MaKM is not null