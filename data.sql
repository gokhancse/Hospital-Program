USE [proje]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 12/17/2013 21:32:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [varchar](50) NOT NULL,
	[Place] [int] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON
INSERT [dbo].[Departments] ([DepartmentID], [Department], [Place], [Price]) VALUES (1, N'Dahiliye', 1, 10)
INSERT [dbo].[Departments] ([DepartmentID], [Department], [Place], [Price]) VALUES (2, N'Çocuk', 1, 30)
INSERT [dbo].[Departments] ([DepartmentID], [Department], [Place], [Price]) VALUES (3, N'Kadın Doğum', 2, 30)
INSERT [dbo].[Departments] ([DepartmentID], [Department], [Place], [Price]) VALUES (4, N'Acil', 3, 0)
INSERT [dbo].[Departments] ([DepartmentID], [Department], [Place], [Price]) VALUES (5, N'BoioKimya Laboratuarı', 4, 50)
INSERT [dbo].[Departments] ([DepartmentID], [Department], [Place], [Price]) VALUES (6, N'Acil Laboratuar', 3, 0)
INSERT [dbo].[Departments] ([DepartmentID], [Department], [Place], [Price]) VALUES (7, N'Müdür', 0, 0)
INSERT [dbo].[Departments] ([DepartmentID], [Department], [Place], [Price]) VALUES (8, N'Müdür Yardımcısı', 0, 0)
INSERT [dbo].[Departments] ([DepartmentID], [Department], [Place], [Price]) VALUES (9, N'BaşHekim', 0, 0)
INSERT [dbo].[Departments] ([DepartmentID], [Department], [Place], [Price]) VALUES (10, N'BaşHemşire', 0, 0)
SET IDENTITY_INSERT [dbo].[Departments] OFF
/****** Object:  Table [dbo].[Ambulance]    Script Date: 12/17/2013 21:32:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ambulance](
	[Plate] [varchar](50) NOT NULL,
	[Driver] [text] NULL,
	[CarModel] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Plate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 12/17/2013 21:32:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Managers](
	[Namesurname] [text] NULL,
	[TCNo] [varchar](20) NOT NULL,
	[Department] [varchar](50) NULL,
	[StartingDate] [datetime] NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TCNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Managers] ([Namesurname], [TCNo], [Department], [StartingDate], [Salary]) VALUES (N'Recep Çakman', N'144544', N'7', CAST(0x0000806800000000 AS DateTime), 10000)
INSERT [dbo].[Managers] ([Namesurname], [TCNo], [Department], [StartingDate], [Salary]) VALUES (N'Mehmet Işık', N'29998866671144', N'9', CAST(0x000081CC00000000 AS DateTime), 6000)
INSERT [dbo].[Managers] ([Namesurname], [TCNo], [Department], [StartingDate], [Salary]) VALUES (N'Volkan Demir', N'544111', N'8', CAST(0x000084B000000000 AS DateTime), 8000)
INSERT [dbo].[Managers] ([Namesurname], [TCNo], [Department], [StartingDate], [Salary]) VALUES (N'Merve Uz', N'55555555', N'10', CAST(0x0000A00700000000 AS DateTime), 1000)
/****** Object:  Table [dbo].[Staff]    Script Date: 12/17/2013 21:32:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[Namesurname] [text] NULL,
	[TCNo] [varchar](20) NOT NULL,
	[WorkingFloor] [int] NULL,
	[StartingDate] [datetime] NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TCNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Staff] ([Namesurname], [TCNo], [WorkingFloor], [StartingDate], [Salary]) VALUES (N'Zülküf Çoban', N'12121212', 5, CAST(0x0000A19300000000 AS DateTime), 2000)
/****** Object:  Table [dbo].[Nurses]    Script Date: 12/17/2013 21:32:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nurses](
	[Namesurname] [text] NULL,
	[TCNo] [varchar](20) NOT NULL,
	[Department] [int] NULL,
	[StartingDate] [datetime] NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TCNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Nurses] ([Namesurname], [TCNo], [Department], [StartingDate], [Salary]) VALUES (N'Merve Uz', N'55555555', 3, CAST(0x0000A00700000000 AS DateTime), 1000)
INSERT [dbo].[Nurses] ([Namesurname], [TCNo], [Department], [StartingDate], [Salary]) VALUES (N'Ayşe Fatma', N'88888888', 2, CAST(0x0000A17700000000 AS DateTime), 1000)
INSERT [dbo].[Nurses] ([Namesurname], [TCNo], [Department], [StartingDate], [Salary]) VALUES (N'Aylin Kaya', N'99999999', 1, CAST(0x0000A17400000000 AS DateTime), 1000)
/****** Object:  Table [dbo].[Doctors]    Script Date: 12/17/2013 21:32:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctors](
	[NameSurname] [text] NULL,
	[TCNo] [varchar](20) NOT NULL,
	[Department] [int] NULL,
	[StartingDate] [datetime] NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TCNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Doctors] ([NameSurname], [TCNo], [Department], [StartingDate], [Salary]) VALUES (N'Ahmet Hakan', N'2222111144', 1, CAST(0x0000902D00000000 AS DateTime), 4500)
INSERT [dbo].[Doctors] ([NameSurname], [TCNo], [Department], [StartingDate], [Salary]) VALUES (N'Ali Veli', N'223244421144', 2, CAST(0x0000A0F000000000 AS DateTime), 3000)
INSERT [dbo].[Doctors] ([NameSurname], [TCNo], [Department], [StartingDate], [Salary]) VALUES (N'Mehmet Işık', N'29998866671144', 1, CAST(0x000081CC00000000 AS DateTime), 6000)
/****** Object:  Table [dbo].[EmergencyService]    Script Date: 12/17/2013 21:32:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmergencyService](
	[Date] [datetime] NOT NULL,
	[DoctorID] [varchar](20) NULL,
	[NursesID] [varchar](20) NULL,
 CONSTRAINT [PK_EmergencyService] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [fk_Doctors_Department]    Script Date: 12/17/2013 21:32:51 ******/
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [fk_Doctors_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [fk_Doctors_Department]
GO
/****** Object:  ForeignKey [fk_EmergencyService_Department]    Script Date: 12/17/2013 21:32:51 ******/
ALTER TABLE [dbo].[EmergencyService]  WITH CHECK ADD  CONSTRAINT [fk_EmergencyService_Department] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([TCNo])
GO
ALTER TABLE [dbo].[EmergencyService] CHECK CONSTRAINT [fk_EmergencyService_Department]
GO
/****** Object:  ForeignKey [fk_EmergencyService_NursesID]    Script Date: 12/17/2013 21:32:51 ******/
ALTER TABLE [dbo].[EmergencyService]  WITH CHECK ADD  CONSTRAINT [fk_EmergencyService_NursesID] FOREIGN KEY([NursesID])
REFERENCES [dbo].[Nurses] ([TCNo])
GO
ALTER TABLE [dbo].[EmergencyService] CHECK CONSTRAINT [fk_EmergencyService_NursesID]
GO
/****** Object:  ForeignKey [fk_Nurses_Department]    Script Date: 12/17/2013 21:32:51 ******/
ALTER TABLE [dbo].[Nurses]  WITH CHECK ADD  CONSTRAINT [fk_Nurses_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Nurses] CHECK CONSTRAINT [fk_Nurses_Department]
GO
