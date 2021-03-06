USE [master]
GO
/****** Object:  Database [Alibaba]    Script Date: 1/2/2022 11:14:19 PM ******/
CREATE DATABASE [Alibaba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Alibaba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Alibaba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Alibaba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Alibaba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Alibaba] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Alibaba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Alibaba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Alibaba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Alibaba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Alibaba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Alibaba] SET ARITHABORT OFF 
GO
ALTER DATABASE [Alibaba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Alibaba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Alibaba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Alibaba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Alibaba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Alibaba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Alibaba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Alibaba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Alibaba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Alibaba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Alibaba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Alibaba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Alibaba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Alibaba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Alibaba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Alibaba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Alibaba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Alibaba] SET RECOVERY FULL 
GO
ALTER DATABASE [Alibaba] SET  MULTI_USER 
GO
ALTER DATABASE [Alibaba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Alibaba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Alibaba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Alibaba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Alibaba] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Alibaba', N'ON'
GO
ALTER DATABASE [Alibaba] SET QUERY_STORE = OFF
GO
USE [Alibaba]
GO
/****** Object:  User [test1]    Script Date: 1/2/2022 11:14:19 PM ******/
CREATE USER [test1] FOR LOGIN [test1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[AirlineCompany]    Script Date: 1/2/2022 11:14:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirlineCompany](
	[AirlineID] [bigint] NOT NULL,
	[AirlineName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AirlineCompany] PRIMARY KEY CLUSTERED 
(
	[AirlineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 1/2/2022 11:14:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[AirportID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Airport] PRIMARY KEY CLUSTERED 
(
	[AirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusCompany]    Script Date: 1/2/2022 11:14:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusCompany](
	[BusCompanyID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BusCompany] PRIMARY KEY CLUSTERED 
(
	[BusCompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusTrip]    Script Date: 1/2/2022 11:14:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusTrip](
	[BusTripID] [bigint] NOT NULL,
	[FinalStop] [nvarchar](50) NOT NULL,
	[OriginTerminal] [nvarchar](50) NOT NULL,
	[IsNonStop] [bit] NOT NULL,
	[BusCompanyID] [bigint] NOT NULL,
 CONSTRAINT [PK_BusTrip] PRIMARY KEY CLUSTERED 
(
	[BusTripID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facility]    Script Date: 1/2/2022 11:14:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facility](
	[FacilityID] [bigint] NOT NULL,
	[FacilityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Facility] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FlightID] [bigint] NOT NULL,
	[TicketType] [nvarchar](30) NOT NULL,
	[IsOneWay] [bit] NOT NULL,
	[ArrivalTime] [datetime] NULL,
	[ReturnFlightID] [bigint] NULL,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[FlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightAirline]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightAirline](
	[FlightAirlineID] [bigint] NOT NULL,
	[FlightID] [bigint] NOT NULL,
	[AirlineID] [bigint] NOT NULL,
 CONSTRAINT [PK_FlightAirline] PRIMARY KEY CLUSTERED 
(
	[FlightAirlineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForeignFlight]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForeignFlight](
	[ForeignFlightID] [bigint] NOT NULL,
	[FlightDuration] [numeric](6, 2) NOT NULL,
	[NumberOfStops] [int] NOT NULL,
 CONSTRAINT [PK_ForeignFlight] PRIMARY KEY CLUSTERED 
(
	[ForeignFlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForeignFlightAirport]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForeignFlightAirport](
	[ForeignFlightAirportID] [bigint] NOT NULL,
	[ForeignFlightID] [bigint] NOT NULL,
	[AirportID] [bigint] NOT NULL,
	[Duration] [numeric](6, 2) NOT NULL,
 CONSTRAINT [PK_ForeignFlightAirport] PRIMARY KEY CLUSTERED 
(
	[ForeignFlightAirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](300) NULL,
	[MinPrice] [numeric](15, 3) NOT NULL,
	[MaxPrice] [numeric](15, 3) NOT NULL,
	[Rating] [numeric](3, 2) NULL,
	[Popularity] [numeric](4, 2) NULL,
	[ResidenceType] [nvarchar](30) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelFacility]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelFacility](
	[HotelFacilityID] [bigint] NOT NULL,
	[HotelID] [bigint] NOT NULL,
	[FacilityID] [bigint] NOT NULL,
 CONSTRAINT [PK_HotelFacility] PRIMARY KEY CLUSTERED 
(
	[HotelFacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelReserve]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelReserve](
	[ReserveID] [bigint] NOT NULL,
	[CheckInDate] [date] NOT NULL,
	[CheckOutDate] [date] NOT NULL,
	[Price] [numeric](15, 3) NOT NULL,
	[PassengerCount] [int] NOT NULL,
	[NumberOfRooms] [int] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[HotelID] [bigint] NOT NULL,
 CONSTRAINT [PK_HotelReserve] PRIMARY KEY CLUSTERED 
(
	[ReserveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InlandFlight]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InlandFlight](
	[InlandFlightID] [bigint] NOT NULL,
 CONSTRAINT [PK_InlandFlight] PRIMARY KEY CLUSTERED 
(
	[InlandFlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [bigint] NOT NULL,
	[IsVip] [bit] NOT NULL,
	[NumberOfBeds] [int] NOT NULL,
	[BAndB] [bit] NOT NULL,
	[HotelID] [bigint] NOT NULL,
	[HotelReserveID] [bigint] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[TransID] [bigint] NOT NULL,
	[TransTime] [datetime] NOT NULL,
	[Amount] [numeric](15, 3) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[UserID] [bigint] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[TransID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trip]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trip](
	[TripID] [bigint] NOT NULL,
	[Origin] [nvarchar](50) NOT NULL,
	[Destination] [nvarchar](50) NOT NULL,
	[DepartureTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Trip] PRIMARY KEY CLUSTERED 
(
	[TripID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripReserve]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripReserve](
	[ReserveID] [bigint] NOT NULL,
	[ReserveNumber] [varchar](30) NOT NULL,
	[PassengerCount] [int] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[TripID] [bigint] NOT NULL,
	[Price] [numeric](15, 3) NOT NULL,
 CONSTRAINT [PK_TripReserve] PRIMARY KEY CLUSTERED 
(
	[ReserveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/2/2022 11:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Credit] [numeric](15, 3) NOT NULL,
	[NationalCode] [varchar](20) NOT NULL,
	[Gender] [bit] NOT NULL,
	[DateOfBirth] [date] NULL,
	[Telephone] [varchar](30) NULL,
	[AccountNumber] [varchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BusTrip]  WITH CHECK ADD  CONSTRAINT [FK_BusTrip_BusCompany] FOREIGN KEY([BusCompanyID])
REFERENCES [dbo].[BusCompany] ([BusCompanyID])
GO
ALTER TABLE [dbo].[BusTrip] CHECK CONSTRAINT [FK_BusTrip_BusCompany]
GO
ALTER TABLE [dbo].[BusTrip]  WITH CHECK ADD  CONSTRAINT [FK_BusTrip_Trip] FOREIGN KEY([BusTripID])
REFERENCES [dbo].[Trip] ([TripID])
GO
ALTER TABLE [dbo].[BusTrip] CHECK CONSTRAINT [FK_BusTrip_Trip]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Flight] FOREIGN KEY([ReturnFlightID])
REFERENCES [dbo].[Flight] ([FlightID])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Flight]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Trip] FOREIGN KEY([FlightID])
REFERENCES [dbo].[Trip] ([TripID])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Trip]
GO
ALTER TABLE [dbo].[FlightAirline]  WITH CHECK ADD  CONSTRAINT [FK_FlightAirline_AirlineCompany] FOREIGN KEY([AirlineID])
REFERENCES [dbo].[AirlineCompany] ([AirlineID])
GO
ALTER TABLE [dbo].[FlightAirline] CHECK CONSTRAINT [FK_FlightAirline_AirlineCompany]
GO
ALTER TABLE [dbo].[FlightAirline]  WITH CHECK ADD  CONSTRAINT [FK_FlightAirline_Flight] FOREIGN KEY([FlightID])
REFERENCES [dbo].[Flight] ([FlightID])
GO
ALTER TABLE [dbo].[FlightAirline] CHECK CONSTRAINT [FK_FlightAirline_Flight]
GO
ALTER TABLE [dbo].[ForeignFlight]  WITH CHECK ADD  CONSTRAINT [FK_ForeignFlight_Flight] FOREIGN KEY([ForeignFlightID])
REFERENCES [dbo].[Flight] ([FlightID])
GO
ALTER TABLE [dbo].[ForeignFlight] CHECK CONSTRAINT [FK_ForeignFlight_Flight]
GO
ALTER TABLE [dbo].[ForeignFlightAirport]  WITH CHECK ADD  CONSTRAINT [FK_ForeignFlightAirport_Airport] FOREIGN KEY([AirportID])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[ForeignFlightAirport] CHECK CONSTRAINT [FK_ForeignFlightAirport_Airport]
GO
ALTER TABLE [dbo].[ForeignFlightAirport]  WITH CHECK ADD  CONSTRAINT [FK_ForeignFlightAirport_ForeignFlight] FOREIGN KEY([ForeignFlightID])
REFERENCES [dbo].[ForeignFlight] ([ForeignFlightID])
GO
ALTER TABLE [dbo].[ForeignFlightAirport] CHECK CONSTRAINT [FK_ForeignFlightAirport_ForeignFlight]
GO
ALTER TABLE [dbo].[HotelFacility]  WITH CHECK ADD  CONSTRAINT [FK_HotelFacility_Facility] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facility] ([FacilityID])
GO
ALTER TABLE [dbo].[HotelFacility] CHECK CONSTRAINT [FK_HotelFacility_Facility]
GO
ALTER TABLE [dbo].[HotelFacility]  WITH CHECK ADD  CONSTRAINT [FK_HotelFacility_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[HotelFacility] CHECK CONSTRAINT [FK_HotelFacility_Hotel]
GO
ALTER TABLE [dbo].[HotelReserve]  WITH CHECK ADD  CONSTRAINT [FK_HotelReserve_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[HotelReserve] CHECK CONSTRAINT [FK_HotelReserve_Hotel]
GO
ALTER TABLE [dbo].[HotelReserve]  WITH CHECK ADD  CONSTRAINT [FK_HotelReserve_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[HotelReserve] CHECK CONSTRAINT [FK_HotelReserve_User]
GO
ALTER TABLE [dbo].[InlandFlight]  WITH CHECK ADD  CONSTRAINT [FK_InlandFlight_Flight] FOREIGN KEY([InlandFlightID])
REFERENCES [dbo].[Flight] ([FlightID])
GO
ALTER TABLE [dbo].[InlandFlight] CHECK CONSTRAINT [FK_InlandFlight_Flight]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Hotel]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_HotelReserve] FOREIGN KEY([HotelReserveID])
REFERENCES [dbo].[HotelReserve] ([ReserveID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_HotelReserve]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]
GO
ALTER TABLE [dbo].[TripReserve]  WITH CHECK ADD  CONSTRAINT [FK_TripReserve_Trip] FOREIGN KEY([TripID])
REFERENCES [dbo].[Trip] ([TripID])
GO
ALTER TABLE [dbo].[TripReserve] CHECK CONSTRAINT [FK_TripReserve_Trip]
GO
ALTER TABLE [dbo].[TripReserve]  WITH CHECK ADD  CONSTRAINT [FK_TripReserve_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[TripReserve] CHECK CONSTRAINT [FK_TripReserve_User]
GO
USE [master]
GO
ALTER DATABASE [Alibaba] SET  READ_WRITE 
GO
