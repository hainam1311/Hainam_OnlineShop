
USE master
GO
alter database PRJ_Assignment
 set single_user with rollback immediate
if exists (select * from sysdatabases where name='PRJ_Assignment') drop database PRJ_Assignment
GO

CREATE DATABASE PRJ_Assignment

GO

USE [PRJ_Assignment]
GO

/****** Object:  Table [dbo].[category]    Script Date: 07/20/2021 18:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [dbo].[category] ([cid], [cname]) VALUES (1, N'Giày Dép')
INSERT [dbo].[category] ([cid], [cname]) VALUES (2, N'Quần Áo')
INSERT [dbo].[category] ([cid], [cname]) VALUES (3, N'Phụ Kiện')
/****** Object:  Table [dbo].[account]    Script Date: 07/20/2021 18:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[account]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[account](
	[username] [varchar](150) NOT NULL,
	[pass] [varchar](150) NOT NULL,
	[isAdmin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[account] ([username], [pass], [isAdmin]) VALUES (N'guest', N'1', 0)
INSERT [dbo].[account] ([username], [pass], [isAdmin]) VALUES (N'hainam', N'1', 1)
INSERT [dbo].[account] ([username], [pass], [isAdmin]) VALUES (N'haohao', N'123', 0)
INSERT [dbo].[account] ([username], [pass], [isAdmin]) VALUES (N'huuhai', N'1', 0)
INSERT [dbo].[account] ([username], [pass], [isAdmin]) VALUES (N'huyanh', N'1', 1)
INSERT [dbo].[account] ([username], [pass], [isAdmin]) VALUES (N'namnguyen', N'1', 0)
INSERT [dbo].[account] ([username], [pass], [isAdmin]) VALUES (N'phamtuan', N'123', 0)
INSERT [dbo].[account] ([username], [pass], [isAdmin]) VALUES (N'tintin', N'1', 0)
INSERT [dbo].[account] ([username], [pass], [isAdmin]) VALUES (N'vanchuc', N'1', 0)
/****** Object:  Table [dbo].[order]    Script Date: 07/20/2021 18:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[order]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[order](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](150) NOT NULL,
	[Cname] [nvarchar](50) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON
INSERT [dbo].[order] ([orderid], [username], [Cname], [address], [total]) VALUES (1, N'hainam', N'Nguyen Van Chuc', N'Dan 34', 750000.0000)
INSERT [dbo].[order] ([orderid], [username], [Cname], [address], [total]) VALUES (2, N'vanchuc', N'Nguyen Van Chuc', N'Dan 34', 890000.0000)
INSERT [dbo].[order] ([orderid], [username], [Cname], [address], [total]) VALUES (3, N'haohao', N'Nguyen Hao Hao', N'Hai Duong', 3560000.0000)
INSERT [dbo].[order] ([orderid], [username], [Cname], [address], [total]) VALUES (5, N'guest', N'Anh Da Den', N'c', 960000.0000)
INSERT [dbo].[order] ([orderid], [username], [Cname], [address], [total]) VALUES (6, N'vanchuc', N'Test', N'Test', 7250000.0000)
INSERT [dbo].[order] ([orderid], [username], [Cname], [address], [total]) VALUES (7, N'tintin', N'Can Thi Hoa Mai', N'Thach That', 1320000.0000)
SET IDENTITY_INSERT [dbo].[order] OFF
/****** Object:  Table [dbo].[product]    Script Date: 07/20/2021 18:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[product](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[image] [varchar](max) NOT NULL,
	[price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
	[title] [varchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[cid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity], [title], [description], [cid]) VALUES (1, N'Monarch Butterfly T-Shirt - White', N'https://bizweb.dktcdn.net/100/369/010/products/monarch-butterflys-white-7-w-5cf392f5-708c-4c29-8d32-cbc5fcdba4be.jpg?v=1614149675407', 320000.0000, 2, N'Áo phông Dirty Coins', N'100% cotton• Regular fit• Hình in lụa trước ngực & lưng áo• Tay áo thêu logo nổi cùng màu', 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity], [title], [description], [cid]) VALUES (2, N'DirtyCoins Ocean Blue Denim Cap', N'https://bizweb.dktcdn.net/100/369/010/products/ocean-blue-denim-caps-7-w.jpg?v=1608092719173', 250000.0000, 0, N'Mu Dirty Coins', N'Nón làm từ chất liệu denim.• Nón có khóa cài điều chỉnh độ rộng.• Logo trước nón được thêu nổi.', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity], [title], [description], [cid]) VALUES (3, N'DirtyCoins Print Cardigan', N'https://bizweb.dktcdn.net/100/369/010/products/cardigan.jpg?v=1615198427017', 250000.0000, 10, N'Cardigan Dirty Coins', N'100% nỉ bông• 2 túi thân áo• Hoạ tiết logo DIRTYCOINS áp dụng công nghệ in chuyển nhiệt• Thêu tay thủ công logo Y viền bông• Bo gân viền áo, tà áo và cổ tay áo• Hàng khuy dễ đóng mở', 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity], [title], [description], [cid]) VALUES (4, N'Dép Đúc Nguyên Khối Adidas 3 Sọc', N'https://vinagiaydep.com/wp-content/uploads/2020/09/z2077194253600_2225178570146c4fda3313b16f2a5c6b-510x510.jpg', 180000.0000, 1, N'Dép Adidas', N'– Đế là cao su chất lượng. mềm, mỏng, nhẹ, chống thấm sơ, thoáng mát.', 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity], [title], [description], [cid]) VALUES (5, N'DirtyCoins Slide - Black/Tan', N'https://bizweb.dktcdn.net/100/369/010/products/slide-tan-1b.jpg?v=1610009331450', 300000.0000, 3, N'Dép DirtyCoins', N'100% cao su tự nhiên  • Họa tiết DirtyCoins graffiti ép lõm dưới đế  • Đế trên khắc nổi logo Y   • Phần upper được lót bông và vải phía trong, tạo cảm giác thoải mái', 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity], [title], [description], [cid]) VALUES (6, N'DirtyCoins Wally Wallet - Red', N'https://bizweb.dktcdn.net/100/369/010/products/dirtycoins-wally-wallet-in-red-1-w.jpg?v=1612323084000', 420000.0000, 6, N'Ví DirtyCoins', N'Ví dáng gập  • Chất liệu: vải canvas viền da P.U, lót dù mặt trong  • Họa tiết Y in phản quang   • 1 ngăn chính lớn  • 1 ngăn zipper  • 5 ngăn đựng thẻ ngoài', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity], [title], [description], [cid]) VALUES (7, N'Graffiti Hoodie - Black', N'https://bizweb.dktcdn.net/100/369/010/products/dirtycoins-graffity-hoodie-bla-1-w-cc6aacc3-908b-4f13-abde-3784335e70c3.jpg?v=1611822096373', 500000.0000, 12, N'Hoodie DirtyCoins', N'Áo hoodie nỉ bông màu đen  • Dây rút DirtyCoins phần nón, tùy chỉnh độ rộng  • Túi kangaroo trước bụng   • Họa tiết Graffity Dirtycoins màu trắng in trước ngực và sau áo  • Bo gân ống tay & tà áo', 2)
/****** Object:  Table [dbo].[orderdetail]    Script Date: 07/20/2021 18:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[orderdetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[orderdetail](
	[orderid] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NOT NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[orderdetail] ([orderid], [productID], [quantity], [price]) VALUES (1, 3, 3, 250000.0000)
INSERT [dbo].[orderdetail] ([orderid], [productID], [quantity], [price]) VALUES (2, 1, 2, 320000.0000)
INSERT [dbo].[orderdetail] ([orderid], [productID], [quantity], [price]) VALUES (2, 2, 1, 250000.0000)
INSERT [dbo].[orderdetail] ([orderid], [productID], [quantity], [price]) VALUES (3, 1, 10, 320000.0000)
INSERT [dbo].[orderdetail] ([orderid], [productID], [quantity], [price]) VALUES (3, 4, 2, 180000.0000)
INSERT [dbo].[orderdetail] ([orderid], [productID], [quantity], [price]) VALUES (7, 4, 2, 180000.0000)
INSERT [dbo].[orderdetail] ([orderid], [productID], [quantity], [price]) VALUES (5, 1, 3, 320000.0000)
INSERT [dbo].[orderdetail] ([orderid], [productID], [quantity], [price]) VALUES (6, 2, 29, 250000.0000)
INSERT [dbo].[orderdetail] ([orderid], [productID], [quantity], [price]) VALUES (7, 1, 3, 320000.0000)
/****** Object:  ForeignKey [FK__order__username__0EA330E9]    Script Date: 07/20/2021 18:53:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__order__username__0EA330E9]') AND parent_object_id = OBJECT_ID(N'[dbo].[order]'))
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[account] ([username])
GO
/****** Object:  ForeignKey [FK__product__cid__08EA5793]    Script Date: 07/20/2021 18:53:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__product__cid__08EA5793]') AND parent_object_id = OBJECT_ID(N'[dbo].[product]'))
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[category] ([cid])
GO
/****** Object:  ForeignKey [FK__orderdeta__order__108B795B]    Script Date: 07/20/2021 18:53:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__orderdeta__order__108B795B]') AND parent_object_id = OBJECT_ID(N'[dbo].[orderdetail]'))
ALTER TABLE [dbo].[orderdetail]  WITH CHECK ADD FOREIGN KEY([orderid])
REFERENCES [dbo].[order] ([orderid])
GO
/****** Object:  ForeignKey [FK__orderdeta__produ__117F9D94]    Script Date: 07/20/2021 18:53:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__orderdeta__produ__117F9D94]') AND parent_object_id = OBJECT_ID(N'[dbo].[orderdetail]'))
ALTER TABLE [dbo].[orderdetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([id])
GO
