CREATE PROCEDURE tran_proc @ReserveID BIGINT ,@ReserveNumber VARCHAR(30), @PassengerCnt INT, @UserID BIGINT, @TripID BIGINT, @Price NUMERIC(15,3), @SeatNumber INT
AS
BEGIN TRANSACTION  
BEGIN TRY
insert into [dbo].[TripReserve] (ReserveID, ReserveNumber, PassengerCount, UserID, TripID, Price, SeatNumber)  
values(@ReserveID, @ReserveNumber, @PassengerCnt, @UserID, @TripID, @Price, @SeatNumber) 
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
END CATCH
COMMIT TRANSACTION 
GO