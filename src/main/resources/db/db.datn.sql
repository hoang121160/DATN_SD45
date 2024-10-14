﻿CREATE DATABASE [DB.DATN]
GO
USE [DB.DATN]
GO

-- DROP DATABASE DB.DATN
--- Chuc nang
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chuc_nang]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [ten] NVARCHAR(100),
    [ma] NVARCHAR(255),
    [id_cha] BIGINT,
    [loai] INT,
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Nhom Chuc nang
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nhom_chuc_nang]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_nhom] BIGINT,
    [id_chuc_nang] BIGINT,
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Nhom
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nhom]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [ten] NVARCHAR(200),
    [mo_ta] NVARCHAR(MAX),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Nguoi dung
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nguoi_dung]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [ten_dang_nhap] NVARCHAR(200),
    [mat_khau] NVARCHAR(200) ,
    [id_nhom] BIGINT,
    [vaitro] NVARCHAR(50),
    [xac_thuc] INT DEFAULT 1,
    [trang_thai] NVARCHAR(50),
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Thong tin nguoi dung
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thong_tin_ca_nhan]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_nguoi_dung] BIGINT,
    [ho_va_ten] NVARCHAR(200),
    [sdt] NVARCHAR(20),
    [avatar] NVARCHAR(255),
    [dia_chi] NVARCHAR(255),
    [gioi_tinh] INT DEFAULT 1,
    [ngay_sinh] DATETIME,
    [cccd] NVARCHAR(20),
    [email] NVARCHAR(200),
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Dia chi giao hang
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dia_chi_giao_hang]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_nguoi_dung] BIGINT,
    [ho_va_ten] NVARCHAR(200),
    [sdt] NVARCHAR(20),
    [dia_chi] NVARCHAR(MAX),
    [thanh_pho] NVARCHAR(200),
    [quoc_gia] NVARCHAR(100),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Phan hoi khach hang
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [phan_hoi]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_ho_tro] BIGINT,
    [nhan_xet] NVARCHAR(250),
    [diem] INT,
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Ho tro
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ho_tro]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_nguoi_dung] BIGINT,
    [yeu_cau] NVARCHAR(250) ,
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- lich su Ho tro
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lich_su_ho_tro]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_ho_tro] BIGINT,
    [id_nguoi_dung] BIGINT,
    [noi_dung] NVARCHAR(250),
    [ngay_phan_hoi] DATETIME DEFAULT GETDATE(),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Diem tich luy
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [diem_tich_luy]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_nguoi_dung] BIGINT,
    [diem] INT,
    [ly_do] NVARCHAR(250),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- phuong thuc thanh toan
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [phuong_thuc_thanh_toan]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [ten] NVARCHAR(100),
    [mo_ta] NVARCHAR(MAX),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- thanh toan
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanh_toan]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_hoa_don] BIGINT,
    [id_phuong_thuc_thanh_toan] BIGINT,
    [ma_giao_dich] NVARCHAR(100),
    [so_tien] DECIMAL(10,2),
    [ngay_thanh_toan] DATETIME DEFAULT GETDATE(),
    [ghi_chu] NVARCHAR(MAX),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- phuong thuc van chuyen
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [phuong_thuc_van_chuyen]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [ten] NVARCHAR(200),
    [mo_ta] NVARCHAR(500),
    [phi_van_chuyen] DECIMAL(10,2),
    [loai] INT,
    [ghi_chu] NVARCHAR(250),
    [thoi_gian_giao_hang] NVARCHAR(100),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Hoa don
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hoa_don]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_nguoi_dung] BIGINT,
    [id_dia_chi_giao_hang] BIGINT,
    [id_phuong_thuc_van_chuyen] BIGINT,
    [ngay_dat_hang] DATETIME DEFAULT GETDATE(),
    [ngay_thanh_toan] DATETIME DEFAULT GETDATE(),
    [tong_tien] DECIMAL(10,2),
    [diem_su_dung] INT,
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Gio hang
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gio_hang]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_nguoi_dung] BIGINT,
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- chi tiet gio hang
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chi_tiet_gio_hang]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_gio_hang] BIGINT,
    [id_san_pham_chi_tiet] BIGINT,
    [so_luong] INT,
    [gia] DECIMAL(10,2),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Size
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [size]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [ten] NVARCHAR(100),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Mau sac
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mau_sac]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [ten] NVARCHAR(100),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- chat lieu
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chat_lieu]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [ten] NVARCHAR(100),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- San pham
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [san_pham]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_danh_muc] BIGINT,
    [id_thuong_hieu] BIGINT,
    [ten] NVARCHAR(200),
    [xuat_xu] NVARCHAR(200),
    [mo_ta] NVARCHAR(MAX),
    [gia] DECIMAL(10,2),
    [anh] NVARCHAR(255),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Chi tiet San pham
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chi_tiet_san_pham]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_san_pham] BIGINT,
    [id_size] BIGINT,
    [id_mau_sac] BIGINT,
    [id_chat_lieu] BIGINT,
    [so_luong] INT,
    [ghi_chu] NVARCHAR(MAX),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Thuong hieu
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thuong_hieu]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_danh_muc_cha] BIGINT,
    [ten] NVARCHAR(100),
    [mo_ta] NVARCHAR(250),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- danh muc
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [danh_muc]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_danh_muc_cha] BIGINT,
    [ten] NVARCHAR(200),
    [mo_ta] NVARCHAR(1000),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- san pham yeu thich
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [san_pham_yeu_thich]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_san_pham] BIGINT,
    [id_nguoi_dung] BIGINT,
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- danh gia san pham
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [danh_gia]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_san_pham_chi_tiet] BIGINT,
    [id_nguoi_dung] BIGINT,
    [id_hoa_don] BIGINT,
    [danh_gia] INT,
    [nhan_xet] NVARCHAR(1000),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- chi tiet hoa don
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chi_tiet_hoa_don]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_hoa_don] BIGINT,
    [id_san_pham_chi_tiet] BIGINT,
    [so_luong] INT,
    [gia] DECIMAL(10,2),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- khuyen mai
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [khuyen_mai]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [ten] NVARCHAR(200),
    [mo_ta] NVARCHAR(1000),
    [loai] INT,
    [gia_tri] DECIMAL(10,2),
    [ngay_bat_dau] DATETIME,
    [ngay_ket_thuc] DATETIME,
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- ap dung khuyen mai
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ap_dung_khuyen_mai]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_khuyen_mai] BIGINT,
    [id_gio_hang] BIGINT,
    [id_hoa_don] BIGINT,
    [gia_tri_giam] DECIMAL(10,2),
    [ngay_ap_dung] DATETIME,
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- hinh anh
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hinh_anh]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_san_pham_chi_tiet] BIGINT,
    [duong_dan] NVARCHAR(255),
    [mo_ta] NVARCHAR(500),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Yeu cau doi tra
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [yeu_cau_doi_tra]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_hoa_don] BIGINT,
    [id_nguoi_dung] BIGINT,
    [id_san_pham_chi_tiet] BIGINT,
    [loai_yeu_cau] NVARCHAR(50),
    [ly_do] NVARCHAR(1000),
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO

--- Chi tiet Yeu cau doi tra
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [yeu_cau_doi_tra_chi_tiet]
(
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    [id_yeu_cau_doi_tra] BIGINT,
    [id_san_pham_chi_tiet] BIGINT,
    [trang_thai] INT DEFAULT 1,
    [ngay_tao] DATETIME DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME DEFAULT GETDATE(),
    [nguoi_tao] VARCHAR(20),
    [nguoi_cap_nhat] VARCHAR(20)
) ON [PRIMARY];
GO