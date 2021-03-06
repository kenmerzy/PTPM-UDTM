USE [master]
GO
/****** Object:  Database [ThiTracNghiem]    Script Date: 8/13/2020 10:45:24 AM ******/
CREATE DATABASE [ThiTracNghiem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ThiTracNghiem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ThiTracNghiem.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ThiTracNghiem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ThiTracNghiem_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ThiTracNghiem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ThiTracNghiem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ThiTracNghiem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ThiTracNghiem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ThiTracNghiem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ThiTracNghiem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ThiTracNghiem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ThiTracNghiem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ThiTracNghiem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ThiTracNghiem] SET  MULTI_USER 
GO
ALTER DATABASE [ThiTracNghiem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ThiTracNghiem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ThiTracNghiem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ThiTracNghiem]
GO
/****** Object:  Table [dbo].[CauHoi]    Script Date: 8/13/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CauHoi](
	[MaCauHoi] [int] IDENTITY(1,1) NOT NULL,
	[HinhThucCauHoi] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](500) NULL,
	[MaMon] [varchar](50) NULL,
	[DoKho] [int] NULL,
	[Hinh] [varchar](50) NULL,
 CONSTRAINT [PK_CauHoi] PRIMARY KEY CLUSTERED 
(
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DapAn]    Script Date: 8/13/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DapAn](
	[MaDapAn] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](300) NULL,
	[DungSai] [bit] NULL,
	[MaCauHoi] [int] NULL,
 CONSTRAINT [PK_DapAn] PRIMARY KEY CLUSTERED 
(
	[MaDapAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KetQua]    Script Date: 8/13/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQua](
	[MaKetQua] [int] IDENTITY(1,1) NOT NULL,
	[MaThiSinh] [int] NOT NULL,
	[MaKyThi] [int] NOT NULL,
	[NgayThi] [date] NULL,
	[Diem] [float] NULL,
	[ThoiGianLamBai] [int] NULL,
 CONSTRAINT [PK_KetQua_1] PRIMARY KEY CLUSTERED 
(
	[MaKetQua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khoi]    Script Date: 8/13/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khoi](
	[MaKhoi] [varchar](2) NOT NULL,
	[MaMon] [varchar](50) NULL,
	[TenKhoi] [nchar](10) NULL,
 CONSTRAINT [PK_Khoi] PRIMARY KEY CLUSTERED 
(
	[MaKhoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KyThi]    Script Date: 8/13/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KyThi](
	[MaKyThi] [int] IDENTITY(1,1) NOT NULL,
	[MaMon] [varchar](50) NOT NULL,
	[TenKyThi] [nvarchar](50) NULL,
	[ThoiGianLamBai] [int] NULL,
	[ThoiGianMoDe] [smalldatetime] NULL,
	[ThoiGianDongDe] [smalldatetime] NULL,
	[TongSoCau] [int] NULL,
	[TiLeDe] [int] NULL,
	[TiLeKho] [int] NULL,
	[TienLui] [bit] NULL,
	[MatKhau] [varchar](50) NULL,
	[MaKhoi] [varchar](2) NULL,
	[MoTa] [nvarchar](200) NULL,
	[HinhAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK_KyThi_1] PRIMARY KEY CLUSTERED 
(
	[MaKyThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiTaiKhoan]    Script Date: 8/13/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiTaiKhoan](
	[MaLoaiTaiKhoan] [varchar](50) NOT NULL,
	[TenLoaiTaiKhoan] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LuuKyThi]    Script Date: 8/13/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuuKyThi](
	[MaKyThi] [int] NOT NULL,
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[TenKyThi] [nvarchar](50) NULL,
	[ThoiGian] [datetime] NULL,
 CONSTRAINT [PK_LuuKyThi] PRIMARY KEY CLUSTERED 
(
	[MaKyThi] ASC,
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonThi]    Script Date: 8/13/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonThi](
	[MaMon] [varchar](50) NOT NULL,
	[TenMon] [nvarchar](50) NULL,
 CONSTRAINT [PK_MonThi] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 8/13/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDangNhap] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[NgayTao] [date] NULL,
	[LoaiTaiKhoan] [varchar](50) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThiSinh]    Script Date: 8/13/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThiSinh](
	[MaThiSinh] [int] IDENTITY(1,1) NOT NULL,
	[TenThiSinh] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[SoDienThoai] [varchar](20) NULL,
	[NamSinh] [date] NULL,
	[Email] [varchar](50) NULL,
	[TenDangNhap] [varchar](50) NULL,
 CONSTRAINT [PK_ThiSinh1] PRIMARY KEY CLUSTERED 
(
	[MaThiSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CauHoi] ON 

INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (1, N'Trắc nghiệm', N'Nguyên nhân sinh ra sóng biển là:', N'DL6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (2, N'Trắc nghiệm', N'Hệ thống sông bao gồm:', N'DL6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (3, N'Trắc nghiệm', N'Các sông làm nhiệm vụ cung cấp nước cho sông chính gọi là', N'DL6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (4, N'Trắc nghiệm', N'Độ muối trong nước biển và đại dương có được là nhờ các nguồn cung cấp', N'DL6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (5, N'Trắc nghiệm', N'Thành phần chiếm khối lượng lớn nhất trong đất là:', N'DL6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (6, N'Trắc nghiệm', N'Các sông làm nhiệm vụ thoát nước cho sông chính gọi là ', N'DL6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (7, N'Trắc nghiệm', N'Cấu tạo của đất bao gồm có mấy tầng chính ?', N'DL6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (8, N'Trắc nghiệm', N'Độ muối của nước biển Hồng Hải khoảng', N'DL6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (9, N'Trắc nghiệm', N'Trong thủy quyển chủ yếu là nước mặn chiếm', N'DL6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (10, N'Trắc nghiệm', N'Đặc điểm lớn nhất, có giá trị nhất của đất là:', N'DL6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (11, N'Trắc nghiệm', N'Tập hợp : Sông chính, phụ lưu, chi lưu của một dòng sông gọi là:', N'DL6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (12, N'Trắc nghiệm', N'Vai trò của khí hậu là', N'DL6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (13, N'Trắc nghiệm', N'Sự phân bố của động vật chịu ảnh hưởng quyết định của yếu tố tự nhiên nào ?', N'DL6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (14, N'Trắc nghiệm', N'Hiện tượng triều kém thường xảy ra vào các ngày:', N'DL6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (15, N'Trắc nghiệm', N'Hải cẩu, gấu tuyết, chim cánh cụt… là những sinh vật phân bố ở môi trườngnào ?', N'DL6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (16, N'Trắc nghiệm', N'Dòng biển là hiện tượng', N'DL6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (17, N'Trắc nghiệm', N'Bọ cạp, xương rồng, bao báp, lạc đà …là những sinh vật điển hình cho môitrường:', N'DL6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (18, N'Trắc nghiệm', N'Sự khác nhau cơ bản giữa sông và hồ là', N'DL6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (19, N'Trắc nghiệm', N'Dòng biển đi qua một vùng đất làm cho vùng đất đó có lượng mưa lớn là ', N'DL6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (20, N'Trắc nghiệm', N'Nhân tố tự nhiên ảnh hưởng quyết định đến sự phân bố của sinh vật là ', N'DL6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (21, N'Trắc nghiệm', N'Bùng nổ dân số xảy ra khi', N'DL7', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (22, N'Trắc nghiệm', N'Hoang mạc lớn nhất thế giới nằm ở', N'DL7', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (23, N'Trắc nghiệm', N'Những nơi có tốc độ hoang mạc hóa nhanh nhất là', N'DL7', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (24, N'Trắc nghiệm', N'Khi khoan sâu vào lòng đất trong các hoang mạc, người ta phát hiện ra loại khoáng sản nào?', N'DL7', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (25, N'Trắc nghiệm', N'Tính chất đặc trưng của khí hậu hoang mạc là', N'DL7', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (26, N'Trắc nghiệm', N'Giới hạn của đới lạnh từ', N'DL7', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (27, N'Trắc nghiệm', N'Tập tính nào không phải là sự thích nghi của động vật ở đới lạnh?', N'DL7', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (28, N'Trắc nghiệm', N'Sự phân tầng của thực vật theo độ cao ở vùng núi là do ảnh hưởng của sự thay đổi', N'DL7', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (29, N'Trắc nghiệm', N'Trên thế giới có bao nhiêu lục địa và bao nhiêu châu lục?', N'DL7', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (32, N'Trắc nghiệm', N'Mùa đông không lạnh lắm, mùa hạ mát, mưa quanh năm là đặc điểm của môi trường', N'DL7', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (34, N'Trắc nghiệm', N'Kiểu môi trường có đặc điểm khí hậu "Nóng ẩm, mưa nhiều quanh năm" là môi trường', N'DL7', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (35, N'Trắc nghiệm', N'Nam Á và Đông Nam Á là hai khu vực thuộc kiểu môi trường nào của đới nóng?', N'DL7', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (36, N'Trắc nghiệm', N'Trường hợp sẽ dẫn đến sự tăng nhanh dân số là:', N'DL7', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (37, N'Trắc nghiệm', N'Đặc điểm bên ngoài dễ phân biệt nhất giữa các chủng tộc chính trên thế giới là:', N'DL7', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (38, N'Trắc nghiệm', N'Đặc điểm của quá trình đô thị hóa trên thế giới là:', N'DL7', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (39, N'Trắc nghiệm', N'Môi trường xích đạo ẩm có rừng rậm xanh quanh năm có nhiều tầng cây là:', N'DL7', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (40, N'Trắc nghiệm', N'Hạn chế của tài nguyên đất ở môi trường nhiệt đới là:', N'DL7', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (41, N'Trắc nghiệm', N'Việt Nam nằm trong môi trường:', N'DL7', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (42, N'Trắc nghiệm', N'Thảm thực vật đới ôn hòa từ tây sang đông là:', N'DL7', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (43, N'Trắc nghiệm', N'Các cảnh quan công nghiệp ở đới ôn hòa có hạn chế lớn nhất nào?', N'DL7', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (44, N'Trắc nghiệm', N'Điểm nào sau đây không đúng với địa hình châu Á?', N'DL8', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (45, N'Trắc nghiệm', N'Các kiểu khí hậu phổ biến ở châu Á là:', N'DL8', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (46, N'Trắc nghiệm', N'Rừng cận nhiệt phổ biến ở:', N'DL8', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (47, N'Trắc nghiệm', N'Ở Đông Á về mùa đông gió thổi từ trung tâm áp cao nào đến áp thấp nào?', N'DL8', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (48, N'Trắc nghiệm', N'Chủng tộc Ơ-rô-pê-ô-ít phân bố chủ yếu ở khu vực nào của Châu Á?', N'DL8', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (49, N'Trắc nghiệm', N'Thủ đô quốc gia I Ran là:', N'DL8', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (50, N'Trắc nghiệm', N'Nguồn dầu mỏ và khí đốt của Châu Á tập trung chủ yếu ở khu vực nào?', N'DL8', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (51, N'Trắc nghiệm', N'Kiểu khí hậu nhiệt đới gió mùa ở châu Á phân bố ở khu vực nào?', N'DL8', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (52, N'Trắc nghiệm', N'Những sông lớn ở Châu Á đổ ra Ấn Độ Dương là:', N'DL8', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (53, N'Trắc nghiệm', N'Hướng gió chính vào mùa hạ ở Việt Nam là:', N'DL8', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (54, N'Trắc nghiệm', N'So với các châu lục khác, châu Á có số dân:', N'DL8', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (55, N'Trắc nghiệm', N'Phật giáo ra đời ở quốc gia nào dưới đây?', N'DL8', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (56, N'Trắc nghiệm', N'Phần đất liền châu Á không tiếp giáp đại dương nào sau đây?', N'DL8', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (57, N'Trắc nghiệm', N'Kiểu khí hậu cận nhiệt và ôn đới gió mùa phân bố ở khu vực nào?', N'DL8', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (58, N'Trắc nghiệm', N'Sông ở Bắc Á thường có hướng:', N'DL8', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (59, N'Trắc nghiệm', N'Quốc gia nào dưới đây có tín đồ Hồi giáo đông nhất Châu Á và thế giới?', N'DL8', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (60, N'Trắc nghiệm', N'Quốc gia có dân số đông dân nhất châu Á và thế giới là:', N'DL8', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (61, N'Trắc nghiệm', N'Hướng gió chính vào mùa Đông ở Đông Nam Á là hướng nào?', N'DL8', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (62, N'Trắc nghiệm', N'Đồng bằng nào không thuộc châu Á?', N'DL8', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (63, N'Trắc nghiệm', N'Hướng gió chính vào mùa đông ở Châu Á là:', N'DL8', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (64, N'Trắc nghiệm', N'Cảnh quan tự nhiên nào dưới đây phổ biến ở khu vực khí hậu nhiệt đới khô?', N'DL9', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (65, N'Trắc nghiệm', N'Vào mùa hạ ở Châu Á có:', N'DL9', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (66, N'Trắc nghiệm', N'Ấn Độ là nơi ra đời của tôn giáo lớn nào dưới đây?', N'DL9', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (67, N'Trắc nghiệm', N'Nơi có mật độ dân số thấp ở châu Á là nơi:', N'DL9', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (68, N'Trắc nghiệm', N'Châu Á kéo dài từ vùng cực Bắc đến:', N'DL9', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (69, N'Trắc nghiệm ', N'Tại sao châu Á có nhiều đới khí hậu?', N'DL9', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (70, N'Trắc nghiệm ', N'Khu vực nào ở châu Á sông ngòi kém phát triển nhất?', N'DL9', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (71, N'Trắc nghiệm ', N'Hướng gió chính nào sau đây là hướng gió vào mùa hạ ở Khu vực Nam Á?', N'DL9', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (72, N'Trắc nghiệm ', N'Hồi giáo là một trong những tôn giáo lớn ở Châu Á ra đời tại quốc gia nào?', N'DL9', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (73, N'Trắc nghiệm ', N'Nước nào sau đây có diện tích lớn nhất ở Châu Á?', N'DL9', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (74, N'Trắc nghiệm ', N'Những quốc gia nào được xem là con rồng của châu Á?', N'DL9', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (75, N'Trắc nghiệm ', N'Nước nào trong các nước dưới đây khai thác và xuất khẩu dầu mỏ lớn nhất Châu Á?', N'DL9', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (76, N'Trắc nghiệm ', N'Sản xuất công nghiệp của các nước châu Á có đặc điểm chung là:', N'DL9', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (77, N'Trắc nghiệm ', N'Sông nào bắt nguồn từ sơn nguyên Tây Tạng chảy về phía đông rồi đổ ra biển Hoàng Hải và biển Hoa Đông?', N'DL9', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (78, N'Trắc nghiệm ', N'Đoạn sông Mê Công chảy vào nước ta có tên gọi là gì?', N'DL9', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (79, N'Trắc nghiệm ', N'Đồng bằng nào có diện tích lớn nhất nước ta?', N'DL9', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (80, N'Trắc nghiệm ', N'Các loại cây trồng nào dưới đây được dùng làm nguyên liệu sản xuất thủ công nghiệp?', N'DL9', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (81, N'Trắc nghiệm ', N'Ở nước ta vào mùa đông tính chất nóng ẩm bị xáo trộn nhiều nhất là vùng:', N'DL9', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (82, N'Trắc nghiệm ', N'Miền Tây Bắc và Bắc Trung Bộ có đặc điểm khí hậu nổi bật nào dưới đây?', N'DL9', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (83, N'Trắc nghiệm ', N'Đồng bằng Nam Bộ được hình thành và phát triển trên:', N'DL9', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (84, N'Trắc nghiệm ', N'Ở Ai Cập, vua còn được gọi là gì?', N'LS6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (85, N'Trắc nghiệm ', N'Xã hội có giai cấp và nhà nước cổ đại phương Đông được hình thành từ', N'LS6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (86, N'Trắc nghiệm ', N'Từ “en-si” trong tiếng Lưỡng Hà có nghĩa là gì?', N'LS6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (87, N'Trắc nghiệm ', N'Chủ nhân của người Lưỡng Hà là', N'LS6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (88, N'Trắc nghiệm ', N'Yếu tố nào không phải nguyên nhân làm cho các quốc gia Hy Lạp và Rô-ma lại có nền ngoại thương phát triển?', N'LS6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (89, N'Trắc nghiệm ', N'Vào khoảng thời gian nào cư dân Địa Trung Hải bắt đầu biết chế tạo công cụ bằng sắt?', N'LS6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (90, N'Trắc nghiệm ', N'Khởi nghĩa Xpac-ta-cút nổ ra ở quốc gia nào?', N'LS6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (91, N'Trắc nghiệm ', N'Các ngành nghề thủ công nghiệp nổi tiếng ở Hy Lạp và Rô-ma cổ đại là gì?', N'LS6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (92, N'Trắc nghiệm ', N'Một công trình kiến trúc khiến đời sau vô cùng than phục được xây dựng trên đồi A-crô-pôn ở A-ten (Hy Lạp) đó là', N'LS6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (93, N'Trắc nghiệm ', N'Để tính thời gian, cư dân phương Đông cổ đại đã sáng tạo ra', N'LS6', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (94, N'Trắc nghiệm ', N'Các Kim Tự Tháp ở Ai Cập được xây dựng nhằm mục đích nào sau đây?', N'LS6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (95, N'Trắc nghiệm ', N'Điều kiện tự nhiên của các quốc gia cổ đại phương Đông thuận lợi cho sự phát triển của:', N'LS6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (96, N'Trắc nghiệm ', N'Quốc gia Trung Quốc cổ đại đầu tiên hình thành bên bờ hai con sông nào?', N'LS6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (97, N'Trắc nghiệm ', N'Chủ nô và nô lệ là giai cấp chính của', N'LS6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (98, N'Trắc nghiệm ', N'Lực lượng lao động chính trong xã hội cổ đại phương Tây là', N'LS6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (99, N'Trắc nghiệm ', N'Ngành sản xuất nào phát triển sớm và mạnh nhất khu vực Địa Trung Hải?', N'LS6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (100, N'Trắc nghiệm ', N'Ở quốc gia cổ đại phương Tây, giai cấp chủ nô sống sung sướng, nhàn hạ dựa trên?', N'LS6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (101, N'Trắc nghiệm ', N'Hai giai cấp cơ bản trong xã hội cổ đại Hy Lạp và Rô-ma là', N'LS6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (102, N'Trắc nghiệm ', N'Ngọn hải đăng Alexandria là thành tựu văn hóa của', N'LS6', 2, NULL)
GO
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (103, N'Trắc nghiệm ', N'Một công trình kiến trúc khiến đời sau vô cùng than phục được xây dựng trên đồi A-crô-pôn ở A-ten (Hy Lạp) đó là', N'LS6', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (104, N'Trắc nghiệm ', N'Nhân vật chính trong truyện “Chuyện người con gái Nam Xương” là ai?', N'NV', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (105, N'Trắc nghiệm ', N'Nhận định nào nói đúng nhất tư tưởng, cảm xúc chủ đạo của tác giả trong văn bản “Chuyện cũ trong phủ chúa Trịnh”?', N'NV', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (106, N'Trắc nghiệm ', N'Đoạn trich “Chị em Thúy Kiều” nói về những nhân vật nào?', N'NV', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (107, N'Trắc nghiệm ', N'Hồi thứ 14 trong “Hoàng Lê nhất thống chí” tái hiện sự việc gì?', N'NV', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (108, N'Trắc nghiệm ', N'Đoạn trích “Kiều ở lầu Ngưng Bích” tiêu biểu cho bút pháp nghệ thuật nào của Nguyễn Du?', N'NV', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (109, N'Trắc nghiệm ', N'Hình ảnh Lục Vân Tiên cứu Kiều Nguyệt Nga được khắc họa giống với motip nào trong truyện cổ tích?', N'NV', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (110, N'Trắc nghiệm ', N'Dòng nào sắp xếp đúng trình tự diễn biến của các sự việc trong “Truyện Kiều” ?', N'NV', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (111, N'Trắc nghiệm ', N'Hình ảnh chiếc bóng trong “Chuyện người con gái Nam Xương” giữ vai trò gì trong câu chuyện?', N'NV', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (112, N'Trắc nghiệm ', N'Truyện Kiều có :', N'NV', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (113, N'Trắc nghiệm ', N'Nhận định nào sau đây đúng nhất về nội dung đoạn trích “Kiều ở lầu Ngưng Bích”?', N'NV', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (114, N'Trắc nghiệm ', N'Trong tác phẩm “Hoàng Lê thống nhất chí”, vì sao tác giả vốn là quan trung thành với nhà Lê nhưng vẫn viết rất chân thực và hay về Quang Trung – “kẻ thù” của họ?', N'NV', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (115, N'Trắc nghiệm ', N'Nội dung chính của đoạn trích “Cảnh ngày xuân” là gì?', N'NV', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (116, N'Trắc nghiệm ', N'Tên tác phẩm “Hoàng Lê nhất thống chí” có nghĩa là gì?', N'NV', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (117, N'Trắc nghiệm ', N'Theo em vì sao tác giả Nguyễn Du lại miêu tả vẻ đẹp của Thúy Vân trước, vẻ đẹp của Thúy Kiều sau?', N'NV', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (118, N'Trắc nghiệm ', N'Dòng nào nhận định không đúng về tác phẩm “Truyền kì mạn lục”', N'NV', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (119, N'Trắc nghiệm ', N'Em hiểu câu thơ :

   “Nhớ câu kiến nghĩa bất vi

   Làm người thế ấy cũng phi anh hùng”', N'NV', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (120, N'Trắc nghiệm ', N'Đoạn trích “Kiều ở lầu Ngưng Bích” đã nói lên bao nỗi nhớ và buồn thương của Thúy Kiều. Đó là nỗi buồn thương nhớ ai?', N'NV', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (121, N'Trắc nghiệm ', N'Lí do chính khiến Vũ Nương không trở về đoàn tụ với gia đình mặc dù đã được giải oan là?', N'NV', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (122, N'Trắc nghiệm ', N'Chuyện cũ trong phủ chúa Trịnh” được viết theo thể loại nào?', N'NV', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (123, N'Trắc nghiệm ', N'Nhận định nào nói đúng và đầy đủ ý nghĩa của chi tiết Vũ Nương gieo mình xuống sông tự vẫn?', N'NV', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (124, N'Trắc nghiệm ', N'Tiền chất của vitamin A chứa nhiều trong loại quả nào dưới đây ?', N'SH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (125, N'Trắc nghiệm ', N'Thiếu loại vitamin nào dưới đây sẽ dẫn đến chứng tê phù, viêm dây thần kinh ?', N'SH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (126, N'Trắc nghiệm ', N'Vai trò chủ yếu của nguyên tố sắt trong cơ thể người là gì ?', N'SH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (127, N'Trắc nghiệm ', N'Với cùng một trọng lượng thì khi ôxi hoá hoàn toàn, chất nào dưới đây giải phóng ra nhiều năng lượng nhất ?', N'SH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (128, N'Trắc nghiệm ', N'Trong hệ bài tiết nước tiểu, cơ quan nào dưới đây tồn tại thành cặp ?', N'SH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (129, N'Trắc nghiệm ', N'Cơ quan quan trọng nhất của hệ bài tiết nước tiểu là', N'SH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (130, N'Trắc nghiệm ', N'Thói quen nào dưới đây có thể gây bệnh sỏi thận ?', N'SH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (131, N'Trắc nghiệm ', N'Người trưởng thành, mỗi ngày hệ bài tiết nước tiểu bài xuất ra khoảng bao nhiêu lít nước tiểu chính thức ?', N'SH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (132, N'Trắc nghiệm ', N'Các hạt sắc tố tồn tại ở lớp nào trong cấu tạo da ?', N'SH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (133, N'Trắc nghiệm  ', N'Chọn số liệu thích hợp để điền vào chỗ trống trong câu sau : Da sạch có khả năng diệt tới … số vi khuẩn bám trên da.', N'SH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (134, N'Trắc nghiệm  ', N'Loại vitamin nào dưới đây cần cho sự phát dục bình thường ?', N'SH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (135, N'Trắc nghiệm  ', N'Thiếu vitamin nào dưới đây sẽ gây bệnh thiếu máu ?', N'SH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (136, N'Trắc nghiệm  ', N'Loại muối khoáng nào dưới đây có nhiều trong sữa, trứng và rau xanh ?', N'SH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (137, N'Trắc nghiệm  ', N'Chọn từ thích hợp để điền vào chỗ trống trong câu sau : Nếu lạm dụng ... một cách thường xuyên thì sẽ dẫn tới thiếu hụt vitamin B1.', N'SH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (138, N'Trắc nghiệm  ', N'Bệnh béo phì ở trẻ nhỏ có thể phát sinh từ nguyên nhân nào dưới đây ?', N'SH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (139, N'Trắc nghiệm  ', N'Cơ quan nào dưới đây tham gia vào hoạt động bài tiết ?', N'SH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (140, N'Trắc nghiệm', N'Đâu không phải là một trong những sản phẩm của hoạt động bài tiết ở người ?', N'SH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (141, N'Trắc nghiệm', N'Quá trình bài xuất nước tiểu ra khỏi cơ thể được thực hiện nhờ hoạt động của nhóm cơ nào dưới đây ?', N'SH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (142, N'Trắc nghiệm', N'Thành phần nào dưới đây không thuộc lớp bì của da ?', N'SH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (143, N'Trắc nghiệm', N'Để bảo vệ da khỏi tác động của tia cực tím, chúng ta nên áp dụng biện pháp nào sau đây ?', N'SH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (144, N'Trắc nghiệm', N'Chọn câu trả lời sai', N'TH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (145, N'Trắc nghiệm', N'Chọn câu trả lời đúng', N'TH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (146, N'Trắc nghiệm', N'Giá trị của biểu thức 1/3 x2y2-3xy tại x = 1,y = -3 là:', N'TH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (147, N'Trắc nghiệm', N'Cho đơn thức A = x2y3z. Khẳng định nào sau đây sai?', N'TH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (148, N'Trắc nghiệm', N'Tìm a để bậc của đơn thức -2xayz bằng 4', N'TH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (149, N'Trắc nghiệm', N'Một hình chữ nhật có chiều dài là a(m), chiều rộng ngắn hơn chiều dài 3(m). Biểu thức biểu thị diện tích hình chữ nhật đó là:', N'TH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (150, N'Trắc nghiệm', N'Trong các khẳng định sau, khẳng định nào sai?', N'TH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (151, N'Trắc nghiệm', N'Bậc của đơn thức A = 3/4 (xy)2xy2 là:', N'TH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (152, N'Trắc nghiệm', N'Giá trị của biểu thức: x(x – y) + y(x – y) tại x = 4 và y = –5 là:', N'TH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (153, N'Trắc nghiệm', N'Chín đơn vị, hai phần nghìn được viết là:', N'TH', 1, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (154, N'Trắc nghiệm', N'3m 4mm = .......... m. Số thích hợp để viết vào chỗ chấm là:', N'TH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (155, N'Trắc nghiệm', N'Tìm chữ số x biết : 86,718 > 86,7x9', N'TH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (156, N'Trắc nghiệm', N'3 phút 20 giây = .......giây. Số viết vào chỗ chấm là:', N'TH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (157, N'Trắc nghiệm', N'Viết số thập phân thích hợp vào chỗ chấm:', N'TH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (158, N'Trắc nghiệm', N'Số lớn nhất trong các số 39,402; 39,204; 40,392; 40,293 là:', N'TH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (159, N'Trắc nghiệm', N'Số thích hợp để điền vào chỗ chấm : 30g = ...kg là:', N'TH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (160, N'Trắc nghiệm', N'Chữ số 3 trong số 459,003 thuộc hàng:', N'TH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (161, N'Trắc nghiệm', N'Hiện nay cha hơn con 30 tuổi và gấp 7 lần tuổi con. Hỏi sau bao nhiêu năm nữa, tuổi cha gấp 3 lần tuổi con?', N'TH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (162, N'Trắc nghiệm', N'Một máy bay cứ 15phút bay được 240 km. Hỏi trong 1 giờ máy bay đó bay đ¬ược bao nhiêu ki-lô-met?', N'TH', 2, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [HinhThucCauHoi], [NoiDung], [MaMon], [DoKho], [Hinh]) VALUES (163, N'Trắc nghiệm', N'Tìm x, biết x là số tự nhiên và 28,64 < x < 29,46', N'TH', 2, NULL)
SET IDENTITY_INSERT [dbo].[CauHoi] OFF
SET IDENTITY_INSERT [dbo].[DapAn] ON 

INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (1, N'Gió', 1, 1)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (2, N'Sức hút của Trái Đất', 0, 1)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (3, N'Sức hút của mặt trăng', 0, 1)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (4, N'Sức hút của Mặt trăng và Mặt trời', 0, 1)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (5, N'Dòng sông chính và các chi lưu', 0, 2)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (6, N'Dòng sông chính, các phụ lưu và hạ lưu', 0, 2)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (7, N'Các phụ lưu và chi lưu', 1, 2)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (8, N'Các phụ lưu', 0, 2)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (9, N'Sông', 0, 3)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (10, N'Phụ lưu', 0, 3)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (11, N'Chi lưu', 0, 3)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (12, N'Nhánh sông', 1, 3)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (13, N' Chất hữu cơ.', 0, 4)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (14, N'Chất khoáng', 1, 4)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (15, N'Nước', 0, 4)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (16, N'Không khí', 0, 4)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (17, N'động đất ngầm dưới đáy biển', 1, 5)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (18, N'do sức hút cử Mặt Trăng và Mặt Trời.', 0, 5)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (19, N'sức hút của mặt Trăng.', 0, 5)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (20, N'Gió', 0, 5)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (21, N'Chi lưu', 1, 6)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (22, N'Sông', 0, 6)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (23, N'Nhánh sông', 0, 6)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (24, N'Phụ lưu', 0, 6)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (25, N'Hai tầng', 0, 7)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (26, N'Ba tầng', 1, 7)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (27, N'Bốn tầng', 0, 7)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (28, N'Năm tầng', 0, 7)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (29, N'33%', 0, 8)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (30, N'35%', 0, 8)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (31, N'41%', 1, 8)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (32, N'45%', 0, 8)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (33, N'35% toàn bộ khối nước', 0, 9)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (34, N'41% toàn bộ khối nước', 0, 9)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (35, N'71% toàn bộ khối nước.', 0, 9)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (36, N'97% toàn bộ khối nước', 1, 9)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (37, N'Giàu khoáng chất. ', 1, 10)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (38, N'Giàu nước', 0, 10)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (39, N'Độ phì cao', 0, 10)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (40, N'Đât cứng', 0, 10)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (41, N'Dòng sông', 0, 11)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (42, N'Mạng lưới sông', 0, 11)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (43, N'Hệ thống sông', 1, 11)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (44, N'Lưu vực sông', 0, 11)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (45, N'cung cấp vật chất hữu cơ cho đất', 0, 12)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (46, N'sinh ra các thành phần khoáng trong đất ', 0, 12)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (47, N'sinh ra các thành phần khoáng và thành phần hữu cơ trong đất', 0, 12)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (48, N'tác động đến quá trình phân giải các chất khoáng và chất hữu cơ trong đất', 1, 12)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (49, N'Thực vật', 0, 13)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (50, N'Khí hậu', 1, 13)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (51, N'Ánh sáng', 0, 13)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (52, N'Nguồn thức ăn', 0, 13)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (53, N'Không trang đầu tháng và trăng lưỡi liềm đầu tháng', 0, 14)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (54, N' Trăng tròn giữa tháng và không trang đầu tháng.', 0, 14)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (55, N'Trăng tròn giữa tháng và trăng lưỡi liềm đầu tháng', 0, 14)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (56, N'Trăng lưỡi liềm đầu tháng và trăng lưỡi liềm cuối tháng.', 1, 14)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (57, N'Đới nóng', 0, 15)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (58, N'Đới ôn hòa', 0, 15)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (59, N'Đới lạnh', 1, 15)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (60, N'Tất cả các đới', 0, 15)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (61, N' Chuyển động thành dòng của lớp nước biển trên mặt.', 1, 16)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (62, N'Dao động thường xuyên, có chu kì của nước biển.', 0, 16)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (63, N'Dao động của nước biển từ nhoài khơi xô vào bờ.', 0, 16)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (64, N'Dao động tại chổ của nước biển', 0, 16)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (65, N'Vùng Bắc Cực', 0, 17)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (66, N'Đòng bằng', 0, 17)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (67, N'Vùng núi', 0, 17)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (68, N'Hoang mạc', 1, 17)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (69, N'Dòng chảy.', 1, 18)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (70, N' Nguồn gốc tự nhiên', 0, 18)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (71, N' Lớn hay nhỏ.', 0, 18)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (72, N'Có lâu haymau.', 0, 18)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (73, N'Dòng biển nóng ', 1, 19)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (74, N'Dòng biển lạnh.', 0, 19)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (75, N' Dòng biển chảy mạnh.', 0, 19)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (76, N'Dòng biển chảy yếu', 0, 19)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (77, N'Chất đất', 0, 20)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (78, N'Lượng nước.', 0, 20)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (79, N'Ánh sáng', 0, 20)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (80, N'Khí hậu', 1, 20)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (81, N'Tỉ lệ gia tăng tự nhiên của dân số trung bình năm trên 2.1%.', 1, 21)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (82, N'Do tỉ lệ sinh cao, tỉ lệ tử cao.', 0, 21)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (83, N'Do chất lượng cuộc sống được nâng cao.', 0, 21)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (84, N'Do quá trình di dân xảy ra.', 0, 21)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (85, N'Trung Á.', 0, 22)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (86, N'Bắc Phi.', 1, 22)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (87, N'Nam Mĩ.', 0, 22)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (88, N'Ô-xtrây-li-a.', 0, 22)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (89, N'Dầu khí.', 1, 24)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (90, N'Than.', 0, 24)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (91, N'Thạch anh.', 0, 24)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (92, N'Sắt.', 0, 24)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (93, N'Ở đới lạnh.', 0, 23)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (94, N'Ở các hoang mạc ôn đới khô khan.', 0, 23)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (95, N'Ở rìa các hoang mạc đới nóng có mùa khô kéo dài.', 1, 23)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (96, N'Bên trong các hoang mạc đới nóng có nhiệt độ cao quanh năm.', 0, 23)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (97, N'Mưa theo mùa.', 0, 25)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (98, N'Rất giá lạnh.', 0, 25)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (99, N'Rất khô hạn.', 1, 25)
GO
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (100, N'Nắng nóng quanh năm.', 0, 25)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (101, N'Vòng cực đến cực.', 1, 26)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (102, N'Xích đạo đến chí tuyến.', 0, 26)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (103, N'Chí tuyến đến vòng cực.', 0, 26)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (104, N'50 B đến 50 N.', 0, 26)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (105, N'Ngủ đông.', 0, 27)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (106, N'Di cư để tránh rét.', 0, 27)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (107, N'Ra sức ra ngoài để kiếm ăn.', 1, 27)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (108, N'Sống thành bầy đàn để tránh rét.', 0, 27)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (109, N'Đất đai theo độ cao.', 0, 28)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (110, N'Khí áp theo độ cao.', 0, 28)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (111, N'Nhiệt độ và độ ẩm theo độ cao.', 1, 28)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (112, N'Lượng mưa theo độ cao.', 0, 28)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (113, N'5 lục địa, 6 châu lục.', 0, 29)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (114, N'6 lục địa, 6 châu lục.', 0, 29)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (115, N' 6 lục địa, 7 châu lục.', 1, 29)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (116, N'7 lục địa, 7 châu lục.', 0, 29)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (117, N'Cận nhiệt đới gió mùa.', 0, 32)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (118, N'Địa Trung Hải.', 0, 32)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (119, N'Ôn đới lục địa.', 0, 32)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (120, N'Ôn đới hải dương.', 1, 32)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (121, N'Nhiệt đới gió mùa.', 0, 34)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (122, N'Nhiệt đới.', 0, 34)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (123, N'Xích đạo ẩm.', 1, 34)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (124, N'Hoang mạc.', 0, 34)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (125, N'Nhiệt đới.', 1, 35)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (126, N'Xích đạo ẩm.', 0, 35)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (127, N'Hoang mạc.', 0, 35)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (128, N'Nhiệt đới gió mùa.', 0, 35)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (129, N'Tỉ lệ sinh cao, tỉ lệ tử cao.', 0, 36)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (130, N'Tỉ lệ sinh giảm, tỉ lệ tử giảm.', 0, 36)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (131, N'Tỉ lệ sinh cao, tỉ lệ tử giảm.', 1, 36)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (132, N'Tỉ lệ tử cao, tỉ lệ sinh giảm.', 0, 36)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (133, N'bàn tay.  ', 0, 37)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (134, N'màu da.   ', 1, 37)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (135, N'môi', 0, 37)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (136, N'lông mày.', 0, 37)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (137, N'Các đô thị đầu tiên mới xuất hiện vào thế kỉ XIX.', 0, 38)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (138, N'Dân cư tập trung vào các thành phố lớn và cực lớn.', 1, 38)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (139, N' Phổ biến các hoạt động sản xuất nông – lâm – ngư nghiệp.', 0, 38)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (140, N'Tỉ lệ người sống ở nông thôn ngày càng tăng.', 0, 38)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (141, N'Do nhiều loài cây sinh trưởng mạnh, chiếm hết diện tích của các loài còn lại.', 0, 39)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (142, N'Do đất trong rừng nghèo dinh dưỡng, thường xuyên bị rửa trôi.', 0, 39)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (143, N'Do mỗi loài cây thích hợp với điều kiện ánh sáng, nhiệt độ và độ ẩm khác nhau.', 1, 39)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (144, N'Do trong rừng không đủ nhiệt độ và độ ẩm cho cây cối sinh trưởng.', 0, 39)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (145, N'dễ bị xói mòn, rửa trôi hoặc thoái hóa.', 1, 40)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (146, N'đất ngập úng, glây hóa', 0, 40)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (147, N'đất bị nhiễm phèn nặng.', 0, 40)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (148, N'nghèo mùn, ít chất dinh dưỡng.', 0, 40)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (149, N'Môi trường xích đạo ẩm', 0, 41)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (150, N'Môi trường nhiệt đới gió mùa', 1, 41)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (151, N'Môi trường nhiệt đới', 0, 41)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (152, N' Môi trường ôn đới', 0, 41)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (153, N'rừng lá rộng, rừng lá kim, rừng hỗn giao.', 0, 42)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (154, N' rừng lá rộng, rừng hỗn giao, rừng lá kim.', 1, 42)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (155, N'rừng lá kim, rừng hỗn giao, rừng lá rộng.', 0, 42)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (156, N'rừng lá kim, rừng hỗn giao, rừng cây bụi gai.', 0, 42)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (157, N'nguồn gây ô nhiễm môi trường nghiêm trọng.', 1, 43)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (158, N' làm cạn kiệt nguồn tài nguyên thiên nhiên.', 0, 43)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (159, N'làm thu hẹp diện tích đất sản xuất nông nghiệp.', 0, 43)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (160, N' làm mất đi nhiều cảnh quan tự nhiên.', 0, 43)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (161, N'Địa hình tường đối bằng phẳng, ít bị chia cắt.', 1, 44)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (162, N'Các núi và sơn nguyên cao chủ yếu tập trung ở trung tâm.', 0, 44)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (163, N'Có nhiều hệ thống núi, sơn nguyên cao, đồ sộ.', 0, 44)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (164, N'Có nhiều đồng bằng rộng bậc nhất thế giới.', 0, 44)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (165, N'khí hậu lục địa và khí hậu núi cao  ', 0, 45)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (166, N'khí hậu gió mùa và khí hậu núi cao', 0, 45)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (167, N' khí hậu gió mùa và khí hậu lục địa ', 1, 45)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (168, N'khí hậu hải dương và khí hậu lục địa', 0, 45)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (169, N' Trung xi-bia ', 0, 46)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (170, N'Đông Á    ', 1, 46)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (171, N'Tây Xi-bia', 0, 46)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (172, N'Đông Xi-bia', 0, 46)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (173, N'Từ áp cao Xi bia đến áp thấp A lê út', 1, 47)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (174, N'Từ áp cao Xi bia đến áp thấp Ô xtrây li a', 0, 47)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (175, N'Tứ áp cao Ha oai đến áp thấp I ran', 0, 47)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (176, N'Từ áp cao Xi bia đến áp thấp Xích đạo', 0, 47)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (177, N'Tây Nam Á', 1, 48)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (178, N'Bắc Á', 0, 48)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (179, N'Đông Á   ', 0, 48)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (180, N'Đông Nam Á', 0, 48)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (181, N'Gia cac ta ', 0, 49)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (182, N'Thượng Hải', 0, 49)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (183, N'Tê hê ran', 1, 49)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (184, N'Niu đê li', 0, 49)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (185, N'Bắc Á', 0, 50)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (186, N'Đông Nam Á', 0, 50)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (187, N'Nam Á ', 0, 50)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (188, N'Tây Nam Á', 1, 50)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (189, N'Nam Á', 1, 51)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (190, N'Bắc Á', 0, 51)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (191, N'Đông Á', 0, 51)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (192, N'Trung Á', 0, 51)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (193, N'Ôbi, Iênitxây, Lêna', 0, 52)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (194, N'Hồng, Amua, Cửu Long', 0, 52)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (195, N'Hoàng Hà, Trường Giang, Mê Công', 0, 52)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (196, N'Ấn, Hằng, Tigrơ – Ơphrát', 1, 52)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (197, N'Tây Bắc', 0, 53)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (198, N' Đông Nam      ', 0, 53)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (199, N'Tây Nam', 1, 53)
GO
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (200, N' Đông Bắc', 0, 53)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (201, N'Đứng đầu. ', 1, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (202, N'Đứng thứ hai. ', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (203, N'Đứng thứ ba.', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (204, N'Đứng thứ tư', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (205, N'Trung Quốc', 0, 55)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (206, N'Ấn Độ', 1, 55)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (207, N'Liên Bang Nga', 0, 55)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (208, N'Nhật Bản', 0, 55)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (209, N'Đại Tây Dương.', 1, 56)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (210, N'Ấn Độ Dương.', 0, 56)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (211, N'Thái Bình Dương.', 0, 56)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (212, N'Bắc Băng Dương.', 0, 56)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (213, N'Đông Nam Á ', 0, 57)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (214, N'Đông Á', 1, 57)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (215, N'Tây Á   ', 0, 57)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (216, N' Nam Á', 0, 57)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (217, N'Tây bắc – đông nam', 0, 58)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (218, N' vòng cung ', 0, 58)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (219, N'Tây – Đông     ', 0, 58)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (220, N' Bắc - Nam', 1, 58)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (221, N' I-Rap ', 0, 59)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (222, N'A-rập-xê-út', 1, 59)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (223, N'Ấn Độ ', 0, 59)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (224, N'I – Ran', 0, 59)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (225, N'Trung Quốc ', 1, 60)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (226, N'Ấn Độ  ', 0, 60)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (227, N' Nhật Bản', 0, 60)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (228, N'Hàn Quốc.', 0, 60)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (229, N'Tây Bắc  ', 0, 61)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (230, N'Đông Nam  ', 0, 61)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (231, N'Tây Nam', 0, 61)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (232, N'Đông Bắc', 1, 61)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (233, N'Đồng bằng Tu-ran', 0, 62)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (234, N'Đồng bằng Ấn - Hằng', 0, 62)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (235, N'Đồng bằng Lưỡng Hà', 0, 62)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (236, N' Đồng bằng sông Nin', 1, 62)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (237, N' Tây Nam ', 0, 63)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (238, N'Đông Bắc ', 1, 63)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (239, N' Tây Bắc', 0, 63)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (240, N'Đông Nam', 0, 63)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (241, N'hoang mạc và bán hoang mạc', 1, 64)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (242, N'xavan và cây bụi', 0, 64)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (243, N'rừng và cây bụi lá cứng địa trung hải', 0, 64)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (244, N'rừng lá kim', 0, 64)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (245, N'1 trung tâm áp cao và 4 trung tâm áp thấp', 0, 65)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (246, N'2 trung tâm áp cao và 3 trung tâm áp thấp', 0, 65)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (247, N'3 trung tâm áp cao và 2 trung tâm áp thấp', 0, 65)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (248, N'4 trung tâm áp cao và 1 trung tâm áp thấp', 1, 65)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (249, N'Ki tô giáo.', 0, NULL)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (250, N'Phật giáo.   ', 1, NULL)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (251, N'Bà La Môn', 0, NULL)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (252, N'Bà La Môn', NULL, NULL)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (253, N'Đứng đầu.', 1, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (254, N'Đứng thứ hai. ', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (255, N' Đứng thứ ba. ', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (256, N'Đứng thứ tư', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (257, N'Trung Quốc', 0, 55)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (258, N'Ấn Độ', 1, 55)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (259, N'Liên Bang Nga', 0, 55)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (260, N'Nhật Bản', 0, 55)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (261, N'Đại Tây Dương.', 1, 56)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (262, N'Ấn Độ Dương.', 0, 56)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (263, N'Thái Bình Dương.', 0, 56)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (264, N'Bắc Băng Dương.', 0, 56)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (265, N'Đông Nam Á ', 0, 57)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (266, N'Đông Á', 1, 57)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (267, N'Tây Á', 0, 57)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (268, N'Nam Á', 0, 57)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (269, N'Tây bắc – đông nam', 0, 58)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (270, N' vòng cung', 1, 58)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (271, N'Tây – Đông', 0, 58)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (272, N'Bắc - Nam', 0, 58)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (273, N'I-Rap ', 0, 59)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (274, N'Ấn Độ', 0, 59)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (275, N'A-rập-xê-út', 1, 59)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (276, N'I – Ran', 0, 59)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (277, N'Trung Quốc', 1, 60)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (278, N'Ấn Độ', 0, 60)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (279, N'Nhật Bản', 0, 60)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (280, N'Hàn Quốc', 0, 60)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (281, N'Tây Bắc', 0, 61)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (282, N'Đông Nam', 0, 61)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (283, N'Tây Nam', 0, 61)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (284, N'Đông Bắc', 1, 61)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (285, N'Đồng bằng Tu-ran', 0, 62)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (286, N'Đồng bằng Ấn - Hằng', 0, 62)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (287, N'Đồng bằng Lưỡng Hà', 0, 62)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (288, N'Đồng bằng sông Nin', 1, 62)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (289, N'Tây Nam', 0, 63)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (290, N'Đông Bắc', 1, 63)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (291, N'Tây Bắc  ', 0, 63)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (292, N'Đông Nam', 0, 63)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (293, N'hoang mạc và bán hoang mạc', 1, 64)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (294, N'xavan và cây bụi', 0, 64)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (295, N'rừng và cây bụi lá cứng địa trung hải', 0, 64)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (296, N'rừng lá kim', 0, 64)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (297, N'1 trung tâm áp cao và 4 trung tâm áp thấp', 0, 65)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (298, N'2 trung tâm áp cao và 3 trung tâm áp thấp', 0, 65)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (299, N'3 trung tâm áp cao và 2 trung tâm áp thấp', 0, 65)
GO
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (300, N'4 trung tâm áp cao và 1 trung tâm áp thấp', 1, 65)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (301, N'Ki tô giáo. ', 0, 66)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (302, N'Phật giáo.', 1, 66)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (303, N'Bà La Môn.   ', 0, 66)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (304, N'Hồi giáo.', 0, 66)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (305, N'Có khí hậu giá lạnh khắc nghiệt, băng tuyết bao phủ', 0, 67)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (306, N'Có đất màu mỡ, phát triển nông nghiệp trù phú', 0, 67)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (307, N'Nơi có địa hình hiểm trở, thuận lợi phát triển kinh tế và sản xuất', 0, 67)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (308, N'Có khí hậu khô, địa hình nhiều núi trở ngại cho cư trú và sản xuất', 1, 67)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (309, N'vùng Xích đạo', 1, 68)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (310, N'chí tuyến Bắc', 0, 68)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (311, N'chí tuyến Nam ', 0, 68)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (312, N'vòng cực Bắc', 0, 68)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (313, N'lãnh thổ rất rộng lớn', 0, 69)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (314, N'có nhiều núi và sơn nguyên', 0, 69)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (315, N'lãnh thổ trải dài từ Cực đến xích đạo', 1, 69)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (316, N'có nhiều dãy núi cao', 0, 69)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (317, N'Đông Nam Á và Tây Nam Á', 0, 70)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (318, N'Trung Á và Đông Á', 0, 70)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (319, N'Đông Á và Nam Á', 0, 70)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (320, N'Tây Nam Á và Trung Á', 1, 70)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (321, N'Tây Nam  ', 1, 71)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (322, N'Đông Bắc ', 0, 71)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (323, N'Tây Bắc', 0, 71)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (324, N'Đông Nam', 0, 71)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (325, N'Pa-let-tin  ', 0, 72)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (326, N'Trung Quốc', 0, 72)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (327, N'A-rập-xê-út', 1, 72)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (328, N'Ấn Độ', 0, 72)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (329, N'A-rập-xê-út', 0, 73)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (330, N'Trung Quốc ', 1, 73)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (331, N'Ấn Độ', 0, 73)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (332, N'Pa-ki-xtan', 0, 73)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (333, N'Nhật Bản, Brunây, Trung Quốc', 0, 74)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (334, N'Hàn Quốc, Đài Loan, Xingapo', 0, 74)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (335, N'Trung Quốc, Ấn Độ, Malayxia', 1, 74)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (336, N'Miama, Thái Lan, Campuchia', 0, 74)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (337, N'chủ yếu phát triển công nghiệp sản xuất hàng tiêu dùng.', 1, 75)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (338, N'chủ yếu phát triển công nghiệp khai khoáng.', 0, 75)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (339, N'chủ yếu phát triển công nghiệp luyện kim, cơ khí chế tạo.', 0, 75)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (340, N'rất đa dạng nhưng phát triển chưa đều.', 0, 75)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (341, N'Trường Giang, Mê Công.', 0, 76)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (342, N'A-mua, Mê Công.', 0, 76)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (343, N'Hoàng Hà, Trường Giang.', 1, 76)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (344, N'A-mua, Trường Giang.', 0, 76)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (345, N'Sông Hậu ', 0, 77)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (346, N'Sông Tiền ', 0, 77)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (347, N'Sông Cửu Long', 1, 77)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (348, N'Sông Sài Gòn', 0, 77)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (349, N'Đồng bằng sông Cửu Long.', 1, 78)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (350, N' Đồng bằng sông Hồng.', 0, 78)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (351, N'Đồng bằng Thanh – Nghệ - Tĩnh.', 0, 78)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (352, N'Đồng bằng Nam Trung Bộ.', 0, 78)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (353, N'Tràm, hạt dẻ', 0, 79)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (354, N'Vạn tuế, phong lan', 0, 79)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (355, N'Nhân trần, ngải cứu', 0, 79)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (356, N'Mây, trúc, giang', 1, 79)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (357, N'Cả nước', 0, 80)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (358, N'Miền Bắc ', 1, 80)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (359, N'Miền Nam ', 0, 80)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (360, N'Miền Trung', 0, 80)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (361, N'mùa lũ đến sớm hơn miền Bắc và Đông Bắc Bắc Bộ', 0, 81)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (362, N'nhiệt độ trung bình năm thấp hơn miền Bắc và Đông Bắc Bắc Bộ', 0, 81)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (363, N' mùa hạ chịu ảnh hưởng của gió phơn tây nam khô nóng', 0, 81)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (364, N'mùa đông đến sớm và kết thúc muộn', 1, 81)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (365, N'Một vùng bán bình nguyên chuyển tiếp', 0, 82)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (366, N'Một vùng hạ lưu sông rộng lớn', 0, 82)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (367, N'Một vùng sụt võng rộng lớn', 1, 82)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (368, N'Một vùng đồng bằng rộng lớn', 0, 82)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (369, N'Đứng đầu.   ', 1, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (370, N'Đứng thứ hai. ', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (371, N'Đứng thứ ba. ', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (372, N'Đứng thứ tư', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (373, N'Pha-ra-ông.', 1, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (374, N'Thiên tử.', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (375, N'Ensi.', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (376, N'Thượng hoàng', 0, 54)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (377, N'Liên minh các thị tộc.', 0, 84)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (378, N'Liên minh các bầy người nguyên thủy.', 0, 84)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (379, N'Liên minh các công xã nông thôn.', 0, 84)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (380, N' Liên minh các bộ lạc.', 1, 84)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (381, N'Người đứng đầu.', 1, 86)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (382, N'Người thay trời.', 0, 86)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (383, N'Người trị vì', 0, 86)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (384, N'Con trời.', 0, 86)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (385, N'Liên minh các thị tộc.', 0, 85)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (386, N'Liên minh các bầy người nguyên thủy.', 0, 85)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (387, N'Liên minh các công xã nông thôn.', 0, 85)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (388, N'Liên minh các bộ lạc.', 1, 85)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (389, N'Người Su-me.', 1, 87)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (390, N'Người Ang-glo Sác-xông.', 0, 87)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (391, N'Người May a.', 0, 87)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (392, N'Người Môn -khơme.', 0, 87)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (393, N'Có nhiều hải cảng tốt.', 0, 88)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (394, N'Ở vào vị trí địa lý thuận lợi cho việc giao thương.', 0, 88)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (395, N'Sản phẩm và hàng hóa làm ra nhiều.', 0, 88)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (396, N'Có nhiều con sông lớn.', 1, 88)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (397, N'Khoảng thiên niên kỷ IV TCN.', 0, 89)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (398, N'Khoảng thiên niên kỷ III TCN.', 0, 89)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (399, N'Khoảng thiên niên kỷ II TCN.', 0, 89)
GO
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (400, N'Khoảng thiên niên kỷ I TCN.', 1, 89)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (401, N' Lưỡng Hà.', 0, 90)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (402, N'Ai Cập.', 0, 90)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (403, N'Rô-ma.', 1, 90)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (404, N'Hy Lạp.', 0, 90)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (405, N'Chế tạo trang sức, làm giấy, làm lụa tơ tằm.', 0, 91)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (406, N'Lụa tơ tằm, vải sợi, đồ gốm, đồ mỹ nghệ.', 0, 91)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (407, N'Chế tác đá quý, làm giấy, làm chiếu, làm gốm.', 0, 91)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (408, N'Luyện kim, đồ mỹ nghệ, đồ gốm, nấu rượu nho, dầu ô liu.', 1, 91)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (409, N'Đền Pác-tê-nông.', 1, 92)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (410, N'Tượng thần vệ nữ.', 0, 92)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (411, N'Tượng lực sĩ ném đĩa.', 0, 92)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (412, N'Ngọn hải đăng Alexandria.', 0, 92)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (413, N'Đồng hồ cát.', 0, 93)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (414, N'Đồng hồ bằng pin.', 0, 93)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (415, N'Lịch vạn niên.', 0, 93)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (416, N'Đồng hồ đo thời gian.', 1, 93)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (417, N'Làm nơi để ghi danh những người đã tử nạn trong các cuộc chiến tranh mở rộng lãnh thổ.', 0, 94)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (418, N'Làm nơi an dưỡng, nghỉ ngơi của các Pha-ra-ông khi tuổi cao và sức yếu.', 0, 94)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (419, N'Làm lăng mộ chôn cất thi hài của Pha-ra-ông.', 1, 94)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (420, N'Làm đền thờ các thần thánh mà người Ai Cập tôn kính.', 0, 94)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (421, N'Nông nghiệp.', 1, 95)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (422, N'Chăn nuôi.', 0, 95)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (423, N'Ngoại thương.', 0, 95)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (424, N'Thủ công nghiệp.', 0, 95)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (425, N'Sông Hồng và sông Trường Giang.', 0, 96)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (426, N'Sông Hằng và sông Hoàng Hà.', 0, 96)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (427, N'Sông Nin và sông A-ma-zôn.', 0, 96)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (428, N'Sông Hoàng Hà và sông Trường Giang', 1, 96)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (429, N'xã hội tư bản chủ nghĩa.', 0, 97)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (430, N'xã hội nguyên thủy.', 0, 97)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (431, N'xã hội phong kiến.', 0, 97)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (432, N'xã hội chiếm hữu nô lệ.', 1, 97)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (433, N'nô lệ.', 1, 98)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (434, N'nông dân.', 0, 98)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (435, N'nông nô.', 0, 98)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (436, N'thợ thủ công.', 0, 98)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (437, N' Nông nghiệp.', 0, 99)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (438, N'Thương nghiệp.', 1, 99)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (439, N'Thủ công nghiệp.', 0, 99)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (440, N'Công nghiệp.', 0, 99)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (441, N'Sự đóng góp góp của các tầng lớp nhân dân.', 0, 100)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (442, N'Thành quả lao động do chủ nô làm ra.', 0, 100)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (443, N'Từ nguồn thu thuế.', 0, 100)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (444, N'Sự bóc lột sức lao động của nô lệ.', 1, 100)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (445, N' địa chủ và nông dân.', 0, 101)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (446, N' chủ nô và nông nô.', 0, 101)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (447, N' chủ nô và nô lệ.', 1, 101)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (448, N' quý tộc và nông dân.', 0, 101)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (449, N'Hi Lạp', 0, 102)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (450, N'Rô-ma.', 0, 102)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (451, N'Lưỡng Hà.', 0, 102)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (452, N'Ai Cập.', 1, 102)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (453, N'Đền Pác-tê-nông.', 1, 103)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (454, N'Tượng thần vệ nữ.', 0, 103)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (455, N'Tượng lực sĩ ném đĩa.', 0, 103)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (456, N'Ngọn hải đăng Alexandria.', 0, 103)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (457, N'Trương Sinh và Phan Lang', 0, 104)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (458, N'Phan Lang và Linh Phi', 0, 104)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (459, N'Vũ Nương và Trương Sinh', 1, 104)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (460, N'Linh Phi và mẹ Trương Sinh', 0, 104)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (461, N'Phê phán thói ăn chơi xa xỉ của bọn vua chúa đương thời.', 0, 105)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (462, N'Phê phán tệ nhũng nhiễu nhân dân của lũ quan lại hầu cần vua chúa.', 0, 105)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (463, N'Thể hiện lòng thương cảm đối với nhân dân của tác giả.', 0, 105)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (464, N'Cả A,B,C đều đúng.', 1, 105)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (465, N'Thúy Kiều và Kim Trọng', 0, 106)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (466, N'Thúy Kiều và Vương Quan', 0, 106)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (467, N'Thúy Kiều và Từ Hải ', 0, 106)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (468, N'Thúy Kiều và Thúy Vân', 1, 106)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (469, N'Chiến thắng của vua Lê và sự thảm hại của quân Thanh.', 0, 107)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (470, N'Chiến thắng của vua Quang Trung.', 0, 107)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (471, N'Chiến công của vua Quang Trung và sự thảm bại của quân Thanh cùng số phận bi đát của bọn thống trị nhà Lê.', 1, 107)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (472, N'Sự thống nhất của vua Lê.', 0, 107)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (473, N'Nghệ thuật tả cảnh', 0, 108)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (474, N'Nghệ thuật miêu tả ngoại hình.', 0, 108)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (475, N'Nghệ thuật tả cảnh ngụ tình.', 1, 108)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (476, N'Nghệ thuật tả người.', 0, 108)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (477, N'Một chàng trai tài giỏi, cứu một cô gái thoát khỏi cảnh nguy hiểm, họ trả nghĩa nhau và trở thành vợ chồng.', 1, 109)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (478, N'Một anh nông dân nghèo nhờ chăm chỉ đã lấy được vợ đẹp và trở nên giàu có.', 0, 109)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (479, N'Một ông vua mang hạnh phúc đến cho một người đau khổ.', 0, 109)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (480, N'Những con người ăn ở hiền lành, thật thà, phúc đức sẽ được đền đáp xứng đáng.', 0, 109)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (481, N'Gặp gỡ và đính ước – Đoàn tụ - Gia biến và lưu lạc', 0, 110)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (482, N'Gặp gỡ và đính ước – Gia biến và lưu lạc – Đoàn tụ', 1, 110)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (483, N'Gia biến và lưu lạc – Đoàn tụ - Gặp gỡ và đính ước', 0, 110)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (484, N'Gia biến và lưu lạc – Gặp gỡ và đính ước – Đoàn tụ', 0, 110)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (485, N'Làm câu chuyện hấp dẫn', 0, 111)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (486, N'Thắt nút, mở nút câu chuyện', 1, 111)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (487, N' Là yếu tố truyền kì', 0, 111)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (488, N'Thể hiện tính cách nhân vật', 0, 111)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (489, N'2354 câu thơ lục bát.', 0, 112)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (490, N'3254 câu thơ lục bát.', 1, 112)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (491, N'4253 câu thơ lục bát. ', 0, 112)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (492, N'5324 câu thơ lục bát.', 0, 112)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (493, N'Niềm thương nhớ và nỗi đau đớn xót xa.', 0, 113)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (494, N'Nỗi cô đơn, buồn thương da diết.', 0, 113)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (495, N'Nỗi xót xa cho thân phận nàng Kiều.', 0, 113)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (496, N'Cảnh ngộ cô đơn buồn tủi, tấm lòng thủy chung, hiếu thảo.', 1, 113)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (497, N'Vì họ tôn trọng lịch sử. ', 0, 114)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (498, N'Vì học có ý thức dân tộc.', 0, 114)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (499, N'Vì họ luôn ủng hộ kẻ mạnh.', 0, 114)
GO
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (500, N'Cả A và B đều đúng.', 1, 114)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (501, N'Tả lại vẻ đẹp của chị em Thúy Kiều.', 0, 115)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (502, N'Tả lại cảnh chị em Thúy Kiều đi chơi xuân.', 1, 115)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (503, N'Tả cảnh mọi người đi lễ hội trong tiết than h minh.', 0, 115)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (504, N'Tả lại cảnh thiên nhiên mùa xuân rực rỡ.', 0, 115)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (505, N'Vua Lê nhất định thống nhất đất nước.', 0, 116)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (506, N'Ý chí thống nhất đất nước của vua Lê.', 0, 116)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (507, N'Ghi chép việc vua Lê thống nhất đất nước.', 1, 116)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (508, N'Ý chí trước sau như một của vua Lê.', 0, 116)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (509, N'Vì Thúy Vân không phải là nhân vật chính.', 0, 117)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (510, N'Vì Thúy Vân đẹp hơn Thúy Kiều', 0, 117)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (511, N'Vì tác giả muốn làm nổi bật vẻ đẹp của Thúy Kiều', 1, 117)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (512, N'Vì tác giả muốn đề cao Thúy Vân.', 0, 117)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (513, N'Là tác phẩm viết bằng chữ Nôm.', 1, 118)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (514, N'Khai thác các truyện cổ dân gian và các truyền thuyết lịch sử của Việt Nam', 0, 118)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (515, N'Có tất cả 20 truyện.', 0, 118)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (516, N'Nhân vật chính thường là những người phụ nữ đức hạnh nhưng gặp nhiều oan khuất, bất hạnh.', 0, 118)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (517, N'Phải viết quý trọng ơn nghĩa', 0, 119)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (518, N'Cuộc sống trong sạch, tự do, ngoài vòng danh lợi.', 0, 119)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (519, N'Cuộc sống nhỏ nhen, mưu danh, trục lợi.', 0, 119)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (520, N'Thấy việc nghĩa không làm thì không phải là người anh hùng.', 1, 119)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (521, N'Nhớ hai em.  ', 0, 120)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (522, N'Nhớ cha mẹ và Kim Trọng.', 1, 120)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (523, N'Nhớ quê nhà. ', 0, 120)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (524, N'Nhớ về tuổi thơ vui vẻ, hạnh phúc.', 0, 120)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (525, N'Vì cảm ơn đức của Linh Phi.', 0, 121)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (526, N' Vì còn tức giận Trương Sinh.', 0, 121)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (527, N'Vì chế độ phong kiến đương thời không dung nạp được những người đức hạnh như nàng. ', 0, 121)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (528, N'Cả A và C đều đúng.', 1, 121)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (529, N'Tiểu thuyết chương hồi', 0, 122)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (530, N'Tùy bút', 1, 122)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (531, N'Truyền kì', 0, 122)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (532, N'Truyện ngắn', 0, 122)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (533, N'Phản ánh chân thực cuộc sống đầy oan khuất và khổ đau của người phụ nữ trong xã hội phong kiến.', 0, 123)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (534, N'Bày tỏ niềm thương cảm của tác giả trước số phận mỏng manh và bi thảm của người phụ nữ trong xã hội phong kiến.', 0, 123)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (535, N'Tố cáo xã hội phụ quyền phong kiến đã chà đạp lên quyền sống của con người nhất là người pụ nữ.', 0, 123)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (536, N' Cả A,B,C đều đúng.', 1, 123)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (537, N'Gấc', 1, 124)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (538, N'Roi', 0, 124)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (539, N' Táo ta', 0, 124)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (540, N'Đào lộn hột', 0, 124)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (541, N'Vitamin B12', 0, 125)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (542, N'Vitamin B6', 0, 125)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (543, N'Vitamin B2', 0, 125)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (544, N'Vitamin B1', 1, 125)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (545, N'Là thành phần cấu tạo nên xương và răng', 0, 126)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (546, N'Là thành phần không thể thiếu của hoocmôn tuyến giáp', 0, 126)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (547, N'Là thành phần cấu tạo nên huyết sắc tố (hêmôglôbin) trong hồng cầu', 1, 126)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (548, N'Là thành phần cấu tạo nên nhiều loại vitamin', 0, 126)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (549, N'Axit nuclêic', 0, 127)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (550, N'Prôtêin', 0, 127)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (551, N'Gluxit', 0, 127)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (552, N'Lipit', 1, 127)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (553, N'Ống dẫn nước tiểu', 1, 128)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (554, N'Ống đái', 0, 128)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (555, N'Bóng đái', 0, 128)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (556, N'Tất cả các phương án còn lại', 0, 128)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (557, N'bóng đái.', 0, 129)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (558, N'thận.', 1, 129)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (559, N'ống đái.', 0, 129)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (560, N'ống dẫn nước tiểu.', 0, 129)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (561, N'Nhịn tiểu', 1, 130)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (562, N'Uống nhiều nước', 0, 130)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (563, N'Ăn nhạt', 0, 130)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (564, N'Ăn thực phẩm đông lạnh', 0, 130)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (565, N'2,5 lít', 0, 131)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (566, N' 2 lít', 0, 131)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (567, N'1 lít', 0, 131)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (568, N'1,5 lít', 1, 131)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (569, N'Tất cả các phương án còn lại', 0, 132)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (570, N'Lớp biểu bì', 1, 132)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (571, N' Lớp bì', 0, 132)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (572, N'Lớp mỡ dưới da', 0, 132)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (573, N'85%', 1, 133)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (574, N'90%', 0, 133)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (575, N'99%', 0, 133)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (576, N'95%', 0, 133)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (577, N'Vitamin A', 0, 134)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (578, N'Vitamin E', 1, 134)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (579, N'Vitamin B2', 0, 134)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (580, N'Vitamin C', 0, 134)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (581, N'Vitamin E', 0, 135)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (582, N'Vitamin A', 0, 135)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (583, N'Vitamin B12', 1, 135)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (584, N'Vitamin B9', 0, 135)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (585, N'Lưu huỳnh', 0, 136)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (586, N'Natri', 0, 136)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (587, N'Kẽm', 0, 136)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (588, N'Canxi', 1, 136)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (589, N'thuốc lá', 0, 137)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (590, N'rượu', 1, 137)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (591, N'muối ăn', 0, 137)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (592, N'chất béo', 0, 137)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (593, N'Rối loạn chuyển hoá', 0, 138)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (594, N' Ăn nhiều thực phẩm giàu năng lượng', 0, 138)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (595, N'Tất cả các phương án còn lại', 1, 138)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (596, N'Lười vận động', 0, 138)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (597, N' Tất cả các phương án còn lại', 1, 139)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (598, N'Phổi', 0, 139)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (599, N'Da', 0, 139)
GO
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (600, N'Thận', 0, 139)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (601, N'Nước tiểu', 0, 140)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (602, N'CO2', 0, 140)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (603, N'Mồ hôi', 0, 140)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (604, N'Phân', 1, 140)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (605, N'Cơ vòng ống đái', 0, 141)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (606, N'Cơ bụng', 0, 141)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (607, N'Tất cả các phương án còn lại', 1, 141)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (608, N'Cơ bóng đái', 0, 141)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (609, N'Lông và bao lông', 0, 142)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (610, N' Tầng tế bào sống', 1, 142)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (611, N'Tuyến nhờn', 0, 142)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (612, N'Thụ quan', 0, 142)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (613, N'Đội mũ, đeo khẩu trang,mặc áo và bôi kem chống nắng khi hoạt động ngoài trời', 1, 143)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (614, N'Tắm nắng vào buổi trưa', 0, 143)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (615, N'Thường xuyên tắm nước lạnh', 0, 143)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (616, N'Tất cả các phương án còn lại', 0, 143)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (617, N'Số tất cả các giá trị (không nhất thiết phải khác nhau) của dấu hiệu bằng số các đơn vị điều tra', 0, 144)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (618, N'Các số liệu thu thập được khi điều tra về một dấu hiệu gọi là số liệu thống kê', 1, 144)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (619, N'Tần số của một giá trị là số các đơn vị điều tra', 0, 144)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (620, N'Số lần xuất hiện của một giá trị trong dãy giá trị của dấu hiệu là tần số của giá trị đó.', 0, 144)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (621, N'Tần số là các số liệu thu thập được khi điều tra về một dấu hiệu', 1, 145)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (622, N'Tần số của một giá trị là một giá trị của dấu hiệu', 0, 145)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (623, N'Cả A và B đều sai', 0, 145)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (624, N'Cả A và B đều đúng', 0, 145)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (625, N'12', 1, 146)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (626, N'11', 0, 146)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (627, N'10', 0, 146)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (628, N'9', 0, 146)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (629, N'Đơn thức A có bậc là 5', 0, 147)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (630, N'Giá trị của A tại x = 1, y = -1, z = 2 là -2', 0, 147)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (631, N'Hệ số của đơn thức A là 0', 1, 147)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (632, N'Đơn thức A đồng dạng với đơn thức -3y3x2z', 0, 147)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (633, N'1', 0, 148)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (634, N'2', 1, 148)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (635, N'3', 0, 148)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (636, N'4', 0, 148)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (637, N'a(a + 3)', 0, 149)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (638, N'a(a - 3)', 1, 149)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (639, N'a2 + 3', 0, 149)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (640, N'a3 - 3', 0, 149)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (641, N'Số 1 là đơn thức', 0, 150)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (642, N'Số 0 là đơn thức bậc 0', 0, 150)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (643, N'Đơn thức x2yz có phần hệ số bằng 0', 1, 150)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (644, N'Hai đơn thức x2y và -x2y đồng dạng', 0, 150)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (645, N'5', 0, 151)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (646, N'6', 1, 151)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (647, N'7', 0, 151)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (648, N'8', 0, 151)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (649, N'-20', 0, 152)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (650, N'20', 0, 152)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (651, N'9', 0, 152)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (652, N'-9', 1, 152)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (653, N'9,200', 0, 153)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (654, N' 9,2', 1, 153)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (655, N'9,002', 0, 153)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (656, N'9,02', 0, 153)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (657, N'0,34', 0, 154)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (658, N'3,04', 0, 154)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (659, N'3,4', 0, 154)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (660, N'3,004', 1, 154)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (661, N'x = 3', 0, 155)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (662, N'x = 2', 0, 155)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (663, N'x = 1', 0, 155)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (664, N'x = 0', 1, 155)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (665, N'50', 0, 156)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (666, N'80', 0, 156)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (667, N'320', 0, 156)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (668, N'200', 1, 156)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (669, N'9 m 6 dm = 9,6m', 0, 157)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (670, N'2 cm2 5 mm2 =2,05 cm2', 1, 157)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (671, N'5 tấn 62 kg =5,062tấn', 0, 157)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (672, N'2 phút = 2,5phút', 0, 157)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (673, N'40,392', 1, 158)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (674, N'39,204', 0, 158)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (675, N'40,293', 0, 158)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (676, N'39,402', 0, 158)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (677, N'30 000', 0, 159)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (678, N'0.03', 1, 159)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (679, N'0.3', 0, 159)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (680, N'3', 0, 159)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (681, N'đơn vị', 1, 160)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (682, N'hàng phần mười', 0, 160)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (683, N'hàng phần trăm ', 0, 160)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (684, N'hàng phần nghìn', 0, 160)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (685, N'3 năm', 0, 161)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (686, N'4 năm', 0, 161)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (687, N'10 năm', 0, 161)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (688, N'15 năm', 1, 161)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (689, N'960 km', 1, 162)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (690, N'16km', 0, 162)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (691, N'690km', 0, 162)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (692, N'160km', 0, 162)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (693, N'x = 28,65', 0, 163)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (694, N'x = 28', 0, 163)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (695, N'x = 29', 1, 163)
INSERT [dbo].[DapAn] ([MaDapAn], [NoiDung], [DungSai], [MaCauHoi]) VALUES (696, N'x = 29,45', 0, 163)
SET IDENTITY_INSERT [dbo].[DapAn] OFF
SET IDENTITY_INSERT [dbo].[KetQua] ON 

INSERT [dbo].[KetQua] ([MaKetQua], [MaThiSinh], [MaKyThi], [NgayThi], [Diem], [ThoiGianLamBai]) VALUES (1, 5, 2, CAST(0x71410B00 AS Date), 2, 253)
INSERT [dbo].[KetQua] ([MaKetQua], [MaThiSinh], [MaKyThi], [NgayThi], [Diem], [ThoiGianLamBai]) VALUES (2, 7, 1, CAST(0x71410B00 AS Date), 0.5, 103)
INSERT [dbo].[KetQua] ([MaKetQua], [MaThiSinh], [MaKyThi], [NgayThi], [Diem], [ThoiGianLamBai]) VALUES (3, 7, 1, CAST(0x71410B00 AS Date), 0.5, 123)
SET IDENTITY_INSERT [dbo].[KetQua] OFF
SET IDENTITY_INSERT [dbo].[KyThi] ON 

INSERT [dbo].[KyThi] ([MaKyThi], [MaMon], [TenKyThi], [ThoiGianLamBai], [ThoiGianMoDe], [ThoiGianDongDe], [TongSoCau], [TiLeDe], [TiLeKho], [TienLui], [MatKhau], [MaKhoi], [MoTa], [HinhAnh]) VALUES (1, N'DL7', N'Địa lý 7', 10, CAST(0xABB70000 AS SmallDateTime), CAST(0xAC8D0000 AS SmallDateTime), 20, 80, 20, 1, NULL, N'7', N'Bộ đề thi và đáp án Địa lý 7', N'DiaLy.jpg')
INSERT [dbo].[KyThi] ([MaKyThi], [MaMon], [TenKyThi], [ThoiGianLamBai], [ThoiGianMoDe], [ThoiGianDongDe], [TongSoCau], [TiLeDe], [TiLeKho], [TienLui], [MatKhau], [MaKhoi], [MoTa], [HinhAnh]) VALUES (2, N'LS6', N'Thi cuối kỳ Lịch sử 6', 15, CAST(0xABE50000 AS SmallDateTime), CAST(0xAC710000 AS SmallDateTime), 20, 80, 20, 1, NULL, N'6', N'Bộ đề thi và đáp án Lịch sử 6', N'LichSu.png')
INSERT [dbo].[KyThi] ([MaKyThi], [MaMon], [TenKyThi], [ThoiGianLamBai], [ThoiGianMoDe], [ThoiGianDongDe], [TongSoCau], [TiLeDe], [TiLeKho], [TienLui], [MatKhau], [MaKhoi], [MoTa], [HinhAnh]) VALUES (3, N'SH', N'Kiểm tra Sinh học ', 20, CAST(0xAB800000 AS SmallDateTime), CAST(0xAC4F0000 AS SmallDateTime), 20, 60, 40, 1, NULL, N'6', N'Bộ đề thi và đáp án Sinh học 6 ', N'SinhHoc.jpg')
INSERT [dbo].[KyThi] ([MaKyThi], [MaMon], [TenKyThi], [ThoiGianLamBai], [ThoiGianMoDe], [ThoiGianDongDe], [TongSoCau], [TiLeDe], [TiLeKho], [TienLui], [MatKhau], [MaKhoi], [MoTa], [HinhAnh]) VALUES (4, N'DL6', N'Địa lý 6', 10, CAST(0xAB640000 AS SmallDateTime), CAST(0xAC7E0000 AS SmallDateTime), 20, 80, 20, 1, NULL, N'6', N'Bộ đề thi và đáp án Địa lý 6', N'DiaLy.jpg')
INSERT [dbo].[KyThi] ([MaKyThi], [MaMon], [TenKyThi], [ThoiGianLamBai], [ThoiGianMoDe], [ThoiGianDongDe], [TongSoCau], [TiLeDe], [TiLeKho], [TienLui], [MatKhau], [MaKhoi], [MoTa], [HinhAnh]) VALUES (5, N'DL8', N'Địa lý 8', 10, CAST(0xABD00000 AS SmallDateTime), CAST(0xAC970000 AS SmallDateTime), 20, 80, 20, 1, NULL, N'8', N'Bộ đề thi và đáp án Địa lý 8', N'DiaLy.jpg')
INSERT [dbo].[KyThi] ([MaKyThi], [MaMon], [TenKyThi], [ThoiGianLamBai], [ThoiGianMoDe], [ThoiGianDongDe], [TongSoCau], [TiLeDe], [TiLeKho], [TienLui], [MatKhau], [MaKhoi], [MoTa], [HinhAnh]) VALUES (6, N'DL9', N'Địa lý 9', 10, CAST(0xABC00000 AS SmallDateTime), CAST(0xAC520000 AS SmallDateTime), 20, 80, 20, 1, NULL, N'9', N'Bộ đề thi và đáp án Địa lý 9', N'DiaLy.jpg')
INSERT [dbo].[KyThi] ([MaKyThi], [MaMon], [TenKyThi], [ThoiGianLamBai], [ThoiGianMoDe], [ThoiGianDongDe], [TongSoCau], [TiLeDe], [TiLeKho], [TienLui], [MatKhau], [MaKhoi], [MoTa], [HinhAnh]) VALUES (7, N'TH', N'Toán học 8', 15, CAST(0xABD60000 AS SmallDateTime), CAST(0xAC6F0000 AS SmallDateTime), 20, 80, 20, 1, NULL, N'8', N'Bộ đề thi và đáp án Toán học 8', N'Toan.jpg')
INSERT [dbo].[KyThi] ([MaKyThi], [MaMon], [TenKyThi], [ThoiGianLamBai], [ThoiGianMoDe], [ThoiGianDongDe], [TongSoCau], [TiLeDe], [TiLeKho], [TienLui], [MatKhau], [MaKhoi], [MoTa], [HinhAnh]) VALUES (8, N'NV', N'Ngữ văn 7', 20, CAST(0xABC10000 AS SmallDateTime), CAST(0xAC6F0000 AS SmallDateTime), 20, 80, 20, 1, NULL, N'7', N'Bộ đề thi và đáp án Ngữ văn 7', N'NguVan.jpg')
SET IDENTITY_INSERT [dbo].[KyThi] OFF
INSERT [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan], [TenLoaiTaiKhoan]) VALUES (N'QTV', N'Quản trị viên')
INSERT [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan], [TenLoaiTaiKhoan]) VALUES (N'TS', N'Thí sinh')
INSERT [dbo].[LuuKyThi] ([MaKyThi], [TenDangNhap], [TenKyThi], [ThoiGian]) VALUES (1, N'khanh21051999', N'Thi khảo sát chất lượng định kì', NULL)
INSERT [dbo].[LuuKyThi] ([MaKyThi], [TenDangNhap], [TenKyThi], [ThoiGian]) VALUES (2, N'long17101999', N'Thi khảo sát chất lượng định kì', NULL)
INSERT [dbo].[LuuKyThi] ([MaKyThi], [TenDangNhap], [TenKyThi], [ThoiGian]) VALUES (3, N'khanh21051999', N'Thi khảo sát chất lượng định kì', NULL)
INSERT [dbo].[MonThi] ([MaMon], [TenMon]) VALUES (N'DL6', N'Địa lý 6')
INSERT [dbo].[MonThi] ([MaMon], [TenMon]) VALUES (N'DL7', N'Địa lý 7')
INSERT [dbo].[MonThi] ([MaMon], [TenMon]) VALUES (N'DL8', N'Địa lý 8')
INSERT [dbo].[MonThi] ([MaMon], [TenMon]) VALUES (N'DL9', N'Địa lý 9')
INSERT [dbo].[MonThi] ([MaMon], [TenMon]) VALUES (N'LS6', N'Lịch sử 6')
INSERT [dbo].[MonThi] ([MaMon], [TenMon]) VALUES (N'NV', N'Ngữ văn')
INSERT [dbo].[MonThi] ([MaMon], [TenMon]) VALUES (N'SH', N'Sinh học')
INSERT [dbo].[MonThi] ([MaMon], [TenMon]) VALUES (N'TH', N'Toán học')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [NgayTao], [LoaiTaiKhoan]) VALUES (N'123', N'132123', CAST(0x71410B00 AS Date), N'TS')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [NgayTao], [LoaiTaiKhoan]) VALUES (N'1230', N'123123', CAST(0x71410B00 AS Date), N'TS')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [NgayTao], [LoaiTaiKhoan]) VALUES (N'admin', N'admin', NULL, N'QTV')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [NgayTao], [LoaiTaiKhoan]) VALUES (N'long', N'123123', CAST(0x71410B00 AS Date), N'TS')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [NgayTao], [LoaiTaiKhoan]) VALUES (N'long17', N'123123', CAST(0x69410B00 AS Date), N'TS')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [NgayTao], [LoaiTaiKhoan]) VALUES (N'longtr', N'123123', CAST(0x69410B00 AS Date), N'TS')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [NgayTao], [LoaiTaiKhoan]) VALUES (N'ngoclong', N'123123', CAST(0x71410B00 AS Date), N'TS')
SET IDENTITY_INSERT [dbo].[ThiSinh] ON 

INSERT [dbo].[ThiSinh] ([MaThiSinh], [TenThiSinh], [DiaChi], [GioiTinh], [SoDienThoai], [NamSinh], [Email], [TenDangNhap]) VALUES (1, N'Lê Minh Khánh', N'Tây Ninh', N'Nam', N'0328243532', CAST(0x26230B00 AS Date), N'Khanh@gmail.com', NULL)
INSERT [dbo].[ThiSinh] ([MaThiSinh], [TenThiSinh], [DiaChi], [GioiTinh], [SoDienThoai], [NamSinh], [Email], [TenDangNhap]) VALUES (2, N'Nguyễn Ngọc Long', N'TP.HCM', N'Nam', N'0583535939', CAST(0xBB230B00 AS Date), N'Long@gmail.com', NULL)
INSERT [dbo].[ThiSinh] ([MaThiSinh], [TenThiSinh], [DiaChi], [GioiTinh], [SoDienThoai], [NamSinh], [Email], [TenDangNhap]) VALUES (3, N'bsfb', NULL, NULL, N'7527828738', CAST(0x64410B00 AS Date), N'hj@gmail.com', NULL)
INSERT [dbo].[ThiSinh] ([MaThiSinh], [TenThiSinh], [DiaChi], [GioiTinh], [SoDienThoai], [NamSinh], [Email], [TenDangNhap]) VALUES (4, N'klu', NULL, NULL, N'4242522275', CAST(0x64410B00 AS Date), N'wqewq@gmail.com', NULL)
INSERT [dbo].[ThiSinh] ([MaThiSinh], [TenThiSinh], [DiaChi], [GioiTinh], [SoDienThoai], [NamSinh], [Email], [TenDangNhap]) VALUES (5, N'Ngọc Long', N'TPHCM', N'Nam', N'0513554352', CAST(0x64410B00 AS Date), N'long@gmail.com', N'long17')
INSERT [dbo].[ThiSinh] ([MaThiSinh], [TenThiSinh], [DiaChi], [GioiTinh], [SoDienThoai], [NamSinh], [Email], [TenDangNhap]) VALUES (6, N'Ngọc Long', N'HCM', N'Nam', N'0125236325', CAST(0x64410B00 AS Date), N'ngoclongtr@gmail.com', N'longtr')
INSERT [dbo].[ThiSinh] ([MaThiSinh], [TenThiSinh], [DiaChi], [GioiTinh], [SoDienThoai], [NamSinh], [Email], [TenDangNhap]) VALUES (7, N'Long Nguyễn', N'TPHCM', N'Nam', N'0583535939', CAST(0xBB230B00 AS Date), N'long@gmail.com', N'long')
INSERT [dbo].[ThiSinh] ([MaThiSinh], [TenThiSinh], [DiaChi], [GioiTinh], [SoDienThoai], [NamSinh], [Email], [TenDangNhap]) VALUES (8, N'dfad', N'KHJ', N'Nam', N'13212', CAST(0x64410B00 AS Date), N'ASD', N'123')
INSERT [dbo].[ThiSinh] ([MaThiSinh], [TenThiSinh], [DiaChi], [GioiTinh], [SoDienThoai], [NamSinh], [Email], [TenDangNhap]) VALUES (9, N'Ngọc Long', N'HCM', N'Nam', N'0583535939', CAST(0x64410B00 AS Date), N'long@gmail.com', N'ngoclong')
INSERT [dbo].[ThiSinh] ([MaThiSinh], [TenThiSinh], [DiaChi], [GioiTinh], [SoDienThoai], [NamSinh], [Email], [TenDangNhap]) VALUES (10, N'sadsa', N'12312312312', N'Nam', N'1231231221', CAST(0x64410B00 AS Date), N'sdasads@gmail.com', N'1230')
SET IDENTITY_INSERT [dbo].[ThiSinh] OFF
ALTER TABLE [dbo].[CauHoi]  WITH CHECK ADD  CONSTRAINT [FK_CauHoi_MonThi] FOREIGN KEY([MaMon])
REFERENCES [dbo].[MonThi] ([MaMon])
GO
ALTER TABLE [dbo].[CauHoi] CHECK CONSTRAINT [FK_CauHoi_MonThi]
GO
ALTER TABLE [dbo].[DapAn]  WITH CHECK ADD  CONSTRAINT [FK_DapAn_CauHoi1] FOREIGN KEY([MaCauHoi])
REFERENCES [dbo].[CauHoi] ([MaCauHoi])
GO
ALTER TABLE [dbo].[DapAn] CHECK CONSTRAINT [FK_DapAn_CauHoi1]
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KetQua_KyThi] FOREIGN KEY([MaKyThi])
REFERENCES [dbo].[KyThi] ([MaKyThi])
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KetQua_KyThi]
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KetQua_ThiSinh] FOREIGN KEY([MaThiSinh])
REFERENCES [dbo].[ThiSinh] ([MaThiSinh])
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KetQua_ThiSinh]
GO
ALTER TABLE [dbo].[Khoi]  WITH CHECK ADD  CONSTRAINT [FK_Khoi_MonThi] FOREIGN KEY([MaMon])
REFERENCES [dbo].[MonThi] ([MaMon])
GO
ALTER TABLE [dbo].[Khoi] CHECK CONSTRAINT [FK_Khoi_MonThi]
GO
ALTER TABLE [dbo].[KyThi]  WITH CHECK ADD  CONSTRAINT [FK_KyThi_MonThi] FOREIGN KEY([MaMon])
REFERENCES [dbo].[MonThi] ([MaMon])
GO
ALTER TABLE [dbo].[KyThi] CHECK CONSTRAINT [FK_KyThi_MonThi]
GO
ALTER TABLE [dbo].[LuuKyThi]  WITH CHECK ADD  CONSTRAINT [FK_LuuKyThi_KyThi] FOREIGN KEY([MaKyThi])
REFERENCES [dbo].[KyThi] ([MaKyThi])
GO
ALTER TABLE [dbo].[LuuKyThi] CHECK CONSTRAINT [FK_LuuKyThi_KyThi]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_LoaiTaiKhoan1] FOREIGN KEY([LoaiTaiKhoan])
REFERENCES [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_LoaiTaiKhoan1]
GO
ALTER TABLE [dbo].[ThiSinh]  WITH CHECK ADD  CONSTRAINT [FK_ThiSinh_TaiKhoan] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
GO
ALTER TABLE [dbo].[ThiSinh] CHECK CONSTRAINT [FK_ThiSinh_TaiKhoan]
GO
USE [master]
GO
ALTER DATABASE [ThiTracNghiem] SET  READ_WRITE 
GO
