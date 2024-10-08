USE [master]
GO
/****** Object:  Database [BoxCF]    Script Date: 30/08/2023 4:26:33 PM ******/
CREATE DATABASE [BoxCF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BoxCF', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BoxCF.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BoxCF_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BoxCF_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BoxCF] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BoxCF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BoxCF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BoxCF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BoxCF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BoxCF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BoxCF] SET ARITHABORT OFF 
GO
ALTER DATABASE [BoxCF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BoxCF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BoxCF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BoxCF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BoxCF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BoxCF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BoxCF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BoxCF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BoxCF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BoxCF] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BoxCF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BoxCF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BoxCF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BoxCF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BoxCF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BoxCF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BoxCF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BoxCF] SET RECOVERY FULL 
GO
ALTER DATABASE [BoxCF] SET  MULTI_USER 
GO
ALTER DATABASE [BoxCF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BoxCF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BoxCF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BoxCF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BoxCF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BoxCF] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BoxCF', N'ON'
GO
ALTER DATABASE [BoxCF] SET QUERY_STORE = OFF
GO
USE [BoxCF]
GO
/****** Object:  Table [dbo].[Box]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Box](
	[MaBox] [varchar](10) NOT NULL,
	[TenBox] [nvarchar](50) NOT NULL,
	[HinhAnh] [varchar](100) NULL,
	[MoTa] [nvarchar](20) NULL,
	[MaLoaiBox] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBox] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[className] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Combo]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combo](
	[MaCB] [varchar](10) NOT NULL,
	[TenCB] [nvarchar](50) NOT NULL,
	[Gia] [float] NULL,
	[MoTa] [nvarchar](100) NULL,
	[MaLoaiBox] [varchar](10) NULL,
	[SoLuong] [int] NULL,
	[SoLuong_DoUong] [int] NULL,
	[SoLuong_Mon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComboCT]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComboCT](
	[MaComboCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaCB] [varchar](10) NOT NULL,
	[MaSP] [varchar](10) NULL,
	[MaBox] [varchar](10) NULL,
	[SoLuong] [int] NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_ComBoCT] PRIMARY KEY CLUSTERED 
(
	[MaComboCT] ASC,
	[MaHD] ASC,
	[MaCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [varchar](10) NOT NULL,
	[TenDM] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NULL,
	[TenKH] [nvarchar](50) NULL,
	[MaNV] [varchar](20) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[TongTien] [int] NULL,
	[MaKM] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonCT]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonCT](
	[MaHD] [int] NULL,
	[MaSP] [varchar](10) NULL,
	[SoLuong] [int] NULL,
	[GhiChu] [nvarchar](100) NULL,
	[ThanhTien] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKM] [varchar](10) NOT NULL,
	[TenKM] [nvarchar](50) NOT NULL,
	[NgayBD] [date] NULL,
	[NgayKT] [date] NULL,
	[SoLuot] [int] NULL,
	[PhanTram] [int] NULL,
	[DieuKienGiam] [int] NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiBox]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiBox](
	[MaLoaiBox] [varchar](10) NOT NULL,
	[TenLoaiBox] [nvarchar](50) NOT NULL,
	[GiaLoai] [float] NULL,
	[MoTa] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiBox] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [varchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[MaDM] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](20) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[SDT] [varchar](15) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[MatKhau] [varchar](20) NULL,
	[HinhAnh] [varchar](100) NULL,
	[NgayVaoLam] [date] NULL,
	[VaiTro] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[GioiTinh] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDatBox]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDatBox](
	[MaHD] [int] NOT NULL,
	[MaBox] [varchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[GioBD] [datetime] NULL,
	[GioKT] [datetime] NULL,
	[SoGio] [int] NULL,
	[TraTruoc] [int] NULL,
	[ThanhTien] [int] NULL,
	[TienThucNhan] [int] NULL,
	[TrangThai] [nvarchar](20) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhieuDatBox] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaBox] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [varchar](10) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[Gia] [float] NULL,
	[HinhAnh] [varchar](100) NULL,
	[MoTa] [nvarchar](100) NULL,
	[MaLoai] [varchar](10) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sinhvien]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sinhvien](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](40) NULL,
	[age] [int] NULL,
	[address] [nvarchar](50) NULL,
	[class] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Box] ([MaBox], [TenBox], [HinhAnh], [MoTa], [MaLoaiBox]) VALUES (N'B001S', N'Box 1', NULL, N'Mới', N'S')
INSERT [dbo].[Box] ([MaBox], [TenBox], [HinhAnh], [MoTa], [MaLoaiBox]) VALUES (N'B002M', N'Box 2', NULL, N'Mới', N'M')
INSERT [dbo].[Box] ([MaBox], [TenBox], [HinhAnh], [MoTa], [MaLoaiBox]) VALUES (N'B003L', N'Box 3', NULL, N'Mới', N'L')
INSERT [dbo].[Box] ([MaBox], [TenBox], [HinhAnh], [MoTa], [MaLoaiBox]) VALUES (N'B004XL', N'Box 4', NULL, N'Mới', N'XL')
INSERT [dbo].[Box] ([MaBox], [TenBox], [HinhAnh], [MoTa], [MaLoaiBox]) VALUES (N'B005S', N'Box 5', NULL, N'Mới', N'S')
INSERT [dbo].[Box] ([MaBox], [TenBox], [HinhAnh], [MoTa], [MaLoaiBox]) VALUES (N'B006M', N'Box 6', NULL, N'Mới', N'M')
INSERT [dbo].[Box] ([MaBox], [TenBox], [HinhAnh], [MoTa], [MaLoaiBox]) VALUES (N'B007L', N'Box 7', NULL, N'Mới', N'L')
INSERT [dbo].[Box] ([MaBox], [TenBox], [HinhAnh], [MoTa], [MaLoaiBox]) VALUES (N'B008L', N'Box 8', NULL, N'Mới', N'L')
INSERT [dbo].[Box] ([MaBox], [TenBox], [HinhAnh], [MoTa], [MaLoaiBox]) VALUES (N'B009S', N'Box 9', N'box3.jpg', N'Mới', N'L')
INSERT [dbo].[Box] ([MaBox], [TenBox], [HinhAnh], [MoTa], [MaLoaiBox]) VALUES (N'B010M', N'Box 10', N'box3.jpg', N'Mới', N'M')
INSERT [dbo].[Box] ([MaBox], [TenBox], [HinhAnh], [MoTa], [MaLoaiBox]) VALUES (N'B011XL', N'Box 11', NULL, N'Mới', N'XL')
GO
INSERT [dbo].[Combo] ([MaCB], [TenCB], [Gia], [MoTa], [MaLoaiBox], [SoLuong], [SoLuong_DoUong], [SoLuong_Mon]) VALUES (N'CB001M', N'Cập Đôi Hoàn Hảo', 120000, N'2 Người Vui', N'M', 4, 2, 2)
INSERT [dbo].[Combo] ([MaCB], [TenCB], [Gia], [MoTa], [MaLoaiBox], [SoLuong], [SoLuong_DoUong], [SoLuong_Mon]) VALUES (N'CB002S', N'Một Mình Cũng Vui', 60000, N'Một Mình Cũng Vui', N'S', 5, 1, 1)
INSERT [dbo].[Combo] ([MaCB], [TenCB], [Gia], [MoTa], [MaLoaiBox], [SoLuong], [SoLuong_DoUong], [SoLuong_Mon]) VALUES (N'CB003M', N'Bữa Trưa Tuyệt Vời', 120000, N'Bữa Trưa Tuyệt Vời', N'M', 2, 2, 2)
INSERT [dbo].[Combo] ([MaCB], [TenCB], [Gia], [MoTa], [MaLoaiBox], [SoLuong], [SoLuong_DoUong], [SoLuong_Mon]) VALUES (N'CB004L', N'4 Chiếc Bụng Đói', 250000, N'4 Chiếc Bụng Đói', N'L', 3, 4, 4)
INSERT [dbo].[Combo] ([MaCB], [TenCB], [Gia], [MoTa], [MaLoaiBox], [SoLuong], [SoLuong_DoUong], [SoLuong_Mon]) VALUES (N'CB005XL', N'Càng Đông Càng Vui', 350000, N'Càng Đông Càng Vui', N'XL', 3, 6, 6)
INSERT [dbo].[Combo] ([MaCB], [TenCB], [Gia], [MoTa], [MaLoaiBox], [SoLuong], [SoLuong_DoUong], [SoLuong_Mon]) VALUES (N'CB006M', N'Ăn Cùng Nhau', 100000, N'Combo 2 nước 1 đồ ăn', N'M', 4, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[ComboCT] ON 

INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (40, 266, N'CB006M', NULL, N'B010M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (41, 266, N'CB006M', N'BN001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (42, 266, N'CB006M', N'NE001', NULL, 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (43, 275, N'CB001M', NULL, N'B006M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (44, 275, N'CB001M', N'BN001', NULL, 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (45, 275, N'CB001M', N'NE001', NULL, 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (46, 275, N'CB001M', N'NN001', NULL, 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (47, 276, N'CB001M', NULL, N'B002M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (48, 276, N'CB001M', N'BN001', NULL, 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (49, 276, N'CB001M', N'NE001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (50, 282, N'CB001M', NULL, N'B010M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (51, 282, N'CB001M', N'BN001', NULL, 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (52, 282, N'CB001M', N'NE001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (53, 291, N'CB001M', NULL, N'B006M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (54, 291, N'CB001M', N'BN001', NULL, 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (55, 291, N'CB001M', N'DK002', NULL, 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (56, 291, N'CB001M', N'NE001', NULL, 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (57, 291, N'CB001M', N'NE002', NULL, 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (58, 293, N'CB006M', NULL, N'B010M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (59, 293, N'CB006M', N'BN001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (60, 293, N'CB006M', N'NE001', NULL, 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (61, 302, N'CB004L', NULL, N'B007L', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (62, 302, N'CB004L', N'BN001', NULL, 4, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (63, 302, N'CB004L', N'NE001', NULL, 4, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (64, 349, N'CB002S', NULL, N'B001S', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (65, 349, N'CB002S', N'NE001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (66, 352, N'CB002S', NULL, N'B005S', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (67, 352, N'CB002S', N'NE001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (68, 462, N'CB002S', NULL, N'B001S', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (69, 462, N'CB002S', N'NE001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (70, 467, N'CB005XL', NULL, N'B004XL', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (71, 467, N'CB005XL', N'NE001', NULL, 6, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (72, 467, N'CB005XL', N'BN001', NULL, 6, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (73, 487, N'CB001M', NULL, N'B006M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (74, 487, N'CB001M', N'NE001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (75, 487, N'CB001M', N'BN001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (76, 492, N'CB002S', NULL, N'B001S', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (77, 492, N'CB002S', N'NE001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (78, 493, N'CB003M', NULL, N'B002M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (79, 493, N'CB003M', N'NE001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (80, 493, N'CB003M', N'BN001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (81, 495, N'CB005XL', NULL, N'B004XL', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (82, 495, N'CB005XL', N'NE001', NULL, 6, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (83, 495, N'CB005XL', N'BN001', NULL, 6, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (84, 502, N'CB004L', NULL, N'B003L', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (85, 502, N'CB004L', N'NE001', NULL, 4, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (86, 502, N'CB004L', N'BN001', NULL, 4, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (87, 503, N'CB002S', NULL, N'B001S', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (88, 503, N'CB002S', N'NE001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (89, 504, N'CB005XL', NULL, N'B004XL', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (90, 504, N'CB005XL', N'NE001', NULL, 6, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (91, 504, N'CB005XL', N'BN001', NULL, 6, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (92, 505, N'CB003M', NULL, N'B006M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (93, 505, N'CB003M', N'NE001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (94, 505, N'CB003M', N'BN001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (95, 512, N'CB001M', NULL, N'B002M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (97, 512, N'CB001M', N'BN001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (98, 513, N'CB001M', NULL, N'B002M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (100, 513, N'CB001M', N'BN001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (104, 520, N'CB003M', NULL, N'B006M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (106, 520, N'CB003M', N'BN001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (107, 535, N'CB003M', NULL, N'B006M', 1, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (108, 535, N'CB003M', N'CP001', NULL, 2, N'')
INSERT [dbo].[ComboCT] ([MaComboCT], [MaHD], [MaCB], [MaSP], [MaBox], [SoLuong], [GhiChu]) VALUES (109, 535, N'CB003M', N'BN001', NULL, 2, N'')
SET IDENTITY_INSERT [dbo].[ComboCT] OFF
GO
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM01', N'Đồ ăn')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM02', N'Đồ Uống')
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (240, CAST(N'2023-04-14T21:07:36.203' AS DateTime), N'a', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (241, CAST(N'2023-04-14T21:08:14.500' AS DateTime), N'a', N'NV04', N'', 50000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (242, CAST(N'2023-04-14T21:12:44.233' AS DateTime), N'a', N'NV04', N'', 50000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (243, CAST(N'2023-04-14T21:13:30.997' AS DateTime), N'a', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (244, CAST(N'2023-04-14T21:16:54.000' AS DateTime), N'Phạm Nhứt Khang', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (245, CAST(N'2023-04-14T21:35:09.343' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (246, CAST(N'2023-04-14T21:55:30.283' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (247, CAST(N'2023-04-14T21:58:34.643' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (248, CAST(N'2023-04-14T23:01:05.507' AS DateTime), N'Phạm Nhứt Khang', N'NV04', N'', 270000, N'O14151010')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (249, CAST(N'2023-04-15T00:30:25.397' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (250, CAST(N'2023-04-15T00:30:41.827' AS DateTime), N'a', N'NV04', N'', 400000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (251, CAST(N'2023-04-15T00:31:27.427' AS DateTime), N'a', N'NV04', N'', 400000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (252, CAST(N'2023-04-15T01:35:21.763' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (253, CAST(N'2023-04-15T01:37:19.620' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (254, CAST(N'2023-04-15T01:37:58.337' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (255, CAST(N'2023-04-15T02:03:31.910' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (256, CAST(N'2023-04-15T02:12:39.940' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (257, CAST(N'2023-04-15T02:13:55.987' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (258, CAST(N'2023-04-15T02:16:40.390' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (259, CAST(N'2023-04-15T02:37:08.497' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (260, CAST(N'2023-04-15T03:03:15.380' AS DateTime), N's', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (261, CAST(N'2023-04-15T03:03:27.733' AS DateTime), N's', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (262, CAST(N'2023-04-15T03:08:43.070' AS DateTime), N'Phạm Nhứt Khang', N'NV04', N'', 90000, N'O14151010')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (263, CAST(N'2023-04-15T03:13:33.477' AS DateTime), N'Phạm Nhứt Khang', N'NV04', N'', 90000, N'O14151010')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (264, CAST(N'2023-04-15T03:17:10.250' AS DateTime), N'as', N'NV04', N'', 800000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (265, CAST(N'2023-04-15T03:17:52.330' AS DateTime), N'Phạm Nhứt Khang', N'NV04', N'', 310500, N'O14151010')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (266, CAST(N'2023-04-15T03:23:48.557' AS DateTime), N'Phạm Nhứt Khang', N'NV04', N'', 110810, N'O14151010')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (267, CAST(N'2023-04-15T04:45:22.890' AS DateTime), N'Phạm Nhứt Khang', N'NV04', N'', 86000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (268, CAST(N'2023-04-15T18:30:04.583' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (269, CAST(N'2023-04-15T18:30:22.447' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (270, CAST(N'2023-04-15T18:30:33.433' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (271, CAST(N'2023-04-15T18:31:07.193' AS DateTime), N's', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (272, CAST(N'2023-04-15T18:31:32.903' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (273, CAST(N'2023-04-15T18:31:54.577' AS DateTime), N's', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (274, CAST(N'2023-04-15T18:32:39.657' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (275, CAST(N'2023-04-15T18:37:32.537' AS DateTime), N'Phạm Nhứt Khang', N'NV04', N'', 270000, N'O14151010')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (276, CAST(N'2023-04-15T18:40:38.653' AS DateTime), N'', N'NV04', N'', 270000, N'O14151010')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (277, CAST(N'2023-04-15T18:41:05.547' AS DateTime), N'', N'NV04', N'', 333000, N'O14151010')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (278, CAST(N'2023-04-15T18:41:51.807' AS DateTime), N'', N'NV04', N'', 35000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (279, CAST(N'2023-04-15T18:42:09.523' AS DateTime), N'g', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (280, CAST(N'2023-04-15T18:43:59.607' AS DateTime), N'a', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (281, CAST(N'2023-04-15T18:45:11.590' AS DateTime), N'a', N'NV04', N'', 400000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (282, CAST(N'2023-04-15T18:46:35.333' AS DateTime), N'', N'NV04', N'', 270000, N'O14151010')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (283, CAST(N'2023-04-15T18:47:56.943' AS DateTime), N'a', N'NV04', N'', 400000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (284, CAST(N'2023-04-15T19:00:31.907' AS DateTime), N'khang', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (285, CAST(N'2023-04-15T19:03:10.150' AS DateTime), N'an', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (286, CAST(N'2023-04-15T19:09:12.657' AS DateTime), N'khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (287, CAST(N'2023-04-15T19:11:55.177' AS DateTime), N'khang', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (288, CAST(N'2023-04-15T21:20:31.607' AS DateTime), N'', N'NV04', N'', 171000, N'O14151010')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (289, CAST(N'2023-04-15T21:28:31.553' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (290, CAST(N'2023-04-15T21:28:50.547' AS DateTime), N'', N'NV04', N'', 180000, N'O14151010')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (291, CAST(N'2023-04-15T21:29:18.320' AS DateTime), N'', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (292, CAST(N'2023-04-15T22:23:29.927' AS DateTime), N'', N'NV04', N'', 110000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (293, CAST(N'2023-04-15T22:29:53.753' AS DateTime), N'', N'NV04', N'', 123123, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (294, CAST(N'2023-04-15T22:44:18.890' AS DateTime), N'a', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (295, CAST(N'2023-04-15T22:56:34.327' AS DateTime), N'', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (296, CAST(N'2023-04-15T22:58:04.440' AS DateTime), N'', N'NV04', N'', 35000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (297, CAST(N'2023-04-16T01:00:43.577' AS DateTime), N'', N'NV04', N'', 194750, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (298, CAST(N'2023-04-16T01:02:18.590' AS DateTime), N'', N'NV04', N'', 180000, N'B16171020')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (299, CAST(N'2023-04-16T01:03:30.090' AS DateTime), N'a', N'NV04', N'', 360000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (300, CAST(N'2023-04-16T01:05:42.193' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (301, CAST(N'2023-04-16T01:08:01.307' AS DateTime), N'', N'NV04', N'', 190000, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (302, CAST(N'2023-04-16T01:10:36.210' AS DateTime), N'', N'NV04', N'', 285000, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (303, CAST(N'2023-04-16T01:14:59.910' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (304, CAST(N'2023-04-16T01:17:43.007' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (305, CAST(N'2023-04-16T01:21:21.123' AS DateTime), N'', N'NV04', N'', 95000, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (306, CAST(N'2023-04-16T01:21:38.877' AS DateTime), N'a', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (307, CAST(N'2023-04-16T01:22:02.523' AS DateTime), N'd', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (308, CAST(N'2023-04-16T01:27:20.790' AS DateTime), N'', N'NV04', N'', 95000, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (309, CAST(N'2023-04-16T01:37:02.020' AS DateTime), N'a', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (310, CAST(N'2023-04-16T01:37:24.117' AS DateTime), N'sa', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (311, CAST(N'2023-04-16T01:37:33.170' AS DateTime), N'a', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (312, CAST(N'2023-04-16T01:37:59.340' AS DateTime), N'a', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (313, CAST(N'2023-04-16T01:38:19.210' AS DateTime), N'a', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (314, CAST(N'2023-04-16T02:00:59.230' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (315, CAST(N'2023-04-16T02:01:09.690' AS DateTime), N'd', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (316, CAST(N'2023-04-16T02:01:51.790' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (317, CAST(N'2023-04-16T02:04:12.143' AS DateTime), N'', N'NV04', N'', 190000, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (318, CAST(N'2023-04-16T02:04:22.550' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (319, CAST(N'2023-04-16T02:09:18.593' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (320, CAST(N'2023-04-16T02:10:00.790' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (321, CAST(N'2023-04-16T02:11:47.227' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (322, CAST(N'2023-04-16T04:04:32.790' AS DateTime), N'', N'NV04', N'', 285000, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (323, CAST(N'2023-04-16T04:08:11.730' AS DateTime), N'', N'NV04', N'', 285000, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (324, CAST(N'2023-04-16T04:09:30.600' AS DateTime), N'a', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (325, CAST(N'2023-04-16T04:25:13.973' AS DateTime), N'a', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (326, CAST(N'2023-04-16T04:26:44.167' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (327, CAST(N'2023-04-16T04:27:18.280' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (328, CAST(N'2023-04-16T04:28:46.453' AS DateTime), N'f', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (329, CAST(N'2023-04-16T04:41:04.880' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (330, CAST(N'2023-04-16T04:41:17.917' AS DateTime), N'e', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (331, CAST(N'2023-04-16T04:41:35.507' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (332, CAST(N'2023-04-16T04:45:16.947' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (333, CAST(N'2023-04-16T04:45:32.533' AS DateTime), N'', N'NV04', N'', 285000, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (334, CAST(N'2023-04-16T04:50:24.797' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (335, CAST(N'2023-04-16T04:53:18.110' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (336, CAST(N'2023-04-16T04:56:29.290' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (337, CAST(N'2023-04-16T04:56:46.180' AS DateTime), N'f', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (338, CAST(N'2023-04-16T05:03:19.107' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
GO
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (339, CAST(N'2023-04-16T05:11:02.773' AS DateTime), N's', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (340, CAST(N'2023-04-16T05:11:14.810' AS DateTime), N's', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (341, CAST(N'2023-04-16T05:20:38.017' AS DateTime), N'w', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (342, CAST(N'2023-04-16T05:29:11.390' AS DateTime), N'e', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (343, CAST(N'2023-04-16T05:33:25.053' AS DateTime), N's', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (344, CAST(N'2023-04-16T09:13:23.913' AS DateTime), N'', N'NV04', N'', 99750, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (345, CAST(N'2023-04-16T09:14:44.077' AS DateTime), N'', N'NV04', N'', 190000, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (346, CAST(N'2023-04-16T09:15:44.310' AS DateTime), N'khang', N'NV04', N'', 400000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (347, CAST(N'2023-04-16T09:17:40.800' AS DateTime), N'', N'NV04', N'', 190000, N'O161751')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (348, CAST(N'2023-04-26T18:09:37.207' AS DateTime), N'', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (349, CAST(N'2023-04-27T23:12:26.503' AS DateTime), N'', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (350, CAST(N'2023-04-27T23:12:43.793' AS DateTime), N'', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (351, CAST(N'2023-04-27T23:13:16.927' AS DateTime), N'', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (352, CAST(N'2023-04-27T23:14:49.807' AS DateTime), N'', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (353, CAST(N'2023-05-27T14:15:31.690' AS DateTime), N'', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (354, CAST(N'2023-06-18T23:30:14.317' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (355, CAST(N'2023-06-18T23:30:32.107' AS DateTime), N'', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (356, CAST(N'2023-06-19T14:26:12.420' AS DateTime), N'', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (357, CAST(N'2023-07-04T21:01:16.470' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (358, CAST(N'2023-07-04T21:01:27.383' AS DateTime), N'', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (359, CAST(N'2023-07-26T16:34:00.313' AS DateTime), N'', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (360, CAST(N'2023-07-28T16:34:33.870' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (361, CAST(N'2023-07-31T16:58:40.020' AS DateTime), N'', N'NV04', N'', 295000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (362, CAST(N'2023-08-05T08:13:53.087' AS DateTime), N'', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (363, CAST(N'2023-08-05T08:14:14.310' AS DateTime), N'', N'NV04', N'', 1200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (364, CAST(N'2023-08-05T08:14:37.250' AS DateTime), N'Pham Nhut Khang', N'NV04', N'', 1620000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (365, CAST(N'2023-08-05T08:15:28.810' AS DateTime), N'Lam Ha', N'NV04', N'', 720000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (366, CAST(N'2023-08-05T08:16:11.840' AS DateTime), N'Lam Ha', N'NV04', N'', 1080000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (367, CAST(N'2023-08-05T08:20:17.610' AS DateTime), N'', N'NV04', N'', 360000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (368, CAST(N'2023-08-05T08:23:14.013' AS DateTime), N'', N'NV04', N'', 60000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (369, CAST(N'2023-08-05T08:23:48.647' AS DateTime), N'', N'NV04', N'', 900000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (370, CAST(N'2023-08-05T09:00:15.960' AS DateTime), N'0964909321', N'NV04', N'', 600000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (371, CAST(N'2023-08-05T09:12:44.660' AS DateTime), N'', N'NV04', N'', 55000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (372, CAST(N'2023-08-05T10:11:29.053' AS DateTime), N'0964909321', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (373, CAST(N'2023-08-05T10:23:55.810' AS DateTime), N'', N'NV04', N'', 83000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (376, CAST(N'2023-08-08T02:05:15.430' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (377, CAST(N'2023-08-08T02:06:04.640' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (378, CAST(N'2023-08-08T12:03:55.973' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (379, CAST(N'2023-08-08T12:52:40.387' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (380, CAST(N'2023-08-08T23:20:07.057' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (381, CAST(N'2023-08-08T23:22:45.810' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (382, CAST(N'2023-08-08T23:25:50.563' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (383, CAST(N'2023-08-08T23:27:41.657' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (384, CAST(N'2023-08-08T23:28:00.980' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (385, CAST(N'2023-08-08T23:28:31.487' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (386, CAST(N'2023-08-08T23:28:49.300' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (387, CAST(N'2023-08-13T20:10:42.803' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (388, CAST(N'2023-08-23T01:47:53.757' AS DateTime), N'', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (389, CAST(N'2023-08-23T01:48:31.763' AS DateTime), N'Pham Nhut Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (390, CAST(N'2023-08-23T01:49:08.710' AS DateTime), N'Ha', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (391, CAST(N'2023-08-23T01:53:33.570' AS DateTime), N'', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (392, CAST(N'2023-08-23T01:54:26.153' AS DateTime), N'Quyen', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (393, CAST(N'2023-08-23T01:54:46.383' AS DateTime), N'No Ti', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (394, CAST(N'2023-08-23T02:29:12.287' AS DateTime), N'Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (395, CAST(N'2023-08-23T02:41:10.597' AS DateTime), N'Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (396, CAST(N'2023-08-23T02:47:46.980' AS DateTime), N'Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (397, CAST(N'2023-08-23T02:48:07.017' AS DateTime), N'Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (398, CAST(N'2023-08-23T03:16:03.037' AS DateTime), N'', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (399, CAST(N'2023-08-23T03:16:18.713' AS DateTime), N'Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (400, CAST(N'2023-08-23T03:16:44.983' AS DateTime), N'No Ti', N'NV04', N'', 400000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (401, CAST(N'2023-08-23T03:17:08.513' AS DateTime), N'Ha', N'NV04', N'', 400000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (402, CAST(N'2023-08-23T03:18:30.517' AS DateTime), N'Ngan', N'NV04', N'', 400000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (403, CAST(N'2023-08-23T03:53:44.097' AS DateTime), N'Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (404, CAST(N'2023-08-23T03:54:04.017' AS DateTime), N'Quyen', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (405, CAST(N'2023-08-23T03:54:29.277' AS DateTime), N'No Ti', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (406, CAST(N'2023-08-23T04:03:38.320' AS DateTime), N'Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (407, CAST(N'2023-08-23T04:07:47.007' AS DateTime), N'Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (408, CAST(N'2023-08-23T04:24:37.937' AS DateTime), N'Khang', N'NV04', N'', 400000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (409, CAST(N'2023-08-23T04:37:10.820' AS DateTime), N'No Ti', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (410, CAST(N'2023-08-23T04:37:44.383' AS DateTime), N'Ha', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (411, CAST(N'2023-08-23T04:38:23.050' AS DateTime), N'Ngan', N'NV04', N'', 400000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (412, CAST(N'2023-08-23T04:39:27.447' AS DateTime), N'Mai Linh', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (413, CAST(N'2023-08-23T04:40:03.613' AS DateTime), N'Minh Lai', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (414, CAST(N'2023-08-23T04:41:59.040' AS DateTime), N'Ngan', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (415, CAST(N'2023-08-23T04:47:02.637' AS DateTime), N'Ha', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (416, CAST(N'2023-08-23T04:49:49.613' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (417, CAST(N'2023-08-23T04:51:45.420' AS DateTime), N'b', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (418, CAST(N'2023-08-23T04:52:03.273' AS DateTime), N'c', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (419, CAST(N'2023-08-23T05:00:23.293' AS DateTime), N'Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (420, CAST(N'2023-08-23T05:00:42.397' AS DateTime), N'Ngan', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (421, CAST(N'2023-08-23T05:05:15.967' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (422, CAST(N'2023-08-23T05:06:36.227' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (423, CAST(N'2023-08-23T05:36:11.437' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (424, CAST(N'2023-08-23T05:38:35.113' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (425, CAST(N'2023-08-23T05:39:04.690' AS DateTime), N'b', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (426, CAST(N'2023-08-23T05:39:16.870' AS DateTime), N'b', N'NV04', N'', 600000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (427, CAST(N'2023-08-23T12:28:54.940' AS DateTime), N'b', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (428, CAST(N'2023-08-23T12:30:39.840' AS DateTime), N'c', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (429, CAST(N'2023-08-23T12:31:24.580' AS DateTime), N'd', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (430, CAST(N'2023-08-23T12:32:31.247' AS DateTime), N'd', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (431, CAST(N'2023-08-23T13:25:28.603' AS DateTime), N'E', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (432, CAST(N'2023-08-27T13:26:18.443' AS DateTime), N'A', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (433, CAST(N'2023-08-28T13:26:35.920' AS DateTime), N'B', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (434, CAST(N'2023-08-23T13:27:00.430' AS DateTime), N'C', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (435, CAST(N'2023-08-23T13:34:33.320' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (436, CAST(N'2023-08-23T13:34:59.007' AS DateTime), N'b', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (437, CAST(N'2023-08-23T13:35:39.503' AS DateTime), N'c', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (438, CAST(N'2023-08-23T13:39:45.923' AS DateTime), N'', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (439, CAST(N'2023-08-23T13:41:25.903' AS DateTime), N'', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (440, CAST(N'2023-08-23T13:58:03.540' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
GO
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (441, CAST(N'2023-08-23T13:58:36.743' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (442, CAST(N'2023-08-23T14:10:47.450' AS DateTime), N'b', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (443, CAST(N'2023-08-23T14:12:11.020' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (444, CAST(N'2023-08-23T18:17:49.703' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (445, CAST(N'2023-08-23T18:18:14.557' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (446, CAST(N'2023-08-23T18:22:04.173' AS DateTime), N'b', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (447, CAST(N'2023-08-23T18:22:17.723' AS DateTime), N'c', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (448, CAST(N'2023-08-23T18:23:12.537' AS DateTime), N'', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (449, CAST(N'2023-08-23T18:23:39.887' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (450, CAST(N'2023-08-23T18:24:48.397' AS DateTime), N'b', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (451, CAST(N'2023-08-23T18:46:11.783' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (452, CAST(N'2023-08-23T18:49:23.707' AS DateTime), N'b', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (453, CAST(N'2023-08-23T18:50:24.393' AS DateTime), N'a', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (454, CAST(N'2023-08-23T18:50:38.803' AS DateTime), N'b', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (455, CAST(N'2023-08-23T18:51:01.560' AS DateTime), N'c', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (456, CAST(N'2023-08-23T21:35:25.767' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (457, CAST(N'2023-08-23T21:38:41.997' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (458, CAST(N'2023-08-23T22:19:28.227' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (459, CAST(N'2023-08-24T00:16:13.110' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (460, CAST(N'2023-08-24T02:38:21.460' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (461, CAST(N'2023-08-24T02:47:11.753' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (462, CAST(N'2023-08-24T23:31:41.810' AS DateTime), N'', N'NV04', N'', 145000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (463, CAST(N'2023-08-25T03:15:35.253' AS DateTime), N'', N'NV04', N'', 35000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (464, CAST(N'2023-08-25T03:19:34.227' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (465, CAST(N'2023-08-25T03:34:45.540' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (466, CAST(N'2023-08-25T03:35:14.480' AS DateTime), N'', N'NV04', N'', 110000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (467, CAST(N'2023-08-25T03:36:01.043' AS DateTime), N'', N'NV04', N'', 395000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (468, CAST(N'2023-08-25T03:36:59.690' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (469, CAST(N'2023-08-25T03:38:54.687' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (470, CAST(N'2023-08-25T03:42:05.597' AS DateTime), N'', N'NV04', N'', 245000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (471, CAST(N'2023-08-25T03:48:29.753' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (472, CAST(N'2023-08-25T14:39:06.640' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (473, CAST(N'2023-08-25T14:40:38.940' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (474, CAST(N'2023-08-25T14:41:54.673' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (475, CAST(N'2023-08-25T16:34:36.200' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (476, CAST(N'2023-08-25T16:34:59.153' AS DateTime), N'abc', N'NV04', N'123', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (477, CAST(N'2023-08-25T16:36:29.280' AS DateTime), N'Duc', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (478, CAST(N'2023-08-25T16:36:43.780' AS DateTime), N'Chi Ha', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (479, CAST(N'2023-08-25T16:37:20.347' AS DateTime), N'Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (480, CAST(N'2023-08-25T16:39:23.990' AS DateTime), N'Duy', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (481, CAST(N'2023-08-25T16:41:48.230' AS DateTime), N'Ha', N'NV04', N'', 400000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (482, CAST(N'2023-08-25T16:49:02.900' AS DateTime), N'', N'NV04', N'', 345000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (483, CAST(N'2023-08-25T16:49:54.003' AS DateTime), N'Khang', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (484, CAST(N'2023-08-25T17:14:50.867' AS DateTime), N'', N'NV04', N'', 35000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (485, CAST(N'2023-08-25T17:15:23.467' AS DateTime), N'', N'NV04', N'', 35000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (486, CAST(N'2023-08-25T17:16:03.450' AS DateTime), N'', N'NV04', N'', 1000000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (487, CAST(N'2023-08-25T17:24:24.230' AS DateTime), N'', N'NV04', N'', 345000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (488, CAST(N'2023-08-25T17:25:34.230' AS DateTime), N'', N'NV04', N'', 149000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (489, CAST(N'2023-08-25T21:23:08.973' AS DateTime), N'', N'NV01', N'', 160000, N'B2526202')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (490, CAST(N'2023-08-25T21:32:50.427' AS DateTime), N'', N'NV01', N'', 36000, N'B2526202')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (491, CAST(N'2023-08-25T23:00:49.017' AS DateTime), N'', N'NV04', N'', 36000, N'B2526202')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (492, CAST(N'2023-08-25T23:33:45.520' AS DateTime), N'', N'NV04', N'', 80000, N'B2526202')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (493, CAST(N'2023-08-25T23:42:42.707' AS DateTime), N'', N'NV04', N'', 160000, N'B2526202')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (494, CAST(N'2023-08-26T00:08:03.537' AS DateTime), N'', N'NV04', N'', 100000, N'B2526202')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (495, CAST(N'2023-08-26T00:16:04.897' AS DateTime), N'', N'NV04', N'', 240000, N'B2526202')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (496, CAST(N'2023-08-26T00:39:31.050' AS DateTime), N'', N'NV04', N'', 36000, N'B2526202')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (497, CAST(N'2023-08-26T00:58:00.077' AS DateTime), N'', N'NV04', N'', 240000, N'B2526202')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (498, CAST(N'2023-08-26T01:07:00.573' AS DateTime), N'', N'NV04', N'', 200000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (499, CAST(N'2023-08-26T01:14:42.840' AS DateTime), N'', N'NV04', N'', 45000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (500, CAST(N'2023-08-29T13:55:31.873' AS DateTime), N'', N'NV04', N'', 266250, N'X2930255')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (501, CAST(N'2023-08-29T13:55:54.770' AS DateTime), N'Khang', N'NV04', N'', 100000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (502, CAST(N'2023-08-29T13:57:46.490' AS DateTime), N'', N'NV04', N'', 225000, N'X2930255')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (503, CAST(N'2023-08-29T14:14:19.423' AS DateTime), N'', N'NV04', N'', 75000, N'X2930255')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (504, CAST(N'2023-08-29T14:15:05.133' AS DateTime), N'', N'NV04', N'', 225000, N'X2930255')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (505, CAST(N'2023-08-29T14:18:27.090' AS DateTime), N'', N'NV04', N'', 150000, N'X2930255')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (506, CAST(N'2023-08-29T14:41:26.360' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (507, CAST(N'2023-08-29T14:42:16.627' AS DateTime), N'', N'NV04', N'', 35000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (508, CAST(N'2023-08-29T14:43:53.897' AS DateTime), N'', N'NV04', N'', 35000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (509, CAST(N'2023-08-29T14:48:01.410' AS DateTime), N'', N'NV04', N'', 176250, N'X2930255')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (510, CAST(N'2023-08-29T14:48:28.327' AS DateTime), N'a', N'NV04', N'', 300000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (511, CAST(N'2023-08-29T15:55:27.133' AS DateTime), N'', N'NV04', N'', 90000, N'X2930255')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (512, CAST(N'2023-08-29T16:08:38.663' AS DateTime), N'', N'NV04', N'', 90000, N'X2930255')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (513, CAST(N'2023-08-29T16:08:46.517' AS DateTime), N'', N'NV04', N'', 90000, N'X2930255')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (514, CAST(N'2023-08-29T16:21:19.550' AS DateTime), N'', N'NV04', N'', 361249, N'X2930255')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (518, CAST(N'2023-08-30T00:25:13.597' AS DateTime), N'', N'NV04', N'', 52250, N'B293052')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (519, CAST(N'2023-08-30T00:25:34.817' AS DateTime), N'', N'NV04', N'', 47500, N'B293052')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (520, CAST(N'2023-08-30T00:25:41.523' AS DateTime), N'', N'NV04', N'', 114000, N'B293052')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (521, CAST(N'2023-08-30T00:38:32.800' AS DateTime), N'', N'NV04', N'', 76000, N'B293052')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (522, CAST(N'2023-08-30T00:40:06.123' AS DateTime), N'a', N'NV04', N'', 80000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (523, CAST(N'2023-08-30T15:53:24.460' AS DateTime), N'', N'NV04', N'', 47500, N'B293052')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (524, CAST(N'2023-08-30T15:58:06.973' AS DateTime), N'a', N'NV04', N'', 50000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (525, CAST(N'2023-08-30T16:02:01.133' AS DateTime), N'a', N'NV04', N'', 50000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (526, CAST(N'2023-08-30T16:03:08.037' AS DateTime), N'a', N'NV04', N'', 50000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (527, CAST(N'2023-08-30T16:03:31.900' AS DateTime), N'a', N'NV04', N'', 50000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (528, CAST(N'2023-08-30T16:03:44.840' AS DateTime), N'b', N'NV04', N'', 50000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (529, CAST(N'2023-08-30T16:03:56.157' AS DateTime), N'c', N'NV04', N'', 50000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (530, CAST(N'2023-08-30T16:06:04.143' AS DateTime), N'd', N'NV04', N'', 50000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (531, CAST(N'2023-08-30T16:06:41.210' AS DateTime), N'', N'NV04', N'', 47500, N'B293052')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (532, CAST(N'2023-08-30T16:07:35.520' AS DateTime), N'a', N'NV04', N'', 50000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (533, CAST(N'2023-08-30T16:08:17.060' AS DateTime), N'b', N'NV04', N'', 50000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (534, CAST(N'2023-08-30T16:08:26.230' AS DateTime), N'', N'NV04', N'', 47500, N'B293052')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (535, CAST(N'2023-08-30T16:09:30.910' AS DateTime), N'', N'NV04', N'', 166250, N'B293052')
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TenKH], [MaNV], [GhiChu], [TongTien], [MaKM]) VALUES (536, CAST(N'2023-08-30T16:17:39.717' AS DateTime), N'a', N'NV04', N'', 80000, NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (244, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (244, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (275, N'BN001', 1, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (275, N'NE001', 1, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (275, N'NN001', 1, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (277, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (277, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (277, N'TS001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (282, N'BN001', 1, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (282, N'NE001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (288, N'BN002', 1, N'', 60000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (288, N'TC002', 1, N'', 30000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (289, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (289, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (291, N'BN001', 1, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (291, N'DK002', 1, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (291, N'NE001', 1, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (291, N'NE002', 1, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (292, N'BN001', 1, N'', 50000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (292, N'BN002', 1, N'', 60000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (293, N'BN001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (293, N'NE001', 1, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (296, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (296, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (297, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (297, N'NE002', 9, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (302, N'BN001', 4, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (302, N'NE001', 4, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (352, N'NE001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (354, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (354, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (357, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (357, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (360, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (360, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (361, N'NE001', 2, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (361, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (367, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (367, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (367, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (368, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (368, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (373, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (373, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (373, N'NN003', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (373, N'NN004', 1, N'', 23000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (462, N'NE001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (462, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (462, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (463, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (463, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (464, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (464, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (466, N'BN001', 1, N'', 50000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (466, N'BN002', 1, N'', 60000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (467, N'NE001', 6, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (467, N'BN001', 6, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (467, N'NE001', 3, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (467, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (471, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (471, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (473, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (473, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (474, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (474, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (484, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (484, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (486, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (486, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (486, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (486, N'NN002', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (486, N'ST002', 1, N'', 18000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (486, N'ST001', 1, N'', 18000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (486, N'NN004', 38, N'', 23000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (486, N'NN003', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (487, N'NE001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (487, N'BN001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (487, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (487, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (488, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (488, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (488, N'ST002', 1, N'', 18000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (488, N'ST001', 1, N'', 18000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (488, N'NN004', 1, N'', 23000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (488, N'NN003', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (488, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (488, N'NN002', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (490, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (490, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (492, N'NE001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (496, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (500, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (500, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (500, N'BN001', 1, N'', 50000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (500, N'BN002', 1, N'', 60000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (502, N'NE001', 4, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (502, N'BN001', 4, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (505, N'NE001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (505, N'BN001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (509, N'NE002', 1, N'', 20000)
GO
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (509, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (535, N'CP001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (513, N'BN001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (535, N'BN001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (535, N'CP001', 1, N'', 30000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (535, N'CP002', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (520, N'BN001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (266, N'BN001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (266, N'NE001', 1, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (349, N'NE001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (512, N'BN001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (265, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (265, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (267, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (267, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (267, N'NN004', 1, N'', 23000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (267, N'ST001', 1, N'', 18000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (276, N'BN001', 1, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (276, N'NE001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (278, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (278, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (344, N'BN002', 1, N'', 60000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (344, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (344, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (468, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (468, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (469, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (469, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (472, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (472, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (361, N'TS001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (503, N'NE001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (504, N'NE001', 6, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (504, N'BN001', 6, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (508, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (508, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (368, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (371, N'NE002', 2, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (371, N'NN002', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (465, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (465, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (482, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (482, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (485, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (485, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (514, N'BN001', 5, N'', 50000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (514, N'BN002', 1, N'', 60000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (514, N'TC002', 1, N'', 30000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (514, N'TC001', 1, N'', 30000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (470, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (470, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (491, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (491, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (493, N'NE001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (493, N'BN001', 2, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (494, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (494, N'NE002', 5, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (496, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (499, N'NE001', 1, N'', 25000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (499, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (507, N'NE002', 1, N'', 20000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (507, N'NN001', 1, N'', 15000)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (495, N'NE001', 6, N'', 0)
INSERT [dbo].[HoaDonCT] ([MaHD], [MaSP], [SoLuong], [GhiChu], [ThanhTien]) VALUES (495, N'BN001', 6, N'', 0)
GO
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'B1213105', N'fwkjfqklwjf', CAST(N'2023-04-12' AS Date), CAST(N'2023-04-13' AS Date), 0, 10, 50000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'B1213106', N'Khuyem mai', CAST(N'2023-04-12' AS Date), CAST(N'2023-04-13' AS Date), 0, 10, 60000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'B16171020', N'khuyen mai', CAST(N'2023-04-16' AS Date), CAST(N'2023-04-17' AS Date), 0, 10, 200000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'B2526202', N'30/4', CAST(N'2023-08-25' AS Date), CAST(N'2023-08-26' AS Date), 3, 20, 20000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'B293052', N'Khuyến Mãi 5%', CAST(N'2023-08-29' AS Date), CAST(N'2023-09-30' AS Date), 10, 5, 50000, 1)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'C13141510', N'Khuyen mai tri an', CAST(N'2023-04-13' AS Date), CAST(N'2023-04-14' AS Date), 0, 15, 100000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'F2525510', N'2/9', CAST(N'2023-08-25' AS Date), CAST(N'2023-09-25' AS Date), 100, 5, 100000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'KM01', N'Tri ân khách hàng', CAST(N'2022-10-20' AS Date), CAST(N'2022-10-25' AS Date), 100, 5, 100000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'KM02', N'Khuyến mãi combo', CAST(N'2023-01-01' AS Date), CAST(N'2023-01-02' AS Date), 100, 10, 200000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'KM03', N'Tri ân khách hàng', CAST(N'2023-02-14' AS Date), CAST(N'2023-02-15' AS Date), 100, 15, 300000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'KM04', N'Tri ân khách hàng', CAST(N'2023-03-14' AS Date), CAST(N'2023-03-16' AS Date), 100, 20, 500000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'O1213156', N'Khuyến Mãi Tri Ân', CAST(N'2023-04-12' AS Date), CAST(N'2023-04-13' AS Date), 0, 15, 60000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'O14151010', N'Khuyến mãi tri ân', CAST(N'2023-04-14' AS Date), CAST(N'2023-04-15' AS Date), 0, 10, 100000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'O161751', N'khuyến mãi tri ân', CAST(N'2023-04-16' AS Date), CAST(N'2023-04-17' AS Date), 0, 5, 10000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'O2929101', N'Khuyên mãi 10%', CAST(N'2023-08-29' AS Date), CAST(N'2023-09-29' AS Date), 20, 10, 200000, 1)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'X1314101', N'Khuyen mai hang ngay', CAST(N'2023-04-13' AS Date), CAST(N'2023-04-14' AS Date), 0, 10, 10000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'X13141010', N'Khuyến Mãi Tri Ân', CAST(N'2023-04-13' AS Date), CAST(N'2023-04-14' AS Date), 0, 10, 100000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'X2930255', N'Khuyến Mãi 2/9', CAST(N'2023-08-29' AS Date), CAST(N'2023-09-30' AS Date), 10, 15, 300000, 0)
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBD], [NgayKT], [SoLuot], [PhanTram], [DieuKienGiam], [TrangThai]) VALUES (N'X303054', N'Trung Thu', CAST(N'2023-08-30' AS Date), CAST(N'2023-09-30' AS Date), 100, 5, 40000, 1)
GO
INSERT [dbo].[LoaiBox] ([MaLoaiBox], [TenLoaiBox], [GiaLoai], [MoTa]) VALUES (N'L', N'Nhóm 4', 80000, N'')
INSERT [dbo].[LoaiBox] ([MaLoaiBox], [TenLoaiBox], [GiaLoai], [MoTa]) VALUES (N'M', N'Đôi', 50000, N'')
INSERT [dbo].[LoaiBox] ([MaLoaiBox], [TenLoaiBox], [GiaLoai], [MoTa]) VALUES (N'S', N'Đơn', 30000, N'')
INSERT [dbo].[LoaiBox] ([MaLoaiBox], [TenLoaiBox], [GiaLoai], [MoTa]) VALUES (N'XL', N'Nhóm 6', 120000, N'')
GO
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [MaDM]) VALUES (N'LS008', N'Cà Phê', N'DM02')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [MaDM]) VALUES (N'LSP01', N'Nước ngọt', N'DM02')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [MaDM]) VALUES (N'LSP02', N'Nước ép', N'DM02')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [MaDM]) VALUES (N'LSP03', N'Sinh tố', N'DM02')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [MaDM]) VALUES (N'LSP04', N'Đồ khô', N'DM01')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [MaDM]) VALUES (N'LSP05', N'Trái cây', N'DM01')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [MaDM]) VALUES (N'LSP06', N'Bánh ngọt', N'DM01')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [MaDM]) VALUES (N'LSP07', N'Trà sữa / Trà', N'DM02')
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [DiaChi], [MatKhau], [HinhAnh], [NgayVaoLam], [VaiTro], [TrangThai], [GioiTinh]) VALUES (N'NV01', N'Lâm Ngọc Vy', CAST(N'2000-09-29' AS Date), N'0987654321', N'Sóc Trăng', N'123', N'a.jpg', CAST(N'2022-12-22' AS Date), N'User', 1, 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [DiaChi], [MatKhau], [HinhAnh], [NgayVaoLam], [VaiTro], [TrangThai], [GioiTinh]) VALUES (N'NV010', N'Nguyễn Phương Thanh', CAST(N'2002-12-02' AS Date), N'0344507491', N'Chau Thanh, Hau Giang', N'123123', N'b.jpg', CAST(N'2023-12-02' AS Date), N'User', 1, 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [DiaChi], [MatKhau], [HinhAnh], [NgayVaoLam], [VaiTro], [TrangThai], [GioiTinh]) VALUES (N'NV02', N'Trần PHước Duy', CAST(N'2003-01-03' AS Date), N'0123456789', N'Sóc Trăng', N'123', NULL, CAST(N'2023-01-10' AS Date), N'User', 0, 0)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [DiaChi], [MatKhau], [HinhAnh], [NgayVaoLam], [VaiTro], [TrangThai], [GioiTinh]) VALUES (N'NV03', N'Lê Nguyễn Hoàng Khang', CAST(N'1999-03-07' AS Date), N'0396884192', N'Cần Thơ', N'123', NULL, CAST(N'2023-01-12' AS Date), N'User', 0, 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [DiaChi], [MatKhau], [HinhAnh], [NgayVaoLam], [VaiTro], [TrangThai], [GioiTinh]) VALUES (N'NV04', N'Nguyễn Ngọc Hân', CAST(N'1997-01-12' AS Date), N'0978153512', N'An Giang', N'123123', N'1.jpg', CAST(N'2022-11-01' AS Date), N'Admin', 1, 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [DiaChi], [MatKhau], [HinhAnh], [NgayVaoLam], [VaiTro], [TrangThai], [GioiTinh]) VALUES (N'NV05', N'Hứa Hoàng Phát', CAST(N'1998-02-12' AS Date), N'0398844177', N'Cần Thơ', N'123', NULL, CAST(N'2022-02-22' AS Date), N'User', 0, 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [DiaChi], [MatKhau], [HinhAnh], [NgayVaoLam], [VaiTro], [TrangThai], [GioiTinh]) VALUES (N'NV08', N'Phạm Nhứt Khang', CAST(N'2003-04-17' AS Date), N'0344507491', N'Hậu Giang', N'123123', N'khang.jpg', CAST(N'2023-04-14' AS Date), N'User', 1, 1)
GO
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (240, N'B001S', N'a', CAST(N'2023-04-14T21:00:00.000' AS DateTime), CAST(N'2023-04-14T21:07:39.133' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (241, N'B001S', N'a', CAST(N'2023-04-14T21:10:00.000' AS DateTime), CAST(N'2023-04-14T21:08:18.980' AS DateTime), 1, 50000, 100000, 50000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (242, N'B001S', N'a', CAST(N'2023-04-14T21:20:00.000' AS DateTime), CAST(N'2023-04-14T21:12:52.473' AS DateTime), 1, 50000, 100000, 50000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (243, N'B001S', N'a', CAST(N'2023-04-14T21:00:00.000' AS DateTime), CAST(N'2023-04-14T21:13:38.150' AS DateTime), 1, 100000, 100000, 100000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (245, N'B002M', N'a', CAST(N'2023-04-14T21:34:20.000' AS DateTime), CAST(N'2023-04-14T22:34:20.000' AS DateTime), 1, 200000, 200000, 200000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (246, N'B003L', N'a', CAST(N'2023-04-14T21:30:00.000' AS DateTime), CAST(N'2023-04-14T22:30:00.000' AS DateTime), 1, 300000, 300000, 300000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (247, N'B004XL', N'a', CAST(N'2023-04-14T22:00:00.000' AS DateTime), CAST(N'2023-04-14T23:00:00.000' AS DateTime), 1, 300000, 300000, 300000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (248, N'B003L', N'Phạm Nhứt Khang', CAST(N'2023-04-14T23:00:59.000' AS DateTime), CAST(N'2023-04-14T00:00:59.000' AS DateTime), 1, 0, 300000, 300000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (249, N'B002M', N'a', CAST(N'2023-04-15T01:10:00.000' AS DateTime), CAST(N'2023-04-15T02:10:00.000' AS DateTime), 1, 200000, 200000, 200000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (250, N'B002M', N'a', CAST(N'2023-04-15T02:10:00.000' AS DateTime), CAST(N'2023-04-15T04:10:00.000' AS DateTime), 2, 400000, 400000, 400000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (251, N'B002M', N'a', CAST(N'2023-04-15T04:30:00.000' AS DateTime), CAST(N'2023-04-15T06:30:00.000' AS DateTime), 2, 400000, 400000, 400000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (252, N'B002M', N'a', CAST(N'2023-04-15T06:40:00.000' AS DateTime), CAST(N'2023-04-15T07:40:00.000' AS DateTime), 1, 200000, 200000, 200000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (253, N'B003L', N'a', CAST(N'2023-04-15T01:40:00.000' AS DateTime), CAST(N'2023-04-15T02:40:00.000' AS DateTime), 1, 300000, 300000, 300000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (254, N'B003L', N'a', CAST(N'2023-04-15T08:45:00.000' AS DateTime), CAST(N'2023-04-15T09:45:00.000' AS DateTime), 1, 300000, 300000, 300000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (255, N'B004XL', N'a', CAST(N'2023-04-15T02:05:00.000' AS DateTime), CAST(N'2023-04-15T03:05:00.000' AS DateTime), 1, 300000, 300000, 300000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (256, N'B004XL', N'a', CAST(N'2023-04-15T10:00:00.000' AS DateTime), CAST(N'2023-04-15T16:40:53.107' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (257, N'B004XL', N'a', CAST(N'2023-04-15T03:10:00.000' AS DateTime), CAST(N'2023-04-15T02:16:25.030' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (258, N'B004XL', N'a', CAST(N'2023-04-15T03:05:00.000' AS DateTime), CAST(N'2023-04-15T03:06:52.207' AS DateTime), 1, 300000, 300000, 300000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (259, N'B004XL', N'a', CAST(N'2023-04-15T08:00:00.000' AS DateTime), CAST(N'2023-04-15T16:40:49.177' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (260, N'B004XL', N's', CAST(N'2023-04-15T11:00:00.000' AS DateTime), CAST(N'2023-04-15T16:40:56.753' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (261, N'B004XL', N's', CAST(N'2023-04-15T12:00:00.000' AS DateTime), CAST(N'2023-04-15T16:41:01.777' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (262, N'B001S', N'Phạm Nhứt Khang', CAST(N'2023-04-15T03:08:37.000' AS DateTime), CAST(N'2023-04-15T04:08:37.000' AS DateTime), 1, 0, 100000, 100000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (263, N'B005S', N'Phạm Nhứt Khang', CAST(N'2023-04-15T03:13:22.000' AS DateTime), CAST(N'2023-04-15T04:13:22.000' AS DateTime), 1, 0, 100000, 100000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (264, N'B006M', N'as', CAST(N'2023-04-15T04:00:00.000' AS DateTime), CAST(N'2023-04-15T08:00:00.000' AS DateTime), 4, 160000, 800000, 800000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (265, N'B007L', N'Phạm Nhứt Khang', CAST(N'2023-04-15T03:17:46.000' AS DateTime), CAST(N'2023-04-15T04:17:46.000' AS DateTime), 1, 0, 300000, 300000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (266, N'B010M', N'Phạm Nhứt Khang', CAST(N'2023-04-15T03:23:43.440' AS DateTime), CAST(N'2023-04-15T04:23:43.440' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (268, N'B002M', N'a', CAST(N'2023-04-15T22:00:00.000' AS DateTime), CAST(N'2023-04-15T18:31:20.797' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (269, N'B002M', N'a', CAST(N'2023-04-15T18:35:00.000' AS DateTime), CAST(N'2023-04-15T18:30:47.357' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (270, N'B002M', N'a', CAST(N'2023-04-15T18:35:00.000' AS DateTime), CAST(N'2023-04-15T18:30:57.727' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (271, N'B002M', N's', CAST(N'2023-04-15T18:30:00.000' AS DateTime), CAST(N'2023-04-15T18:31:16.120' AS DateTime), 1, 200000, 200000, 200000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (272, N'B002M', N'a', CAST(N'2023-04-15T18:35:00.000' AS DateTime), CAST(N'2023-04-15T18:31:42.987' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (273, N'B002M', N's', CAST(N'2023-04-15T18:35:00.000' AS DateTime), CAST(N'2023-04-15T18:32:44.470' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (274, N'B002M', N'a', CAST(N'2023-04-15T19:35:00.000' AS DateTime), CAST(N'2023-04-15T18:37:47.327' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (275, N'B006M', N'Phạm Nhứt Khang', CAST(N'2023-04-15T18:37:27.877' AS DateTime), CAST(N'2023-04-15T19:37:27.877' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (276, N'B002M', N'', CAST(N'2023-04-15T18:40:34.470' AS DateTime), CAST(N'2023-04-15T19:40:34.470' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (277, N'B003L', N'', CAST(N'2023-04-15T18:40:49.000' AS DateTime), CAST(N'2023-04-15T19:40:49.000' AS DateTime), 1, 0, 300000, 300000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (279, N'B009S', N'g', CAST(N'2023-04-15T18:45:00.000' AS DateTime), CAST(N'2023-04-15T18:44:06.357' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (280, N'B009S', N'a', CAST(N'2023-04-15T19:45:00.000' AS DateTime), CAST(N'2023-04-15T18:44:11.507' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (281, N'B009S', N'a', CAST(N'2023-04-15T18:45:00.000' AS DateTime), CAST(N'2023-04-15T19:00:22.103' AS DateTime), 4, 80000, 400000, 400000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (282, N'B010M', N'', CAST(N'2023-04-15T18:46:31.340' AS DateTime), CAST(N'2023-04-15T19:46:31.340' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (283, N'B001S', N'a', CAST(N'2023-04-15T18:50:00.000' AS DateTime), CAST(N'2023-04-15T21:18:23.233' AS DateTime), 4, 80000, 400000, 400000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (284, N'B009S', N'khang', CAST(N'2023-04-15T19:00:00.000' AS DateTime), CAST(N'2023-04-15T20:00:00.000' AS DateTime), 1, 100000, 100000, 100000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (285, N'B009S', N'an', CAST(N'2023-04-15T22:00:00.000' AS DateTime), CAST(N'2023-04-15T23:00:00.000' AS DateTime), 1, 100000, 100000, 100000, N'empty', N'Chưa thanh toán')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (286, N'B002M', N'khang', CAST(N'2023-04-15T19:40:00.000' AS DateTime), CAST(N'2023-04-15T21:19:11.187' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (287, N'B005S', N'khang', CAST(N'2023-04-15T19:15:00.000' AS DateTime), CAST(N'2023-04-15T21:18:26.470' AS DateTime), 3, 180000, 300000, 300000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (288, N'B001S', N'', CAST(N'2023-04-15T21:20:22.000' AS DateTime), CAST(N'2023-04-15T22:20:22.000' AS DateTime), 1, 0, 100000, 100000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (290, N'B002M', N'', CAST(N'2023-04-15T21:28:41.000' AS DateTime), CAST(N'2023-04-15T22:28:41.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (291, N'B006M', N'', CAST(N'2023-04-15T21:29:11.567' AS DateTime), CAST(N'2023-04-15T22:29:11.567' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (293, N'B010M', N'', CAST(N'2023-04-15T22:29:49.763' AS DateTime), CAST(N'2023-04-15T23:29:49.763' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (294, N'B001S', N'a', CAST(N'2023-04-15T22:00:00.000' AS DateTime), CAST(N'2023-04-15T23:00:00.000' AS DateTime), 1, 100000, 100000, 100000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (295, N'B002M', N'', CAST(N'2023-04-15T22:56:25.000' AS DateTime), CAST(N'2023-04-15T22:56:39.747' AS DateTime), 1, 0, 200000, 200000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (298, N'B002M', N'', CAST(N'2023-04-16T01:01:36.000' AS DateTime), CAST(N'2023-04-16T02:01:36.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (299, N'B002M', N'a', CAST(N'2023-04-16T02:05:00.000' AS DateTime), CAST(N'2023-04-16T02:03:03.573' AS DateTime), 3, 360000, 600000, 360000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (300, N'B003L', N'a', CAST(N'2023-04-16T02:00:00.000' AS DateTime), CAST(N'2023-04-16T03:00:00.000' AS DateTime), 1, 300000, 300000, 300000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (301, N'B006M', N'', CAST(N'2023-04-16T01:07:55.000' AS DateTime), CAST(N'2023-04-16T02:07:55.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (302, N'B007L', N'', CAST(N'2023-04-16T01:10:26.513' AS DateTime), CAST(N'2023-04-16T02:10:26.513' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (303, N'B003L', N'a', CAST(N'2023-04-16T07:00:00.000' AS DateTime), CAST(N'2023-04-16T02:03:18.477' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (304, N'B003L', N'a', CAST(N'2023-04-16T04:00:00.000' AS DateTime), CAST(N'2023-04-16T02:03:15.013' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (305, N'B001S', N'', CAST(N'2023-04-16T01:21:15.000' AS DateTime), CAST(N'2023-04-16T01:22:25.130' AS DateTime), 1, 0, 100000, 100000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (306, N'B001S', N'a', CAST(N'2023-04-16T07:25:00.000' AS DateTime), CAST(N'2023-04-16T01:26:24.990' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (307, N'B001S', N'd', CAST(N'2023-04-16T04:25:00.000' AS DateTime), CAST(N'2023-04-16T01:26:10.887' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (308, N'B001S', N'', CAST(N'2023-04-16T01:27:15.000' AS DateTime), CAST(N'2023-04-16T02:27:15.000' AS DateTime), 1, 0, 100000, 100000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (309, N'B001S', N'a', CAST(N'2023-04-16T01:40:00.000' AS DateTime), CAST(N'2023-04-16T02:40:00.000' AS DateTime), 1, 100000, 100000, 100000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (310, N'B001S', N'sa', CAST(N'2023-04-16T12:00:00.000' AS DateTime), CAST(N'2023-04-16T02:02:56.883' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (311, N'B001S', N'a', CAST(N'2023-04-16T05:00:00.000' AS DateTime), CAST(N'2023-04-16T02:02:52.797' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (312, N'B001S', N'a', CAST(N'2023-04-16T03:00:00.000' AS DateTime), CAST(N'2023-04-16T02:02:42.300' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (313, N'B001S', N'a', CAST(N'2023-04-16T04:00:00.000' AS DateTime), CAST(N'2023-04-16T02:02:48.373' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (314, N'B004XL', N'a', CAST(N'2023-04-16T02:00:00.000' AS DateTime), CAST(N'2023-04-16T02:03:23.037' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (315, N'B004XL', N'd', CAST(N'2023-04-16T06:00:00.000' AS DateTime), CAST(N'2023-04-16T02:03:31.477' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (316, N'B004XL', N'a', CAST(N'2023-04-16T04:00:00.000' AS DateTime), CAST(N'2023-04-16T02:03:26.940' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (317, N'B002M', N'', CAST(N'2023-04-16T02:04:04.000' AS DateTime), CAST(N'2023-04-16T03:04:04.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (318, N'B002M', N'a', CAST(N'2023-04-16T03:05:00.000' AS DateTime), CAST(N'2023-04-16T04:26:12.327' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (319, N'B002M', N'a', CAST(N'2023-04-16T10:05:00.000' AS DateTime), CAST(N'2023-04-16T04:57:02.830' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (320, N'B002M', N'a', CAST(N'2023-04-16T04:15:00.000' AS DateTime), CAST(N'2023-04-16T04:26:18.237' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (321, N'B002M', N'a', CAST(N'2023-04-16T07:05:00.000' AS DateTime), CAST(N'2023-04-16T04:56:55.037' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (322, N'B003L', N'', CAST(N'2023-04-16T04:04:25.000' AS DateTime), CAST(N'2023-04-16T04:57:43.030' AS DateTime), 1, 0, 300000, 300000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (323, N'B004XL', N'', CAST(N'2023-04-16T04:08:07.000' AS DateTime), CAST(N'2023-04-16T04:57:46.423' AS DateTime), 1, 0, 300000, 300000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (324, N'B005S', N'a', CAST(N'2023-04-16T04:10:00.000' AS DateTime), CAST(N'2023-04-16T04:57:14.510' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (325, N'B005S', N'a', CAST(N'2023-04-16T07:00:00.000' AS DateTime), CAST(N'2023-04-16T04:57:18.150' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (326, N'B002M', N'a', CAST(N'2023-04-16T08:05:00.000' AS DateTime), CAST(N'2023-04-16T04:30:20.410' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (327, N'B002M', N'a', CAST(N'2023-04-16T15:00:00.000' AS DateTime), CAST(N'2023-04-16T04:57:06.693' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (328, N'B002M', N'f', CAST(N'2023-04-16T08:05:00.000' AS DateTime), CAST(N'2023-04-16T04:56:59.150' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (329, N'B006M', N'a', CAST(N'2023-04-16T05:00:00.000' AS DateTime), CAST(N'2023-04-16T04:57:10.580' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (330, N'B006M', N'e', CAST(N'2023-04-16T09:10:00.000' AS DateTime), CAST(N'2023-04-16T04:57:25.167' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (331, N'B006M', N'a', CAST(N'2023-04-16T06:00:00.000' AS DateTime), CAST(N'2023-04-16T04:57:21.760' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (332, N'B007L', N'a', CAST(N'2023-04-16T04:45:00.000' AS DateTime), CAST(N'2023-04-16T04:50:14.897' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (333, N'B007L', N'', CAST(N'2023-04-16T04:45:23.000' AS DateTime), CAST(N'2023-04-16T04:50:17.830' AS DateTime), 1, 0, 300000, 300000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (334, N'B007L', N'a', CAST(N'2023-04-16T04:50:00.000' AS DateTime), CAST(N'2023-04-16T04:57:28.447' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (335, N'B008L', N'a', CAST(N'2023-04-16T04:55:00.000' AS DateTime), CAST(N'2023-04-16T04:57:32.013' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (336, N'B008L', N'a', CAST(N'2023-04-16T06:00:00.000' AS DateTime), CAST(N'2023-04-16T04:57:35.657' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (337, N'B008L', N'f', CAST(N'2023-04-16T07:00:00.000' AS DateTime), CAST(N'2023-04-16T04:57:39.413' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (338, N'B002M', N'a', CAST(N'2023-04-16T05:05:00.000' AS DateTime), CAST(N'2023-04-16T06:05:00.000' AS DateTime), 1, 200000, 200000, 200000, N'empty', N'Da thanh toan')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (339, N'B003L', N's', CAST(N'2023-04-16T05:10:00.000' AS DateTime), CAST(N'2023-04-16T05:27:04.160' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (340, N'B003L', N's', CAST(N'2023-04-16T06:10:00.000' AS DateTime), CAST(N'2023-04-16T08:36:20.563' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (341, N'B004XL', N'w', CAST(N'2023-04-16T05:20:00.000' AS DateTime), CAST(N'2023-04-16T05:27:04.180' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (342, N'B003L', N'e', CAST(N'2023-04-16T05:30:00.000' AS DateTime), CAST(N'2023-04-16T05:31:02.207' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (343, N'B003L', N's', CAST(N'2023-04-16T05:35:00.000' AS DateTime), CAST(N'2023-04-16T05:36:23.943' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (345, N'B002M', N'', CAST(N'2023-04-16T09:13:56.000' AS DateTime), CAST(N'2023-04-16T09:16:39.157' AS DateTime), 1, 0, 200000, 200000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (346, N'B002M', N'khang', CAST(N'2023-04-16T12:15:00.000' AS DateTime), CAST(N'2023-04-16T09:16:27.367' AS DateTime), 2, 400000, 400000, 400000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (347, N'B002M', N'', CAST(N'2023-04-16T09:17:34.000' AS DateTime), CAST(N'2023-04-16T10:17:34.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
GO
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (348, N'B002M', N'', CAST(N'2023-04-26T18:09:32.000' AS DateTime), CAST(N'2023-04-26T19:09:32.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (349, N'B001S', N'', CAST(N'2023-04-27T23:12:22.670' AS DateTime), CAST(N'2023-04-28T00:12:22.670' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (350, N'B002M', N'', CAST(N'2023-04-27T23:12:37.000' AS DateTime), CAST(N'2023-04-27T00:12:37.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (351, N'B003L', N'', CAST(N'2023-04-27T23:13:10.000' AS DateTime), CAST(N'2023-04-27T00:13:10.000' AS DateTime), 1, 0, 300000, 300000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (352, N'B005S', N'', CAST(N'2023-04-27T23:14:46.273' AS DateTime), CAST(N'2023-04-28T00:14:46.273' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (353, N'B001S', N'', CAST(N'2023-05-27T14:15:23.000' AS DateTime), CAST(N'2023-05-27T15:15:23.000' AS DateTime), 1, 0, 100000, 100000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (355, N'B002M', N'', CAST(N'2023-06-18T23:30:22.000' AS DateTime), CAST(N'2023-06-18T00:30:22.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (356, N'B001S', N'', CAST(N'2023-06-19T14:25:58.000' AS DateTime), CAST(N'2023-06-19T15:25:58.000' AS DateTime), 1, 0, 100000, 100000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (358, N'B001S', N'', CAST(N'2023-07-04T21:01:19.000' AS DateTime), CAST(N'2023-07-04T22:01:19.000' AS DateTime), 1, 0, 100000, 100000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (359, N'B002M', N'', CAST(N'2023-07-26T16:33:51.000' AS DateTime), CAST(N'2023-07-26T17:33:51.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (361, N'B001S', N'', CAST(N'2023-07-31T16:57:10.000' AS DateTime), CAST(N'2023-07-31T18:57:10.000' AS DateTime), 2, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (362, N'B001S', N'', CAST(N'2023-08-05T08:13:36.000' AS DateTime), CAST(N'2023-08-05T09:13:36.000' AS DateTime), 1, 0, 100000, 100000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (363, N'B002M', N'', CAST(N'2023-08-05T08:14:04.000' AS DateTime), CAST(N'2023-08-05T14:14:04.000' AS DateTime), 6, 0, 1200000, 1200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (364, N'B008L', N'Pham Nhut Khang', CAST(N'2023-08-05T08:15:00.000' AS DateTime), CAST(N'2023-08-05T08:15:07.607' AS DateTime), 9, 1620000, 2700000, 1620000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (365, N'B007L', N'Lam Ha', CAST(N'2023-08-05T08:15:00.000' AS DateTime), CAST(N'2023-08-05T08:15:48.010' AS DateTime), 4, 720000, 1200000, 720000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (366, N'B008L', N'Lam Ha', CAST(N'2023-08-05T12:00:00.000' AS DateTime), CAST(N'2023-08-05T08:24:28.143' AS DateTime), 6, 1080000, 1800000, 1080000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (367, N'B003L', N'', CAST(N'2023-08-05T08:19:50.000' AS DateTime), CAST(N'2023-08-05T08:20:53.390' AS DateTime), 1, 0, 300000, 300000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (369, N'B003L', N'', CAST(N'2023-08-05T08:23:20.000' AS DateTime), CAST(N'2023-08-05T08:59:52.800' AS DateTime), 3, 0, 900000, 900000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (370, N'B008L', N'0964909321', CAST(N'2023-08-05T10:00:00.000' AS DateTime), CAST(N'2023-08-05T10:10:44.157' AS DateTime), 2, 600000, 600000, 600000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (372, N'B008L', N'0964909321', CAST(N'2023-08-05T13:00:00.000' AS DateTime), CAST(N'2023-08-08T00:09:33.817' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (388, N'B002M', N'', CAST(N'2023-08-23T01:47:46.000' AS DateTime), CAST(N'2023-08-23T01:52:45.227' AS DateTime), 1, 0, 200000, 200000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (389, N'B002M', N'Pham Nhut Khang', CAST(N'2023-08-23T02:50:00.000' AS DateTime), CAST(N'2023-08-23T01:52:52.087' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (390, N'B002M', N'Ha', CAST(N'2023-08-23T05:50:00.000' AS DateTime), CAST(N'2023-08-23T01:51:06.847' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (391, N'B002M', N'', CAST(N'2023-08-23T01:53:25.000' AS DateTime), CAST(N'2023-08-23T02:53:25.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (392, N'B002M', N'Quyen', CAST(N'2023-08-23T02:55:00.000' AS DateTime), CAST(N'2023-08-23T02:26:32.453' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (393, N'B002M', N'No Ti', CAST(N'2023-08-23T10:55:00.000' AS DateTime), CAST(N'2023-08-23T03:15:48.310' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (394, N'B002M', N'Khang', CAST(N'2023-08-23T03:00:00.000' AS DateTime), CAST(N'2023-08-23T03:01:34.937' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (395, N'B002M', N'Khang', CAST(N'2023-08-23T05:00:00.000' AS DateTime), CAST(N'2023-08-23T02:42:41.387' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (396, N'B002M', N'Khang', CAST(N'2023-08-23T06:00:00.000' AS DateTime), CAST(N'2023-08-23T03:15:44.277' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (397, N'B002M', N'Khang', CAST(N'2023-08-23T04:00:00.000' AS DateTime), CAST(N'2023-08-23T03:15:39.750' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (398, N'B002M', N'', CAST(N'2023-08-23T03:15:49.000' AS DateTime), CAST(N'2023-08-23T04:15:49.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (399, N'B002M', N'Khang', CAST(N'2023-08-23T04:00:00.000' AS DateTime), CAST(N'2023-08-23T03:53:10.177' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (400, N'B002M', N'No Ti', CAST(N'2023-08-23T11:30:00.000' AS DateTime), CAST(N'2023-08-23T03:53:23.903' AS DateTime), 2, 400000, 400000, 400000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (401, N'B002M', N'Ha', CAST(N'2023-08-23T08:10:00.000' AS DateTime), CAST(N'2023-08-23T03:53:19.207' AS DateTime), 2, 400000, 400000, 400000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (402, N'B002M', N'Ngan', CAST(N'2023-08-23T06:00:00.000' AS DateTime), CAST(N'2023-08-23T03:53:15.200' AS DateTime), 2, 400000, 400000, 400000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (403, N'B002M', N'Khang', CAST(N'2023-08-23T04:00:00.000' AS DateTime), CAST(N'2023-08-23T04:01:48.917' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (404, N'B002M', N'Quyen', CAST(N'2023-08-23T06:00:00.000' AS DateTime), CAST(N'2023-08-23T04:40:11.590' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (405, N'B002M', N'No Ti', CAST(N'2023-08-23T10:00:00.000' AS DateTime), CAST(N'2023-08-23T04:40:25.013' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (406, N'B002M', N'Khang', CAST(N'2023-08-23T04:05:00.000' AS DateTime), CAST(N'2023-08-23T04:06:48.910' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (407, N'B002M', N'Khang', CAST(N'2023-08-23T04:20:00.000' AS DateTime), CAST(N'2023-08-23T04:21:18.453' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (408, N'B002M', N'Khang', CAST(N'2023-08-23T07:00:00.000' AS DateTime), CAST(N'2023-08-23T04:40:16.093' AS DateTime), 2, 400000, 400000, 400000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (409, N'B002M', N'No Ti', CAST(N'2023-08-23T09:00:00.000' AS DateTime), CAST(N'2023-08-23T04:40:20.173' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (410, N'B002M', N'Ha', CAST(N'2023-08-23T13:00:00.000' AS DateTime), CAST(N'2023-08-23T04:41:06.523' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (411, N'B002M', N'Ngan', CAST(N'2023-08-23T11:00:00.000' AS DateTime), CAST(N'2023-08-23T04:41:26.590' AS DateTime), 2, 400000, 400000, 400000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (412, N'B002M', N'Mai Linh', CAST(N'2023-08-23T15:00:00.000' AS DateTime), CAST(N'2023-08-23T04:41:34.503' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (413, N'B002M', N'Minh Lai', CAST(N'2023-08-23T14:00:00.000' AS DateTime), CAST(N'2023-08-23T04:41:30.980' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (414, N'B002M', N'Ngan', CAST(N'2023-08-23T05:05:00.000' AS DateTime), CAST(N'2023-08-23T05:06:41.017' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (415, N'B002M', N'Ha', CAST(N'2023-08-23T06:10:00.000' AS DateTime), CAST(N'2023-08-23T12:28:29.123' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (416, N'B002M', N'a', CAST(N'2023-08-23T08:00:00.000' AS DateTime), CAST(N'2023-08-23T05:00:07.137' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (417, N'B002M', N'b', CAST(N'2023-08-23T09:00:00.000' AS DateTime), CAST(N'2023-08-23T04:59:59.323' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (418, N'B002M', N'c', CAST(N'2023-08-23T11:00:00.000' AS DateTime), CAST(N'2023-08-23T04:59:52.570' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (419, N'B002M', N'Khang', CAST(N'2023-08-23T08:00:00.000' AS DateTime), CAST(N'2023-08-23T12:28:29.153' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (420, N'B002M', N'Ngan', CAST(N'2023-08-23T09:25:00.000' AS DateTime), CAST(N'2023-08-23T12:28:29.173' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (421, N'B002M', N'a', CAST(N'2023-08-23T11:00:00.000' AS DateTime), CAST(N'2023-08-23T12:28:29.197' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (422, N'B002M', N'a', CAST(N'2023-08-23T13:00:00.000' AS DateTime), CAST(N'2023-08-23T13:05:42.333' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (423, N'B004XL', N'a', CAST(N'2023-08-23T05:00:00.000' AS DateTime), CAST(N'2023-08-23T05:36:16.580' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (424, N'B004XL', N'a', CAST(N'2023-08-23T05:40:00.000' AS DateTime), CAST(N'2023-08-23T12:28:29.217' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (425, N'B004XL', N'b', CAST(N'2023-08-23T09:00:00.000' AS DateTime), CAST(N'2023-08-23T12:28:29.237' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (426, N'B004XL', N'b', CAST(N'2023-08-23T07:00:00.000' AS DateTime), CAST(N'2023-08-23T12:28:29.257' AS DateTime), 2, 600000, 600000, 600000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (427, N'B002M', N'b', CAST(N'2023-08-23T15:10:00.000' AS DateTime), CAST(N'2023-08-23T13:25:46.693' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (428, N'B002M', N'c', CAST(N'2023-08-23T16:15:00.000' AS DateTime), CAST(N'2023-08-23T13:25:51.020' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (429, N'B002M', N'd', CAST(N'2023-08-23T20:00:00.000' AS DateTime), CAST(N'2023-08-23T12:32:20.207' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (430, N'B002M', N'd', CAST(N'2023-08-23T19:00:00.000' AS DateTime), CAST(N'2023-08-23T13:25:58.673' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (431, N'B002M', N'E', CAST(N'2023-08-23T17:20:00.000' AS DateTime), CAST(N'2023-08-23T13:25:55.043' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (432, N'B002M', N'A', CAST(N'2023-08-23T14:00:00.000' AS DateTime), CAST(N'2023-08-23T13:34:07.770' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (433, N'B002M', N'B', CAST(N'2023-08-23T15:30:00.000' AS DateTime), CAST(N'2023-08-23T13:34:11.753' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (434, N'B002M', N'C', CAST(N'2023-08-23T18:00:00.000' AS DateTime), CAST(N'2023-08-23T13:34:15.937' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (435, N'B002M', N'a', CAST(N'2023-08-23T14:00:00.000' AS DateTime), CAST(N'2023-08-23T13:38:44.250' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (436, N'B002M', N'b', CAST(N'2023-08-23T17:10:00.000' AS DateTime), CAST(N'2023-08-23T18:17:19.540' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (437, N'B002M', N'c', CAST(N'2023-08-23T15:15:00.000' AS DateTime), CAST(N'2023-08-23T18:17:19.567' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (438, N'B003L', N'', CAST(N'2023-08-23T13:39:38.000' AS DateTime), CAST(N'2023-08-23T13:40:01.420' AS DateTime), 1, 0, 300000, 300000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (439, N'B003L', N'', CAST(N'2023-08-23T13:41:17.000' AS DateTime), CAST(N'2023-08-23T14:41:17.000' AS DateTime), 1, 0, 300000, 300000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (440, N'B003L', N'a', CAST(N'2023-08-23T15:00:00.000' AS DateTime), CAST(N'2023-08-23T13:58:23.750' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (441, N'B003L', N'a', CAST(N'2023-08-23T16:00:00.000' AS DateTime), CAST(N'2023-08-23T18:17:19.587' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (442, N'B003L', N'b', CAST(N'2023-08-23T14:45:00.000' AS DateTime), CAST(N'2023-08-23T14:48:47.547' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (443, N'B004XL', N'a', CAST(N'2023-08-23T15:15:00.000' AS DateTime), CAST(N'2023-08-23T18:17:19.607' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (444, N'B003L', N'a', CAST(N'2023-08-23T19:00:00.000' AS DateTime), CAST(N'2023-08-23T18:17:55.567' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (445, N'B003L', N'a', CAST(N'2023-08-23T18:30:00.000' AS DateTime), CAST(N'2023-08-23T18:25:39.757' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (446, N'B003L', N'b', CAST(N'2023-08-23T21:00:00.000' AS DateTime), CAST(N'2023-08-23T18:25:47.643' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (447, N'B003L', N'c', CAST(N'2023-08-23T20:00:00.000' AS DateTime), CAST(N'2023-08-23T18:25:43.973' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (448, N'B002M', N'', CAST(N'2023-08-23T18:22:57.000' AS DateTime), CAST(N'2023-08-23T18:25:25.717' AS DateTime), 1, 0, 200000, 200000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (449, N'B002M', N'a', CAST(N'2023-08-23T19:25:00.000' AS DateTime), CAST(N'2023-08-23T18:25:29.647' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (450, N'B002M', N'b', CAST(N'2023-08-23T21:00:00.000' AS DateTime), CAST(N'2023-08-23T18:25:34.347' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (451, N'B002M', N'a', CAST(N'2023-08-23T19:10:00.000' AS DateTime), CAST(N'2023-08-23T18:50:13.647' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (452, N'B002M', N'b', CAST(N'2023-08-23T21:00:00.000' AS DateTime), CAST(N'2023-08-23T18:49:56.487' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (453, N'B002M', N'a', CAST(N'2023-08-23T19:00:00.000' AS DateTime), CAST(N'2023-08-23T19:09:23.427' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (454, N'B002M', N'b', CAST(N'2023-08-23T21:00:00.000' AS DateTime), CAST(N'2023-08-23T21:23:13.507' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (455, N'B002M', N'c', CAST(N'2023-08-23T20:00:00.000' AS DateTime), CAST(N'2023-08-23T21:23:13.533' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (462, N'B001S', N'', CAST(N'2023-08-24T23:31:16.747' AS DateTime), CAST(N'2023-08-24T23:33:13.593' AS DateTime), 1, 0, 0, 0, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (467, N'B004XL', N'', CAST(N'2023-08-25T03:35:37.697' AS DateTime), CAST(N'2023-08-25T04:35:37.697' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (470, N'B001S', N'', CAST(N'2023-08-25T03:41:25.000' AS DateTime), CAST(N'2023-08-25T05:41:25.000' AS DateTime), 2, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (477, N'B002M', N'Duc', CAST(N'2023-08-25T17:00:00.000' AS DateTime), CAST(N'2023-08-25T16:45:43.967' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (478, N'B002M', N'Chi Ha', CAST(N'2023-08-25T20:00:00.000' AS DateTime), CAST(N'2023-08-25T16:40:10.440' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (479, N'B002M', N'Khang', CAST(N'2023-08-25T18:30:00.000' AS DateTime), CAST(N'2023-08-25T20:51:18.350' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (480, N'B002M', N'Duy', CAST(N'2023-08-25T21:00:00.000' AS DateTime), CAST(N'2023-08-25T21:01:26.713' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (481, N'B002M', N'Ha', CAST(N'2023-08-25T16:45:00.000' AS DateTime), CAST(N'2023-08-25T16:42:44.910' AS DateTime), 2, 400000, 400000, 400000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (482, N'B003L', N'', CAST(N'2023-08-25T16:48:51.000' AS DateTime), CAST(N'2023-08-25T17:48:51.000' AS DateTime), 1, 0, 300000, 300000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (483, N'B002M', N'Khang', CAST(N'2023-08-25T17:00:00.000' AS DateTime), CAST(N'2023-08-25T17:01:20.100' AS DateTime), 1, 200000, 200000, 200000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (487, N'B006M', N'', CAST(N'2023-08-25T17:24:07.793' AS DateTime), CAST(N'2023-08-25T18:24:07.793' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (489, N'B002M', N'', CAST(N'2023-08-25T21:22:49.000' AS DateTime), CAST(N'2023-08-25T22:22:49.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
GO
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (492, N'B001S', N'', CAST(N'2023-08-25T23:33:29.257' AS DateTime), CAST(N'2023-08-26T00:33:29.257' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (493, N'B002M', N'', CAST(N'2023-08-25T23:42:33.453' AS DateTime), CAST(N'2023-08-26T00:42:33.453' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (495, N'B004XL', N'', CAST(N'2023-08-26T00:15:54.840' AS DateTime), CAST(N'2023-08-26T01:15:54.840' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (497, N'B003L', N'', CAST(N'2023-08-26T00:57:44.000' AS DateTime), CAST(N'2023-08-26T01:57:44.000' AS DateTime), 1, 0, 300000, 300000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (498, N'B002M', N'', CAST(N'2023-08-26T01:06:50.000' AS DateTime), CAST(N'2023-08-26T02:06:50.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (500, N'B002M', N'', CAST(N'2023-08-29T13:54:41.000' AS DateTime), CAST(N'2023-08-29T14:41:56.567' AS DateTime), 1, 0, 200000, 200000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (501, N'B001S', N'Khang', CAST(N'2023-08-29T14:00:00.000' AS DateTime), CAST(N'2023-08-29T14:14:03.047' AS DateTime), 1, 100000, 100000, 100000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (502, N'B003L', N'', CAST(N'2023-08-29T13:57:40.320' AS DateTime), CAST(N'2023-08-29T14:41:59.893' AS DateTime), 1, 0, 0, 0, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (503, N'B001S', N'', CAST(N'2023-08-29T14:14:15.213' AS DateTime), CAST(N'2023-08-29T15:14:15.213' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (504, N'B004XL', N'', CAST(N'2023-08-29T14:15:01.683' AS DateTime), CAST(N'2023-08-29T14:42:04.183' AS DateTime), 1, 0, 0, 0, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (505, N'B006M', N'', CAST(N'2023-08-29T14:18:23.810' AS DateTime), CAST(N'2023-08-29T15:18:23.810' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (506, N'B007L', N'a', CAST(N'2023-08-29T15:00:00.000' AS DateTime), CAST(N'2023-08-29T14:41:51.950' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (509, N'B002M', N'', CAST(N'2023-08-29T14:47:56.000' AS DateTime), CAST(N'2023-08-29T15:47:56.000' AS DateTime), 1, 0, 200000, 200000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (510, N'B003L', N'a', CAST(N'2023-08-29T16:00:00.000' AS DateTime), CAST(N'2023-08-29T15:48:55.687' AS DateTime), 1, 300000, 300000, 300000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (511, N'B011XL', N'', CAST(N'2023-08-29T15:55:21.000' AS DateTime), CAST(N'2023-08-29T16:55:21.000' AS DateTime), 1, 0, 120000, 120000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (512, N'B002M', N'', CAST(N'2023-08-29T16:08:31.060' AS DateTime), CAST(N'2023-08-29T17:08:31.060' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (513, N'B002M', N'', CAST(N'2023-08-29T16:08:31.060' AS DateTime), CAST(N'2023-08-29T17:08:31.060' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (519, N'B002M', N'', CAST(N'2023-08-30T00:25:30.000' AS DateTime), CAST(N'2023-08-30T01:25:30.000' AS DateTime), 1, 0, 50000, 50000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (520, N'B006M', N'', CAST(N'2023-08-30T00:25:39.217' AS DateTime), CAST(N'2023-08-30T01:25:39.217' AS DateTime), 1, 0, 0, 0, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (521, N'B003L', N'', CAST(N'2023-08-30T00:38:28.000' AS DateTime), CAST(N'2023-08-30T01:38:28.000' AS DateTime), 1, 0, 80000, 80000, N'empty', NULL)
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (522, N'B007L', N'a', CAST(N'2023-08-30T01:00:00.000' AS DateTime), CAST(N'2023-08-30T01:03:09.727' AS DateTime), 1, 80000, 80000, 80000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (523, N'B002M', N'', CAST(N'2023-08-30T15:52:33.000' AS DateTime), CAST(N'2023-08-30T15:53:28.877' AS DateTime), 1, 0, 50000, 50000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (524, N'B002M', N'a', CAST(N'2023-08-30T16:00:00.000' AS DateTime), CAST(N'2023-08-30T16:01:17.007' AS DateTime), 1, 50000, 50000, 50000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (525, N'B002M', N'a', CAST(N'2023-08-30T16:05:00.000' AS DateTime), CAST(N'2023-08-30T16:02:06.003' AS DateTime), 1, 50000, 50000, 50000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (526, N'B002M', N'a', CAST(N'2023-08-30T16:05:00.000' AS DateTime), CAST(N'2023-08-30T16:03:18.607' AS DateTime), 1, 50000, 50000, 50000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (527, N'B002M', N'a', CAST(N'2023-08-30T17:30:00.000' AS DateTime), CAST(N'2023-08-30T16:06:53.043' AS DateTime), 1, 50000, 50000, 50000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (528, N'B002M', N'b', CAST(N'2023-08-30T18:45:00.000' AS DateTime), CAST(N'2023-08-30T16:06:57.213' AS DateTime), 1, 50000, 50000, 50000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (529, N'B002M', N'c', CAST(N'2023-08-30T20:00:00.000' AS DateTime), CAST(N'2023-08-30T16:07:01.210' AS DateTime), 1, 50000, 50000, 50000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (530, N'B002M', N'd', CAST(N'2023-08-30T16:10:00.000' AS DateTime), CAST(N'2023-08-30T16:06:34.277' AS DateTime), 1, 50000, 50000, 50000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (531, N'B002M', N'', CAST(N'2023-08-30T16:06:36.000' AS DateTime), CAST(N'2023-08-30T16:06:46.010' AS DateTime), 1, 0, 50000, 50000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (532, N'B002M', N'a', CAST(N'2023-08-30T16:30:00.000' AS DateTime), CAST(N'2023-08-30T16:08:21.343' AS DateTime), 1, 50000, 50000, 50000, N'used', N'da huy')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (533, N'B002M', N'b', CAST(N'2023-08-30T18:00:00.000' AS DateTime), CAST(N'2023-08-30T19:00:00.000' AS DateTime), 1, 50000, 50000, 50000, N'booked', N'Chưa thanh toán')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (534, N'B002M', N'', CAST(N'2023-08-30T16:08:22.000' AS DateTime), CAST(N'2023-08-30T16:08:36.570' AS DateTime), 1, 0, 50000, 50000, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (535, N'B006M', N'', CAST(N'2023-08-30T16:09:05.450' AS DateTime), CAST(N'2023-08-30T16:09:37.487' AS DateTime), 1, 0, 0, 0, N'used', N'tra som')
INSERT [dbo].[PhieuDatBox] ([MaHD], [MaBox], [TenKH], [GioBD], [GioKT], [SoGio], [TraTruoc], [ThanhTien], [TienThucNhan], [TrangThai], [GhiChu]) VALUES (536, N'B003L', N'a', CAST(N'2023-08-30T18:00:00.000' AS DateTime), CAST(N'2023-08-30T19:00:00.000' AS DateTime), 1, 80000, 80000, 80000, N'booked', N'Chưa thanh toán')
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'BN001', N'Bánh Gato', 50000, N'gato.jpg', N'Bánh Gato', N'LSP06', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'BN002', N'Bông Lan Trứng Muối', 60000, N'bonglantrungmuoi.jpg', N'Bông Lan Trứng Muối', N'LSP06', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'CP001', N'Capuchino', 30000, N'capuchino.jpg', N'Capuchino', N'LS008', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'CP002', N'Iced Americano', 25000, N'iced- americano.jpg', N'Iced Americano', N'LS008', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'CP003', N'Dark Chocolate Mocha', 35000, N'Dark-Chocolate-Mocha.jpg', N'Dark Chocolate Mocha', N'LS008', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'DK001', N'Khô Bò', 25000, N'khobovien.jpg', N'Khô Bò', N'LSP04', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'DK002', N'Khô Gà ', 25000, N'khoga.jpg', N'Khô gà ', N'LSP04', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'NE001', N'Nước Cam', 25000, N'nuoccam.jpg', N'Nước Cam', N'LSP02', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'NE002', N'Nước Ép Táo', 30000, N'eptao.jpg', N'Nước Ép Táo', N'LSP02', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'NE003', N'Coconut', 25000, N'dua.jpg', N'Coconut', N'LSP02', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'NN001', N'Coca', 15000, N'coca.jpg', N'Coca', N'LSP01', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'NN002', N'Pesi', 15000, N'pesi.jfif', N'Pesi', N'LSP01', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'NN003', N'7up', 15000, N'7up.jfif', N'7up', N'LSP01', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'NN004', N'Nước Suối', 10000, N'nc0suoi.jpg', N'Nước Suối', N'LSP01', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'ST001', N'Sinh tố bơ', 25000, N'bo.jpg', N'Sinh tố bơ', N'LSP03', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'ST002', N'Sinh tố dâu', 30000, N'dau.jpg', N'Sinh tố dâu', N'LSP03', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'TC001', N'Táo Xanh', 30000, N'tao.jpg', N'Táo Xanh', N'LSP05', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'TC002', N'Nho', 30000, N'nho.jpg', N'Nho', N'LSP05', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'TC003', N'Mãng Cầu', 25000, N'mang-cau.jpg', N'Mãng Cầu', N'LSP05', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'TS001', N'Trà sữa truyền thống', 25000, N'trasua.jpg', N'Trà sữa truyền thống', N'LSP07', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'TS002', N'Trà Vải', 25000, N'tra-vai.jpg', N'Trà vải', N'LSP07', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'TS003', N'Trà Dâu', 22000, N'tra-dau.jpg', N'Trà Dâu', N'LSP07', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'TS004', N'Trà Lài', 25000, N'tra-lai.jpg', N'Trà Lài', N'LSP07', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'TS005', N'Trà Hoa Cúc', 25000, N'hoa-cuc-tao-do.jpg', N'Trà hoa cúc táo đỏ', N'LSP07', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HinhAnh], [MoTa], [MaLoai], [TrangThai]) VALUES (N'TS006', N'Hồng Trà Bí Đao', 25000, N'bi-dao.jpg', N'Hồng trà bí đao', N'LSP07', 1)
GO
ALTER TABLE [dbo].[Box]  WITH CHECK ADD FOREIGN KEY([MaLoaiBox])
REFERENCES [dbo].[LoaiBox] ([MaLoaiBox])
GO
ALTER TABLE [dbo].[Combo]  WITH CHECK ADD FOREIGN KEY([MaLoaiBox])
REFERENCES [dbo].[LoaiBox] ([MaLoaiBox])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComboCT]  WITH CHECK ADD FOREIGN KEY([MaBox])
REFERENCES [dbo].[Box] ([MaBox])
GO
ALTER TABLE [dbo].[ComboCT]  WITH CHECK ADD FOREIGN KEY([MaCB])
REFERENCES [dbo].[Combo] ([MaCB])
GO
ALTER TABLE [dbo].[ComboCT]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ComboCT]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaKM])
REFERENCES [dbo].[KhuyenMai] ([MaKM])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonCT]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[HoaDonCT]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[LoaiSP]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[PhieuDatBox]  WITH CHECK ADD FOREIGN KEY([MaBox])
REFERENCES [dbo].[Box] ([MaBox])
GO
ALTER TABLE [dbo].[PhieuDatBox]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[sinhvien]  WITH CHECK ADD FOREIGN KEY([class])
REFERENCES [dbo].[class] ([id])
GO
/****** Object:  StoredProcedure [dbo].[sp_box_in_ngay]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_box_in_ngay] @ngayBd datetime, @ngayKt datetime
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
GO
/****** Object:  StoredProcedure [dbo].[sp_combo_in_ngay]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_combo_in_ngay] @ngayBd datetime, @ngayKt datetime
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DatBox]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DatBox] @MaHD int, @MaBox varchar(10), @TenKH nvarchar(50), @GioBD DATETIME, @GioKT DATETIME, @soGio int, @TraTruoc int, @ThanhTien int,@TienThucNhan int, @TrangThai NVARCHAR(20), @ghiChu nvarchar(50)
as 
begin
	Insert into PhieuDatBox values(@MaHD, @MaBox, @TenKH, @GioBD, @GioKT, @soGio, @TraTruoc, @ThanhTien, @TienThucNhan, @TrangThai, @ghiChu)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_doanhthu_sanpham]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_doanhthu_sanpham] @timeStart datetime, @timeEnd datetime
as
begin
	declare @t table (id nvarchar(20), name nvarchar(50), price float, quantity int)

	insert into @t (id,name, price, quantity)
	select ct.MaSP, sp.TenSP, sp.Gia, sum(SoLuong) as soluong from HoaDonCT ct
	join HoaDon hd on hd.MaHD = ct.MaHD
	join SanPham sp on sp.MaSP = ct.MaSP
	where ct.MaSP is not null and NgayTao <= @timeEnd and NgayTao >= @timeStart
	group by ct.MaSP, sp.TenSP, sp.Gia
	order by sum(SoLuong) desc

	select top 10 * from @t
	order by quantity desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_bill]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_insert_bill] @tenKM nvarchar(50), @maNV varchar(10), @ghichu nvarchar(255), @tongTien float, @maKm nvarchar(10)
	as
	begin

		Insert into HoaDon values(getdate(), @tenKM, @maNV, @ghichu, @tongTien, @maKm)

		update KhuyenMai
		set SoLuot = SoLuot  - 1
		where MaKM = @maKm 
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_nangxuat_nv]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_nangxuat_nv] @timeStart datetime, @timeEnd datetime
as
begin
	select top 10  hd.MaNV,TenNV, NgayVaoLam, SUM(SoLuong) as soluong from HoaDon hd
	join HoaDonCT ct on ct.MaHD = hd.MaHD
	join NhanVien nv on nv.MaNV = hd.MaNV
	where  TrangThai = 1 and NgayTao <= @timeEnd and NgayTao >= @timeStart
	group by  hd.MaNV, TenNV, NgayVaoLam
end
GO
/****** Object:  StoredProcedure [dbo].[sp_nhan_box]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_nhan_box] @MaHD int, @MaBox nvarchar(10), @thanhTien int
as 
begin
	update HoaDon
	set TongTien  = @thanhTien
	where MaHD = @MaHD

	update PhieuDatBox
	set TrangThai = 'active', TienThucNhan = @thanhTien, GhiChu = N'Da thanh toan'
	where MaHD = @MaHD and MaBox = @MaBox
end
GO
/****** Object:  StoredProcedure [dbo].[sp_product_in_ngay]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_product_in_ngay] @ngayBd datetime, @ngayKt datetime
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
GO
/****** Object:  StoredProcedure [dbo].[sp_select_dt]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_select_dt] @timeStart datetime, @timeEnd datetime
as
begin
	select top 10 CONVERT(VARCHAR(10),NgayTao,112), SUM(TongTien) from HoaDon
	where NgayTao <= @timeEnd and NgayTao >= @timeStart
	GROUP BY CONVERT(VARCHAR(10),NgayTao,112)
	order by CONVERT(VARCHAR(10),NgayTao,112) desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_DatBox]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_update_DatBox] @TrangThai NVARCHAR(20), @GioKT DATETIME, @MaBox varchar(10), @gioKTMoi Datetime
as 
begin
	update PhieuDatBox
	set TrangThai = @TrangThai, GioKT = @gioKTMoi
	where MaBox = MaBox and GioKT = @GioKT
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_NhanBox]    Script Date: 30/08/2023 4:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_update_NhanBox] @MaBox varchar(10), @gioBD datetime
as 
begin
	update PhieuDatBox
	set TrangThai = 'active', ghichu = 'Đã thanh toán'
	where MaBox = @MaBox and GioBD = @GioBD
end
GO
USE [master]
GO
ALTER DATABASE [BoxCF] SET  READ_WRITE 
GO
