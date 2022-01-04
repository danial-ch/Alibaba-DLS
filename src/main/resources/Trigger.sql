CREATE PROCEDURE AddTicket @N INT, @TripID BIGINT
AS
BEGIN
DECLARE @Counter int= 1
WHILE @Counter< =@N
BEGIN TRY
INSERT INTO [dbo].[TripReserve] (ReserveID, ReserveNumber, PassengerCount, UserID, TripID, Price, SeatNumber)  
VALUES(@Counter, @Counter, 1, (SELECT TOP 1 U.UserID FROM [User] U), @TripID, 0, @Counter) 
SET @Counter= @Counter + 1
END TRY
BEGIN CATCH
END CATCH

END

GO

CREATE TRIGGER AddTicketsForTrip	
ON Trip
AFTER INSERT
AS
BEGIN
DECLARE @N INT
DECLARE	@TripID BIGINT
SELECT @N = INSERTED.[Capacity],
@TripID = INSERTED.[TripID] FROM inserted
EXEC AddTicket @N , @TripID
END