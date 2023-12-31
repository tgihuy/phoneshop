USE [final_database]
GO
/****** Object:  Table [dbo].[account]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleID] [int] NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[phonenum] [nvarchar](10) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[accountID] [int] NOT NULL,
	[blogID] [int] IDENTITY(1,1) NOT NULL,
	[blogTitle] [nvarchar](100) NULL,
	[blogDetail] [nvarchar](max) NULL,
	[date] [date] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[blogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blogImage]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogImage](
	[blogID] [int] NOT NULL,
	[imageID] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[imageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cartDetail]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartDetail](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
	[describe] [nvarchar](max) NULL,
	[catImage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NOT NULL,
	[accountID] [int] NOT NULL,
	[fcontent] [nvarchar](max) NULL,
	[date] [date] NOT NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[like]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[like](
	[likeID] [int] IDENTITY(1,1) NOT NULL,
	[feedbackID] [int] NULL,
	[accountID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[likeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[accountID] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[total] [int] NOT NULL,
	[date] [date] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[note] [nvarchar](200) NULL,
	[orderStatusID] [int] NOT NULL,
	[customerName] [nvarchar](20) NULL,
	[phoneNumber] [nvarchar](10) NULL,
	[email] [nvarchar](30) NULL,
	[paymentMethod] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderInfo]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderInfo](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderStatus]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderStatus](
	[orderStatusID] [int] NOT NULL,
	[orderStatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[categoryID] [int] NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[details] [nvarchar](max) NULL,
	[price] [int] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productImage]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productImage](
	[productID] [int] NULL,
	[imageID] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[imageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reply]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reply](
	[replyID] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[accountID] [int] NULL,
	[feedbackID] [int] NULL,
	[date] [date] NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[replyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 15/11/2023 11:13:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (6, N'kiemquangc3tob@gmail.com', N'NO96gHWPCTMzUV9HmBbpnWPGaFE=', 2, N'Quang', N'999999999', N'Ha Noi', 1)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (7, N'huy', N'123', 2, N'Huy', N'123456789', N'Ha Noi', 1)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (8, N'trananhtuana2k50namly@gmail.com', N'2BRCFsum4e6Bdccpe1tdrR7LaOM=', 3, N'anh tuan', N'0123456789', N'HN', 1)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (9, N'huytghe176497@fpt.edu.vn', N'rAFzLv9utBVX8gooFYmAIzFcmsY=', 1, N'gia huy', N'0911248447', N'hanoi', 1)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (10, N'harrystylesbanhzai@gmail.com', N'rAFzLv9utBVX8gooFYmAIzFcmsY=', 4, N'Tran Gia Huy', N'0911248447', N'Ha Noi', 1)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (11, N'trangiahuynna@gmail.com', N'rAFzLv9utBVX8gooFYmAIzFcmsY=', 3, N'gia huy', N'0911248447', N'hanoi', 1)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (12, N'fxxkit456@gmail.com', N'NO96gHWPCTMzUV9HmBbpnWPGaFE=', 4, N'Nguyen Thanh', N'0982752566', N'Ha Noi', 0)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (13, N'thanhnghe173442@fpt.edu.vn', N'NO96gHWPCTMzUV9HmBbpnWPGaFE=', 4, N'Thanh Nguyen', N'0987645623', N'HN', 1)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (14, N'littledeemon133@gmail.com', N'rAFzLv9utBVX8gooFYmAIzFcmsY=', 3, N'Tran Gia Huy', N'0911248447', N'hn', 1)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (18, N'fxxkit456@gmail.com', N'Hq2BPnxxCmzPNoSrN3ugRkvtxmw=', 4, N'Nguyen Gia Thanh', N'0987635214', N'Ha Noi', 1)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (19, N'minhnthe163410@fpt.edu.vn', N'NO96gHWPCTMzUV9HmBbpnWPGaFE=', 1, N'Minh Nguyen', N'0987645241', N'Ha noi', 1)
INSERT [dbo].[account] ([accountID], [email], [password], [roleID], [fullname], [phonenum], [address], [status]) VALUES (20, N'fxxkit456@gmail.com', N'7v7kTpfiAScLObnL3WhcrQzxRBE=', 3, N'Nguyen Thanh', N'0987635214', N'Ha Noi', 0)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[blog] ON 

INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (6, 4, N'Samsung Galaxy A34', N'Samsung has seen continued success with its Galaxy A lineup. The latest additions to the sprawling family are the Galaxy A34 and Galaxy A54. The Samsung Galaxy A54 puts the A5x series back on the right track after a super-successful A52s was followed by more of a meh A53. The Galaxy A34, on its part, elevates the A3X models to new heights and starts to encroach on the territory of its more-expensive sibling seriously.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (6, 5, N'Android 14 Beta 3 is out, Pixel 7a joins the fun', N'Google''''s beta test of the next iteration of its mobile operating system is ongoing, and on schedule. Today the company released Android 14 Beta 3, and this one marks what Google calls "platform stability". This means that the developer APIs and all app-facing behaviors in the OS are now final, and won''''t change until the mass market release.

This is the point where third party app developers will want to work hard to integrate the new features into their apps.', CAST(N'2023-08-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (6, 6, N'Zeiss prescription lenses for Apple''s Vision Pro', N'<p>Apple&#39;&#39;s revolutionary Vision Pro AR/VR headset is still fresh and there are many questions left unanswered. One of those is the price of the prescription lenses for people that need them to use the thing. Well, Bloomberg correspondent Mark Gurman guesses that a pair of Zeiss lenses for the Vision Pro could cost between $300 and $600. It&#39;&#39;s a hefty figure but hardly surprising, considering that Apple sells feet for the Mac Pro for $299, and wheels for the Mac Pro for $699.</p>
', CAST(N'2023-09-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (6, 17, N'The first One UI 5 Watch beta', N'Samsung announced One UI 5 Watch a month ago and the first beta is now out. It is available for the Galaxy Watch4 and Watch4 Classic as well as the Galaxy Watch5 and Watch5 Pro.

If you want to try it out, you need to sign up through the Samsung Members app. There should be a banner inside the app like the one below. Note that the beta is currently available only to users in the US and South Korea.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (6, 18, N'Leak: the Sony WF-1000XM5 buds', N'Sony is expected to launch its next flagship TWS buds soon. There are no official details on the WF-1000XM5, but there are unofficial ones. This generation the focus seems to be on wear comfort and fast charging.

The new buds will be lighter at 5.9g, compared to the fairly hefty 7.3g buds of the XM4 generation. They will be physically smaller too, the combination of the two factors should make them much more comfortable.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (6, 19, N'Our vivo V27 video review is out', N'We enjoyed the V27âs premium dual glass design and color-changing back. The 6.78-inch OLED screen managed an impressive 1,055 nits peak brightness which is on par with most of the recent flagship offerings. Battery endurance is excellent with a 134 hours rating in our test.

MediaTekâs Dimensity 7200 performs admirably with good CPU and GPU scores in benchmarks and great thermal management with little to no throttling. We were also impressed with the photo and video quality from the main cam as well as shots from the 50MP front-facing module.', CAST(N'2023-06-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (7, 20, N'Android 14 Beta 3 is out, Pixel 7a joins the fun', N'Google''s beta test of the next iteration of its mobile operating system is ongoing, and on schedule. Today the company released Android 14 Beta 3, and this one marks what Google calls "platform stability". This means that the developer APIs and all app-facing behaviors in the OS are now final, and won''t change until the mass market release.

This is the point where third party app developers will want to work hard to integrate the new features into their apps.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (7, 22, N'Zeiss prescription lenses for Apple''s Vision Pro', N'Apple''s revolutionary Vision Pro AR/VR headset is still fresh and there are many questions left unanswered. One of those is the price of the prescription lenses for people that need them to use the thing.

Well, Bloomberg correspondent Mark Gurman guesses that a pair of Zeiss lenses for the Vision Pro could cost between $300 and $600. It''s a hefty figure but hardly surprising, considering that Apple sells feet for the Mac Pro for $299, and wheels for the Mac Pro for $699.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (7, 23, N'The first One UI 5 Watch beta', N'<p>Samsung announced One UI 5 Watch a month ago and the first beta is now out. It is available for the Galaxy Watch4 and Watch4 Classic as well as the Galaxy Watch5 and Watch5 Pro. If you want to try it out, you need to sign up through the Samsung Members app. There should be a banner inside the app like the one below. Note that the beta is currently available only to users in the US and South Korea.</p>
', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (7, 24, N'Leak: the Sony WF-1000XM5 buds', N'Sony is expected to launch its next flagship TWS buds soon. There are no official details on the WF-1000XM5, but there are unofficial ones. This generation the focus seems to be on wear comfort and fast charging.

The new buds will be lighter at 5.9g, compared to the fairly hefty 7.3g buds of the XM4 generation. They will be physically smaller too, the combination of the two factors should make them much more comfortable.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (7, 25, N'Our vivo V27 video review is out', N'We enjoyed the V27âs premium dual glass design and color-changing back. The 6.78-inch OLED screen managed an impressive 1,055 nits peak brightness which is on par with most of the recent flagship offerings. Battery endurance is excellent with a 134 hours rating in our test.

MediaTekâs Dimensity 7200 performs admirably with good CPU and GPU scores in benchmarks and great thermal management with little to no throttling. We were also impressed with the photo and video quality from the main cam as well as shots from the 50MP front-facing module.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (7, 26, N'Leak suggests that the global Oppo Reno10 Pro', N'The Oppo Reno10 Pro that launched in China a couple of weeks ago is not the phone that will be sold on the global market – specs shared by leakster@Sudhanshu1414 point to a Snapdragon 778G replacing the Dimensity 8200 of the original model. The old Qualcomm chip is significantly behind its more recent MediaTek rival in CPU and GPU performance.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (7, 27, N'Try the iOS 17 beta for free now ', N'In an interesting turn of events, Apple no longer requires a $99 yearly subscription to test out its latest developer betas meaning anyone can sign up and download the latest version of Apple software completely free of charge. This includes the developer betas for iOS 17, iPadOS 17 as well as macOS Sonoma and watchOS 10. Those of you who want to test out the new software(s) can simply sign up for the Apple Developer Program with your Apple ID.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (7, 28, N'Samsung Galaxy Z Flip5 rumored specs', N'The Motorola Razr 40 Ultra set the new benchmark for cover displays on flip foldables – its 3.6” 1,056 x 1,066px display (413ppi) is about as large as possible, it even has punch holes for the rear cameras. The consensus in the rumor mill is that the Samsung Galaxy Z Flip5 will not be able to match it. Current info suggests that the new Flip will have a 3.4” 720 x 748p (304ppi) display that stops short of the cameras and goes around them with a shallow notch as can be seen in early 3D renders.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (7, 29, N'OnePlus Nord N30 5G review', N'The Nord N30 5G is the latest entry in the Nord N line but is far from an unfamiliar device. The Nord N30 5G is actually the US device name for the OnePlus Nord CE 3 Lite - an identical device meant for Europe and Asia that we''ve already reviewed. Digging a bit deeper, it is not hard to spot the similarities between the Nord N30 5G and the Realme 10 Pro.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (7, 30, N'Samsung Galaxy Z Flip5
', N'Samsung''s new foldables could feature the highest rating for ingress protection out of all other foldables. This is hardly a surprise - up until this year, Samsung was the only maker that achieved water resistance in foldables.
The Galaxy Z Flip5 will improve the rating from IPx8 to IP58, which means that there will be some form of dust protection (that''s the 5), and a high degree of water protection (that''s the 8). Technically, the Galaxy Z Flip5 will be able to take being submerged in 1 meter of water for up to 30 minutes plus an additional depth and time, specified by Samsung itself.
', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (7, 31, N'Samsung Galaxy A34 vs. Samsung Galaxy A54', N'Samsung has seen continued success with its Galaxy A lineup. The latest additions to the sprawling family are the Galaxy A34 and Galaxy A54. The Samsung Galaxy A54 puts the A5x series back on the right track after a super-successful A52s was followed by more of a meh A53. The Galaxy A34, on its part, elevates the A3X models to new heights and starts to encroach on the territory of its more-expensive sibling seriously.The two A-series phones clearly share most of their design language. Samsung decided to model both of these handsets after the Galaxy S23 series this year. That includes the signature trio of separate camera rings on the back. Size-wise, the pair differ noticeably. In a rather peculiar twist this year, the Galaxy A34 has grown considerably. So much so that with a 6.6-inch display, it is now bigger than both its Galaxy A33 5G predecessor and the Galaxy A54. If more screen real estate is what you are after, then the A34 is the obvious choice.', CAST(N'2023-07-10' AS Date), 1)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (10, 32, N'iphone 8', N'<p>aaaaaaa</p>
', CAST(N'2023-11-10' AS Date), 0)
INSERT [dbo].[blog] ([accountID], [blogID], [blogTitle], [blogDetail], [date], [status]) VALUES (13, 33, N'dfdfdfds', N'<p>haha</p>
', CAST(N'2023-11-11' AS Date), 0)
SET IDENTITY_INSERT [dbo].[blog] OFF
GO
SET IDENTITY_INSERT [dbo].[blogImage] ON 

INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (4, 4, N'blog1.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (5, 5, N'blog2.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (6, 6, N'blog3.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (17, 17, N'blog4.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (18, 18, N'blog9.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (19, 19, N'blog16.jpeg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (20, 20, N'blog7.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (21, 22, N'blog8.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (22, 23, N'blog3.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (23, 24, N'blog4.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (24, 25, N'blog5.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (25, 26, N'blog16.jpeg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (26, 27, N'blog11.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (27, 28, N'blog12.png')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (28, 29, N'blog13.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (30, 30, N'blog14.jfif')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (31, 31, N'blog15.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (32, 32, N'blog10.jpg')
INSERT [dbo].[blogImage] ([blogID], [imageID], [url]) VALUES (33, 33, N'blog9.jpg')
SET IDENTITY_INSERT [dbo].[blogImage] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([categoryID], [categoryName], [describe], [catImage]) VALUES (1, N'Iphone', N'Iphone', N'https://media.loveitopcdn.com/3807/logo-apple-1.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [describe], [catImage]) VALUES (2, N'Samsung', N'Samsung', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZLmXpCXZkCm1o2SauDbNW25jl12Blmg5gWbea_rrR4KlXlhskAq4Il8EburQiupmK8q8&usqp=CAU')
INSERT [dbo].[category] ([categoryID], [categoryName], [describe], [catImage]) VALUES (3, N'Oppo', N'Oppo', N'https://i.pinimg.com/originals/e1/7f/6a/e17f6aaf88412663621d1994f8bf0921.jpg')
INSERT [dbo].[category] ([categoryID], [categoryName], [describe], [catImage]) VALUES (4, N'Realme', N'Realme', N'https://upload.wikimedia.org/wikipedia/commons/9/91/Realme_logo.png')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[feedback] ON 

INSERT [dbo].[feedback] ([feedbackID], [productID], [accountID], [fcontent], [date], [isDeleted]) VALUES (1, 1, 8, N'gut', CAST(N'2023-10-20' AS Date), 1)
INSERT [dbo].[feedback] ([feedbackID], [productID], [accountID], [fcontent], [date], [isDeleted]) VALUES (2, 1, 8, N'nice', CAST(N'2023-10-20' AS Date), 1)
INSERT [dbo].[feedback] ([feedbackID], [productID], [accountID], [fcontent], [date], [isDeleted]) VALUES (3, 1, 8, N'nice', CAST(N'2023-10-20' AS Date), 1)
INSERT [dbo].[feedback] ([feedbackID], [productID], [accountID], [fcontent], [date], [isDeleted]) VALUES (4, 2, 12, N'good', CAST(N'2023-11-10' AS Date), 0)
INSERT [dbo].[feedback] ([feedbackID], [productID], [accountID], [fcontent], [date], [isDeleted]) VALUES (5, 2, 13, N'gooo', CAST(N'2023-11-11' AS Date), 1)
SET IDENTITY_INSERT [dbo].[feedback] OFF
GO
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (12, 3, 5997, CAST(N'2023-11-10' AS Date), N'HN', N'', 2, N'Nguyen Thanh', N'0982752566', N'fxxkit456@gmail.com', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (12, 4, 3000, CAST(N'2023-11-10' AS Date), N'HN', N'', 5, N'Nguyen Thanh', N'0982752566', N'fxxkit456@gmail.com', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (12, 5, 1500, CAST(N'2023-11-10' AS Date), N'HN', N'', 1, N'Nguyen Thanh', N'0982752566', N'fxxkit456@gmail.com', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (13, 6, 1999, CAST(N'2023-11-10' AS Date), N'hn', N'nhanh', 5, N'Thanh Nguyen', N'0987645623', N'thanhnghe173442@fpt.edu.vn', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (10, 7, 1999, CAST(N'2023-11-07' AS Date), N'Ha Noi', N'', 2, N'Tran Gia Huy', N'0911248447', N'harrystylesbanhzai@gmail.com', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (9, 8, 1999, CAST(N'2023-11-07' AS Date), N'hanoi', N'', 3, N'gia huy', N'0911248447', N'huytghe176497@fpt.edu.vn', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (12, 9, 2000, CAST(N'2023-11-10' AS Date), N'HN', N'', 1, N'Nguyen Thanh', N'0982752566', N'fxxkit456@gmail.com', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (12, 10, 7500, CAST(N'2023-11-11' AS Date), N'HN', N'', 5, N'Nguyen Thanh', N'0982752566', N'fxxkit456@gmail.com', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (12, 11, 2000, CAST(N'2023-11-11' AS Date), N'HN', N'', 5, N'Nguyen Thanh', N'0982752566', N'fxxkit456@gmail.com', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (12, 12, 5000, CAST(N'2023-11-11' AS Date), N'HN', N'', 1, N'Nguyen Thanh', N'0982752566', N'fxxkit456@gmail.com', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (13, 13, 3998, CAST(N'2023-11-11' AS Date), N'HN', N'nhanh', 1, N'Thanh Nguyen', N'0987645623', N'thanhnghe173442@fpt.edu.vn', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (16, 14, 3998, CAST(N'2023-11-11' AS Date), N'Vp', N'nhanh ', 5, N'Le Trang', N'0978345261', N'trangltths173203@fpt.edu.vn', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (17, 15, 5000, CAST(N'2023-11-11' AS Date), N'HN', N'', 5, N'Minh Nguyen', N'0987645241', N'minhnthe163410@fpt.edu.vn', N'COD')
INSERT [dbo].[order] ([accountID], [orderID], [total], [date], [address], [note], [orderStatusID], [customerName], [phoneNumber], [email], [paymentMethod]) VALUES (19, 16, 2500, CAST(N'2023-11-11' AS Date), N'HN', N'', 5, N'Minh Nguyen', N'0987645241', N'minhnthe163410@fpt.edu.vn', N'COD')
GO
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (7, 2, 1)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (8, 2, 1)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (3, 2, 3)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (4, 8, 3)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (5, 15, 2)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (6, 2, 1)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (7, 17, 1)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (7, 2, 2)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (7, 1, 2)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (7, 1, 4)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (7, 8, 3)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (9, 8, 2)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (11, 8, 2)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (12, 1, 2)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (13, 2, 2)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (14, 2, 2)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (15, 1, 2)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (16, 1, 1)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (7, 1, 1)
INSERT [dbo].[orderInfo] ([orderID], [productID], [quantity]) VALUES (10, 1, 3)
GO
INSERT [dbo].[orderStatus] ([orderStatusID], [orderStatusName]) VALUES (1, N'Pending')
INSERT [dbo].[orderStatus] ([orderStatusID], [orderStatusName]) VALUES (2, N'Delivering')
INSERT [dbo].[orderStatus] ([orderStatusID], [orderStatusName]) VALUES (3, N'Delivered')
INSERT [dbo].[orderStatus] ([orderStatusID], [orderStatusName]) VALUES (4, N'Fail To Delivery')
INSERT [dbo].[orderStatus] ([orderStatusID], [orderStatusName]) VALUES (5, N'Cancel')
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (1, 1, N'iPhone 15', N'<p>Released in 2023, the iPhone 15 features a 5.83-inch Super Retina XDR display with Ceramic Shield front cover, A14 Bionic chip with Neural Engine, dual 12-megapixel rear cameras (wide and ultra-wide) with Night mode and Dolby Vision HDR video recording, 12-megapixel front-facing camera with Night mode and Deep Fusion support, Face ID, and MagSafe wireless charging. It runs on iOS 17.</p>

<h2>SPECIAL CHARACTERISTICS</h2>

<ul>
	<li>Powerful, super-fast with A16 chip, 4GB RAM, high-speed 5G network</li>
	<li>Brilliant, sharp, high brightness - Premium OLED display, Super Retina XDR with HDR10 support, Dolby Vision</li>
	<li>Impressive night photography - Night Mode for 2 cameras, Deep Fusion algorithm, Smart HDR 3</li>
	<li>Outstanding durability - IP68 waterproof, dustproof, Ceramic Shield back panel</li>
</ul>

<p>&nbsp;</p>

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:500px">
	<tbody>
		<tr>
			<td>Screen size</td>
			<td>5.83 inches</td>
		</tr>
		<tr>
			<td>Screen solution</td>
			<td>1170 x 2532 pixels</td>
		</tr>
		<tr>
			<td>Operating system</td>
			<td>iOS 17.1 or higher (Depending on release version)</td>
		</tr>
		<tr>
			<td>Rear camera</td>
			<td>12 MP, f/1.6, 26mm (wide), 1.4&micro;m, dual pixel PDAF, OIS<br />
			12 MP, f/2.4, 120˚, 13mm (ultrawide), 1/3.6&quot;</td>
		</tr>
		<tr>
			<td>Front camera</td>
			<td>12 MP, f/2.2, 23mm (wide), 1/3.6&quot;<br />
			SL 3D, (depth/biometrics sensor)</td>
		</tr>
		<tr>
			<td>RAM</td>
			<td>6GB</td>
		</tr>
		<tr>
			<td>ROM</td>
			<td>128GB</td>
		</tr>
		<tr>
			<td>SIM</td>
			<td>Dual SIM (nano‑SIM and eSIM)</td>
		</tr>
		<tr>
			<td>Pin</td>
			<td>Li-Ion, 20W fast charging, 15W wireless charging, USB Power Delivery 2.0</td>
		</tr>
		<tr>
			<td>Chipset</td>
			<td>Apple A14 Bionic (5 nm)</td>
		</tr>
		<tr>
			<td>Sensor</td>
			<td>Face ID, accelerometer, proximity sensor, gyroscope, light sensor</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', 2500, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (2, 2, N'Samsung S23 Ultra', N'<p>Samsung S23 Ultra is the second</p>
', 1999, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (3, 3, N'Oppo A57', N'Oppo A57 is the third', 1000, 0)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (7, 2, N'Samsung Galaxy Z Flip3 ', N'<p><strong>SPECIAL CHARACTERISTICS</strong><br />
Unique convenient design, asserting class - Clamshell folding design, solid aluminum frame<br />
Impressive dual screen - Main screen: 6.7&quot;, secondary screen: 1.9&quot; AMOLED<br />
Super impressive camera system - Set of 3 12MP camera lenses, sharp selfie camera<br />
Impressive performance, master the speed - Snapdragon 888 combines 8GB RAM, 5G support</p>

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:500px">
	<tbody>
		<tr>
			<td>Screen&nbsp;</td>
			<td>Super Amoled</td>
		</tr>
		<tr>
			<td>Screen feature</td>
			<td>Main screen: 6.7&quot; 2640 x 1080 425ppi , FHD+ Dynamic AMOLED 2X Display (22:9), 120Hz<br />
			Secondary display: 1.9&quot; Super AMOLED, 260 x 512 302ppi</td>
		</tr>
		<tr>
			<td>Scan frequency</td>
			<td>120HZ</td>
		</tr>
		<tr>
			<td>Rear camera</td>
			<td>Super wide-angle camera: 12MP, f/2.2, Dual Pixel AF, OIS<br />
			Wide-angle camera: 12MP, f/1.8</td>
		</tr>
		<tr>
			<td>Front camera</td>
			<td>10MP wide angle, f/2.4</td>
		</tr>
		<tr>
			<td>RAM</td>
			<td>8GB</td>
		</tr>
		<tr>
			<td>ROM</td>
			<td>128GB</td>
		</tr>
		<tr>
			<td>Chipset</td>
			<td>Snapdragon 888 8 (5nm)</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', 1100, 0)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (8, 1, N'iPhone 13', N'<p>Not yet released, but rumored to be coming in late 2021 or early 2022. It is expected to feature an improved A15 Bionic chip, upgraded cameras with improved zoom capabilities and a cinematic video mode, smaller notch design, always-on display, and potentially satellite communication capabilities.</p>

<h2>SPECIAL CHARACTERISTICS</h2>

<ul>
	<li>Outstanding performance - Powerful Apple A15 Bionic chip, supports high-speed 5G network</li>
	<li>Vibrant display space - 6.1&quot; Super Retina XDR display with high brightness and sharpness</li>
	<li>The ultimate cinematic experience - 12MP dual cameras with optical image stabilization</li>
	<li>Power optimization - 20W fast charge, 50% full battery in about 30 minutes</li>
</ul>

<p>&nbsp;</p>

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:500px">
	<tbody>
		<tr>
			<td>Screen size</td>
			<td>6.1 inches</td>
		</tr>
		<tr>
			<td>Operating system</td>
			<td>iOS 15</td>
		</tr>
		<tr>
			<td>Screen technology</td>
			<td>Super Retina XDR OLED</td>
		</tr>
		<tr>
			<td>Rear camera</td>
			<td>Wide-angle camera: 12MP, f/1.6<br />
			Ultra-wide-angle camera: 12MP, /2.4</td>
		</tr>
		<tr>
			<td>Front camera</td>
			<td>12MP, f/2.2</td>
		</tr>
		<tr>
			<td>RAM</td>
			<td>4GB</td>
		</tr>
		<tr>
			<td>ROM</td>
			<td>128GB</td>
		</tr>
		<tr>
			<td>SIM</td>
			<td>Dual SIM (nano‑SIM and eSIM)</td>
		</tr>
		<tr>
			<td>PIN</td>
			<td>3240mAh</td>
		</tr>
		<tr>
			<td>Chipset</td>
			<td>Apple A15</td>
		</tr>
	</tbody>
</table>
', 1000, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (12, 1, N'iPhone 12', N'<p>Released in 2020, the iPhone 12 features a 6.1-inch Super Retina XDR display with Ceramic Shield front cover, A14 Bionic chip with Neural Engine, dual 12-megapixel rear cameras (wide and ultra-wide) with Night mode and Dolby Vision HDR video recording, 12-megapixel front-facing camera with Night mode and Deep Fusion support, Face ID, and MagSafe wireless charging. It runs on iOS 14.</p>

<h2>SPECIAL CHARACTERISTICS</h2>

<ul>
	<li>Powerful, super-fast with A14 chip, 4GB RAM, high-speed 5G network</li>
	<li>Brilliant, sharp, high brightness - Premium OLED display, Super Retina XDR with HDR10 support, Dolby Vision</li>
	<li>Impressive night photography - Night Mode for 2 cameras, Deep Fusion algorithm, Smart HDR 3</li>
	<li>Outstanding durability - IP68 waterproof, dustproof, Ceramic Shield back panel</li>
</ul>

<p>&nbsp;</p>

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:500px">
	<tbody>
		<tr>
			<td>Screen size</td>
			<td>6.1 inches</td>
		</tr>
		<tr>
			<td>Screen solution</td>
			<td>1170 x 2532 pixels</td>
		</tr>
		<tr>
			<td>Operating system</td>
			<td>iOS 14.1 or higher (Depending on release version)</td>
		</tr>
		<tr>
			<td>Rear camera</td>
			<td>12 MP, f/1.6, 26mm (wide), 1.4&micro;m, dual pixel PDAF, OIS<br />
			12 MP, f/2.4, 120˚, 13mm (ultrawide), 1/3.6&quot;</td>
		</tr>
		<tr>
			<td>Front camera</td>
			<td>12 MP, f/2.2, 23mm (wide), 1/3.6&quot;<br />
			SL 3D, (depth/biometrics sensor)</td>
		</tr>
		<tr>
			<td>RAM</td>
			<td>4GB</td>
		</tr>
		<tr>
			<td>ROM</td>
			<td>64GB</td>
		</tr>
		<tr>
			<td>SIM</td>
			<td>Dual SIM (nano‑SIM and eSIM)</td>
		</tr>
		<tr>
			<td>Pin</td>
			<td>Li-Ion, 20W fast charging, 15W wireless charging, USB Power Delivery 2.0</td>
		</tr>
		<tr>
			<td>Chipset</td>
			<td>Apple A14 Bionic (5 nm)</td>
		</tr>
		<tr>
			<td>Sensor</td>
			<td>Face ID, accelerometer, proximity sensor, gyroscope, light sensor</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', 850, 0)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (15, 1, N'iPhone 11', N'<p>Released in 2019, the iPhone 11 features a 6.1-inch Liquid Retina display with True Tone technology, A13 Bionic chip with Neural Engine, dual 12-megapixel rear cameras (wide and ultra-wide) with Night mode and 4K video recording, 12-megapixel front-facing camera with slow-motion video support, Face ID, and wireless charging. It runs on iOS 13 and is upgradable to iOS 14. aaa</p>

<h2>SPECIAL CHARACTERISTICS</h2>

<ul>
	<li>Colors to match your personality - 6 eye-catching colors to choose from</li>
	<li>Smooth, stable performance - A13 chip, 4GB RAM</li>
	<li>Capture the full frame - Dual camera supports wide angle, Night Mode</li>
	<li>Peace of mind - IP68 waterproof, dustproof, Gorilla tempered glass</li>
</ul>

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:500px">
	<tbody>
		<tr>
			<td>Screen size</td>
			<td>6.1 inches</td>
		</tr>
		<tr>
			<td>Screen resolution</td>
			<td>1792 x 828 pixels</td>
		</tr>
		<tr>
			<td>Operating system</td>
			<td>iOS 13 or higher (Depending on release version)</td>
		</tr>
		<tr>
			<td>Screen technology</td>
			<td>IPS LCD</td>
		</tr>
		<tr>
			<td>Rear camera</td>
			<td>Dual 12MP cameras:<br />
			- Wide-angle camera: &fnof;/1.8 aperture<br />
			- Ultra-wide camera: &fnof;/2.4 aperture</td>
		</tr>
		<tr>
			<td>Front camera</td>
			<td>12 MP, /2.2 aperture</td>
		</tr>
		<tr>
			<td>RAM</td>
			<td>4GB</td>
		</tr>
		<tr>
			<td>ROM</td>
			<td>64GB</td>
		</tr>
		<tr>
			<td>SIM</td>
			<td>Nano-SIM + eSIM</td>
		</tr>
		<tr>
			<td>The battery</td>
			<td>3110 mAh</td>
		</tr>
		<tr>
			<td>Chipset</td>
			<td>A13 Bionic</td>
		</tr>
		<tr>
			<td>Sensor</td>
			<td>FaceID, Gyroscope, Accelerometer, Proximity sensor, Ambient light sensor</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 964, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (17, 2, N'Samsung Galaxy ZFold 4', N'NETWORK	Technology	
GSM / CDMA / HSPA / EVDO / LTE / 5G
LAUNCH	Announced	2022, August 10
Status	Available. Released 2022, August 25
BODY	Dimensions	Unfolded: 155.1 x 130.1 x 6.3 mm
Folded: 155.1 x 67.1 x 14.2-15.8 mm
Weight	263 g (9.28 oz)
Build	Glass front (Gorilla Glass Victus+) (folded), plastic front (unfolded), glass back (Gorilla Glass Victus+), aluminum frame
SIM	Nano-SIM and eSIM or Dual SIM (2 Nano-SIMs and eSIM, dual stand-by)
 	IPX8 water resistant (up to 1.5m for 30 min)
Armor aluminum frame with tougher drop and scratch resistance (advertised)
Stylus support
DISPLAY	Type	Foldable Dynamic AMOLED 2X, 120Hz, HDR10+, 1200 nits (peak)
Size	7.6 inches, 183.2 cm2 (~90.9% screen-to-body ratio)
Resolution	1812 x 2176 pixels (~373 ppi density)
 	Cover display:
Dynamic AMOLED 2X, 120Hz, Corning Gorilla Glass Victus+
6.2 inches, 904 x 2316 pixels, 23.1:9 ratio
PLATFORM	OS	Android 12L, upgradable to Android 13, One UI 5.1.1
Chipset	Qualcomm SM8475 Snapdragon 8+ Gen 1 (4 nm)
CPU	Octa-core (1x3.19 GHz Cortex-X2 & 3x2.75 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510)
GPU	Adreno 730
MEMORY	Card slot	No
Internal	256GB 12GB RAM, 512GB 12GB RAM, 1TB 12GB RAM
 	UFS 3.1
MAIN CAMERA	Triple	50 MP, f/1.8, 23mm (wide), 1.0µm, Dual Pixel PDAF, OIS
10 MP, f/2.4, 66mm (telephoto), 1.0µm, PDAF, OIS, 3x optical zoom
12 MP, f/2.2, 123˚, 12mm (ultrawide), 1.12µm
Features	LED flash, HDR, panorama
Video	8K@24fps, 4K@60fps, 1080p@60/240fps (gyro-EIS), 720p@960fps (gyro-EIS), HDR10+
SELFIE CAMERA	Single	4 MP, f/1.8, 26mm (wide), 2.0µm, under display
Cover camera:
10 MP, f/2.2, 24mm (wide), 1/3", 1.22µm
Features	HDR
Video	4K@30/60fps, 1080p@30/60fps, gyro-EIS
SOUND	Loudspeaker	Yes, with stereo speakers
3.5mm jack	No
 	32-bit/384kHz audio
Tuned by AKG
COMMS	WLAN	Wi-Fi 802.11 a/b/g/n/ac/6e, dual-band, Wi-Fi Direct
Bluetooth	5.2, A2DP, LE, aptX HD
Positioning	GPS, GLONASS, GALILEO, BDS
NFC	Yes
Radio	No
USB	USB Type-C 3.2, OTG
FEATURES	Sensors	Fingerprint (side-mounted), accelerometer, gyro, proximity, compass, barometer
 	Samsung DeX (desktop experience support)
Ultra Wideband (UWB) support
BATTERY	Type	Li-Po 4400 mAh, non-removable
Charging	25W wired, 50% in 30 min (advertised)
15W wireless
4.5W reverse wireless
MISC	Colors	Graygreen, Phantom Black, Beige, Burgundy
Models	SM-F936B, SM-F936B/DS, SM-F936U, SM-F936U1, SM-F936N, SM-F936W, SM-F9360
SAR	0.96 W/kg (head)     0.92 W/kg (body)    
SAR EU	1.30 W/kg (head)     1.51 W/kg (body)    
Price	$ 949.99 / € 889.90 / £ 750.00 / ₹ 131,747
TESTS	Performance	AnTuTu: 964530 (v9)
GeekBench: 3981 (v5.1)
GFXBench: 43fps (ES 3.1 onscreen)
Display	Contrast ratio: Infinite (nominal)
Camera	Photo / Video
Loudspeaker	-28.3 LUFS (Average)
Battery life	
Endurance rating 101h', 999, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (18, 1, N'Iphone X', N'<p>Released in 2017, the iPhone X features a 5.8-inch Super Retina display with HDR and True Tone technology, A11 Bionic chip with Neural Engine, dual 12-megapixel rear cameras with optical image stabilization, 7-megapixel front-facing camera with Retina Flash, Face ID, and wireless charging. It runs on iOS 11 and is upgradable to iOS 14.</p>

<table border="1" cellpadding="1" cellspacing="1" style="width:500px">
	<tbody>
		<tr>
			<td>Screen size</td>
			<td>5.8 inches</td>
		</tr>
		<tr>
			<td>Screen resolution</td>
			<td><br />
			1125 x 2436 pixels</td>
		</tr>
		<tr>
			<td>
			<p>Operating system</p>
			</td>
			<td>11</td>
		</tr>
		<tr>
			<td>Rear camera</td>
			<td>12 MP (f/1.8, 28mm) + 12 MP (f/2.4, 52mm), phase detection autofocus, 2x optical zoom, OIS, 4 LED flash (2 tone)</td>
		</tr>
		<tr>
			<td>
			<p>Front camera</p>
			</td>
			<td>7 MP (f/2.2, 32mm), 1080p@30fps, 720p@240fps, face detection, HDR</td>
		</tr>
		<tr>
			<td>ROM</td>
			<td>256GB</td>
		</tr>
		<tr>
			<td>SIM</td>
			<td>NANO-SIM</td>
		</tr>
		<tr>
			<td>Pin</td>
			<td>Li-ion 2716 mAh</td>
		</tr>
		<tr>
			<td>Chipset</td>
			<td>Apple A11 Bionic APL1W72</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', 499, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (20, 3, N'Oppo Find X', N'Oppo Find X is 10th', 450, 0)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (21, 4, N'Realme 8 OP', N'Realme is 10th', 450, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (22, 2, N'Realme 9 ', N'<p>Realme 9 series is 12th aaaa</p>
', 1078, 1)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (23, 1, N'iphone 8', N'<p>very nice</p>
', 1000, 0)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (24, 2, N'Iphone 16', N'<p>bbbb</p>
', 90000, 0)
INSERT [dbo].[product] ([productID], [categoryID], [productName], [details], [price], [status]) VALUES (25, 1, N'Iphone XS', N'<p>aaaasfsf</p>
', 1996, 0)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[productImage] ON 

INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (1, 1, N'iphone15pro.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (2, 2, N's23ultra.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (3, 3, N'oppoa57.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (7, 11, N'sszflip3.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (8, 12, N'ip14prm.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (15, 13, N'ip13prm.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (12, 14, N'ip12.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (17, 15, N'sszfold4.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (18, 16, N'ipx.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (20, 17, N'oppofindx.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (21, 18, N'rm8.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (22, 19, N'ip14prm.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (23, 20, N'ip8.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (24, 21, N'ip14.jpeg')
INSERT [dbo].[productImage] ([productID], [imageID], [url]) VALUES (25, 22, N'rmx.jpeg')
SET IDENTITY_INSERT [dbo].[productImage] OFF
GO
SET IDENTITY_INSERT [dbo].[reply] ON 

INSERT [dbo].[reply] ([replyID], [content], [accountID], [feedbackID], [date], [isDeleted]) VALUES (1, N'nice', 8, 1, CAST(N'2023-10-20' AS Date), 0)
INSERT [dbo].[reply] ([replyID], [content], [accountID], [feedbackID], [date], [isDeleted]) VALUES (2, N'nice', 8, 1, CAST(N'2023-10-20' AS Date), 1)
INSERT [dbo].[reply] ([replyID], [content], [accountID], [feedbackID], [date], [isDeleted]) VALUES (3, N'thank you', 12, 4, CAST(N'2023-11-10' AS Date), 0)
INSERT [dbo].[reply] ([replyID], [content], [accountID], [feedbackID], [date], [isDeleted]) VALUES (4, N'thank you', 13, 3, CAST(N'2023-11-11' AS Date), 1)
SET IDENTITY_INSERT [dbo].[reply] OFF
GO
INSERT [dbo].[role] ([roleID], [roleName]) VALUES (1, N'admin')
INSERT [dbo].[role] ([roleID], [roleName]) VALUES (2, N'customer')
INSERT [dbo].[role] ([roleID], [roleName]) VALUES (3, N'sale')
INSERT [dbo].[role] ([roleID], [roleName]) VALUES (4, N'marketing')
GO
ALTER TABLE [dbo].[feedback] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[reply] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[reply] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[role] ([roleID])
GO
ALTER TABLE [dbo].[blog]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[blogImage]  WITH CHECK ADD FOREIGN KEY([imageID])
REFERENCES [dbo].[blog] ([blogID])
GO
ALTER TABLE [dbo].[cartDetail]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[cartDetail]  WITH CHECK ADD  CONSTRAINT [FK_cartDetail_product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[cartDetail] CHECK CONSTRAINT [FK_cartDetail_product]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[like]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[like]  WITH CHECK ADD FOREIGN KEY([feedbackID])
REFERENCES [dbo].[feedback] ([feedbackID])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([orderStatusID])
REFERENCES [dbo].[orderStatus] ([orderStatusID])
GO
ALTER TABLE [dbo].[orderInfo]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[order] ([orderID])
GO
ALTER TABLE [dbo].[orderInfo]  WITH CHECK ADD  CONSTRAINT [FK_OrderInfo_product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[orderInfo] CHECK CONSTRAINT [FK_OrderInfo_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[category] ([categoryID])
GO
ALTER TABLE [dbo].[productImage]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[reply]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[reply]  WITH CHECK ADD FOREIGN KEY([feedbackID])
REFERENCES [dbo].[feedback] ([feedbackID])
GO
