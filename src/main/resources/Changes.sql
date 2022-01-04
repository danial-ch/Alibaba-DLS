ALTER TABLE [dbo].[User] 
ADD LastName nvarchar(50),
SignUpDate date;
GO

ALTER TABLE [dbo].[BusTrip]
ADD IsVip bit;
GO

ALTER TABLE [dbo].[Hotel]
ADD IsVip bit;
GO

ALTER TABLE [dbo].[Trip]
ADD Capacity int;
GO

ALTER TABLE [dbo].[TripReserve]
ADD SeatNumber int;
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