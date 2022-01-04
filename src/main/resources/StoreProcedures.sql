--1
CREATE PROCEDURE purchasedTickets @A nvarchar(50), @B nvarchar(50)  , @X bit
AS
SELECT COUNT(*) FROM Flight INNER JOIN Trip ON Flight.FlightID = Trip.TripID 
WHERE Trip.Origin = @A AND Trip.Destination = @B AND Flight.IsOneWay = @X
GO
--2
CREATE PROCEDURE userWalletDetail @A nvarchar(50)
AS
SELECT t.type FROM [dbo].[Transaction] t INNER JOIN [dbo].[User] u ON t.UserID = u.UserID
WHERE u.LastName LIKE ('%'+ @A)
GO
--3
CREATE PROCEDURE allDomesticFlights @A nvarchar(50), @B nvarchar(50)  , @C datetime
AS
SELECT AirlineName 
FROM AirlineCompany INNER JOIN FlightAirline ON AirlineCompany.AirlineID = FlightAirline.AirlineID
INNER JOIN Flight ON Flight.FlightID = FlightAirline.FlightID
INNER JOIN Trip ON Flight.FlightID = Trip.TripID
INNER JOIN InlandFlight ON InlandFlight.InlandFlightID = Flight.FlightID
WHERE Trip.Origin = @A AND Trip.Destination = @B AND Trip.DepartureTime = @C
GO


--4
CREATE PROCEDURE internationalTickets @X nvarchar(50), @Y nvarchar(50)  , @C int
AS
SELECT AVG(LEN(u.LastName)) 
FROM [dbo].[User] u 
INNER JOIN TripReserve ON u.UserID = TripReserve.UserID
INNER JOIN Trip ON TripReserve.TripID = Trip.TripID
INNER JOIN Flight ON Flight.FlightID = Trip.TripID
INNER JOIN ForeignFlight ON ForeignFlight.ForeignFlightID = Flight.FlightID
WHERE Trip.Origin = @X AND Trip.Destination = @Y 
GROUP BY u.UserID
HAVING COUNT(*) > @C
GO

--5

CREATE PROCEDURE terminalBuses @A nvarchar(50) , @D nvarchar(50) , @E datetime , @B nvarchar(50) , @C nvarchar(50)
AS
SELECT BusTripID , BusCompany.Name  
FROM BusTrip INNER JOIN Trip ON Trip.TripID = BusTrip.BusTripID
INNER JOIN BusCompany ON BusCompany.BusCompanyID = BusTrip.BusCompanyID
WHERE BusTrip.OriginTerminal = @A AND BusCompany.Name = @D AND Trip.Origin = @B AND Trip.Destination = @C AND Trip.DepartureTime = @E
GO

--6

CREATE PROCEDURE hotelOrBusUsers @A int, @B nvarchar(50)
AS
SELECT AVG(U1.credit)
FROM [dbo].[User] U1  INNER JOIN
(SELECT u.UserID   
FROM [dbo].[User] u 
INNER JOIN HotelReserve ON HotelReserve.UserID = u.UserID
INNER JOIN Hotel ON HotelReserve.HotelID = Hotel.HotelID
INNER JOIN TripReserve ON u.UserID = TripReserve.UserID
INNER JOIN Trip ON TripReserve.TripID = Trip.TripID
INNER JOIN BusTrip ON Trip.TripID = BusTrip.BusTripID
WHERE Hotel.City = @B AND BusTrip.OriginTerminal = @B 
GROUP BY u.UserID
Having  COUNT(*) > @A) AS U2 ON U1.UserID = U2.UserID 
GO

--7



CREATE PROCEDURE internationalFlight @X int , @Y nvarchar(50) , @Z nvarchar(50) , @N int
AS
SELECT top (@X) * 
FROM ForeignFlight 
INNER JOIN Flight ON Flight.FlightID = ForeignFlight.ForeignFlightID
INNER JOIN Trip ON Flight.FlightID = Trip.TripID
INNER JOIN TripReserve ON TripReserve.TripID = Trip.TripID
WHERE Trip.Origin = @Y AND Trip.Destination = @Z AND Trip.DepartureTime >= dateadd(month, -@N, getdate())
ORDER BY TripReserve.Price 

GO


--8

CREATE PROCEDURE allInternationalTickets @X int , @Y nvarchar(50) , @Z nvarchar(50) , @A datetime, @B datetime
AS
SELECT  *
FROM ForeignFlight 
INNER JOIN Flight ON Flight.FlightID = ForeignFlight.ForeignFlightID
INNER JOIN Trip ON Flight.FlightID = Trip.TripID
INNER JOIN TripReserve ON TripReserve.TripID = Trip.TripID
WHERE Trip.Origin = @Y AND Trip.Destination = @Z AND Trip.DepartureTime >= convert(char(8), @A, 112) AND Trip.DepartureTime <= convert(char(8), @B, 112) 
AND Flight.TicketType = @X

GO

--9

CREATE PROCEDURE joinedUsers @C int , @A datetime, @B datetime
AS
SELECT  *
FROM [dbo].[User] u
WHERE  u.SignUpDate >= convert(char(8), @B, 112) AND u.SignUpDate <= convert(char(8), @A, 112) 
OR @C>(SELECT COUNT(*) FROM Trip
		INNER JOIN TripReserve ON TripReserve.TripID = Trip.TripID
		INNER JOIN [dbo].[User] u ON TripReserve.UserID = u.UserID
		WHERE Trip.DepartureTime >= dateadd(month, -1, getdate())
		GROUP BY u.UserID
	  )
GO


--10

CREATE PROCEDURE myTrips @X nvarchar(50) , @Y nvarchar(50)
AS
SELECT Trip.TripID , Trip.DepartureTime , Trip.Origin , Trip.Destination as myTrips
FROM  Trip
INNER JOIN TripReserve ON TripReserve.TripID = Trip.TripID
INNER JOIN [dbo].[User] u ON u.UserID = TripReserve.UserID
WHERE u.Name = @X AND u.LastName = @Y
GO

--11


CREATE PROCEDURE chargedUsers @X int , @Y int
AS
SELECT COUNT(*)
    (SELECT U.UserID FROM
        (SELECT U.UserID FROM [dbo].[User] U , [dbo].[Transaction] t
         WHERE t.UserID = U.UserID AND t.Type = 'charge'
         GROUP BY U.UserID
         HAVING COUNT(*) >= @X ) as u
    , [dbo].[Transaction] t
    WHERE t.UserID = U.UserID AND t.Type = 'buy'
    GROUP BY U.UserID
    HAVING COUNT(*) <= @y )
 GO

--12

CREATE PROCEDURE allBusTickets_1 @Y nvarchar(50) , @Z nvarchar(50) 
AS
SELECT BusCompany.Name  
FROM BusCompany INNER JOIN BusTrip ON BusCompany.BusCompanyID = BusTrip.BusCompanyID
INNER JOIN Trip ON Trip.TripID = BusTrip.BusTripID
EXCEPT
SELECT BusCompany.Name  
FROM BusCompany INNER JOIN BusTrip ON BusCompany.BusCompanyID = BusTrip.BusCompanyID
INNER JOIN Trip ON Trip.TripID = BusTrip.BusTripID
WHERE  Trip.Origin = @Y AND Trip.Destination = @Z 
GO

--13

CREATE PROCEDURE allBusTickets_2 @Y nvarchar(50) , @Z nvarchar(50) , @X nvarchar(50) , @C numeric(15,3) 
AS
SELECT TripReserve.*
FROM TripReserve INNER JOIN Trip ON TripReserve.TripID = Trip.TripID
INNER JOIN BusTrip ON Trip.TripID = BusTrip.BusTripID
INNER JOIN BusCompany ON BusCompany.BusCompanyID = BusTrip.BusCompanyID
WHERE  Trip.Origin = @X AND Trip.Destination = @Y AND BusCompany.Name = @Z 
AND ( Trip.Capacity = (SELECT MAX(Trip.Capacity) FROM Trip INNER JOIN BusTrip ON Trip.TripID = BusTrip.BusTripID INNER JOIN BusCompany ON BusCompany.BusCompanyID = BusTrip.BusCompanyID WHERE BusCompany.Name = @Z) 
OR Trip.DepartureTime = (SELECT MIN(Trip.DepartureTime) FROM Trip INNER JOIN BusTrip ON Trip.TripID = BusTrip.BusTripID INNER JOIN BusCompany ON BusCompany.BusCompanyID = BusTrip.BusCompanyID WHERE BusCompany.Name = @Z) ) 
AND TripReserve.Price < @C
GO

--14

CREATE PROCEDURE twoTrips @Y nvarchar(50) , @Z nvarchar(50) , @X nvarchar(50) 
AS
SELECT U.Name , U.LastName 
FROM [dbo].[User] U
INNER JOIN TripReserve ON U.UserID = TripReserve.UserID
WHERE (SELECT Trip.DepartureTime FROM Trip INNER JOIN Flight ON Flight.FlightID = Trip.TripID
INNER JOIN ForeignFlight ON Flight.FlightID = ForeignFlight.ForeignFlightID
WHERE Trip.Origin = @Y AND Trip.Destination = @Z ) 
>
(SELECT Trip.DepartureTime FROM Trip 
--INNER JOIN (SELECT BusTrip.* FROM BusTrip UNION ALL SELECT InlandFlight.* FROM InlandFlight) AS I ON I.BusTripID = Trip.TripID 
WHERE Trip.Origin = @X AND Trip.Destination = @Y
AND (Trip.TripID IN (SELECT BusTrip.BusTripID FROM BusTrip) OR Trip.TripID IN (SELECT InlandFlight.InlandFlightID FROM InlandFlight)
))

GO

--15

CREATE PROCEDURE lastChange @X nvarchar(50) , @Y nvarchar(50)
AS
SELECT t.TransTime , t.Type
FROM [dbo].[Transaction] t
INNER JOIN [dbo].[User] u ON u.UserID = t.UserID
WHERE u.Name = @X AND u.LastName = @Y AND t.TransTime = (SELECT TOP 1 t.TransTime FROM [dbo].[Transaction] t ORDER BY t.TransTime DESC)
 GO

 --16

 CREATE PROCEDURE reserveHotel_1 @Y nvarchar(50) , @X nvarchar(50) , @N int , @A date , @B date , @M int , @C datetime , @D datetime
AS
SELECT U.* FROM [dbo].[User] U 
INNER JOIN 
(SELECT U.UserID FROM [dbo].[User] U 
INNER JOIN HotelReserve  ON U.UserID = HotelReserve.UserID 
INNER JOIN Hotel ON Hotel.HotelID = HotelReserve.HotelID
WHERE HotelReserve.CheckInDate < @B ANd HotelReserve.CheckInDate > @A
AND Hotel.City = @X
GROUP BY U.UserID HAVING COUNT(*) = @N


INTERSECT

SELECT U.UserID FROM [dbo].[User] U 
INNER JOIN TripReserve  ON U.UserID = TripReserve.UserID 
INNER JOIN Trip ON Trip.TripID = TripReserve.TripID
WHERE Trip.DepartureTime < @D AND Trip.DepartureTime > @C 
AND Trip.Origin = @Y
GROUP BY U.UserID HAVING COUNT(*) = @M) as v ON U.UserID = v.UserID
GO

--17

CREATE PROCEDURE reserveHotel_2 @A date , @B date , @C nvarchar(50) 
AS
SELECT U.*
FROM [dbo].[User] U
INNER JOIN HotelReserve ON HotelReserve.UserID = U.UserID
INNER JOIN Hotel ON Hotel.HotelID = HotelReserve.HotelID
WHERE 
(SELECT Count(*) 
FROM 
(SELECT Hotel.HotelID
FROM [dbo].[User] U
INNER JOIN HotelReserve ON HotelReserve.UserID = U.UserID
INNER JOIN Hotel ON Hotel.HotelID = HotelReserve.HotelID
WHERE U.UserID = HotelReserve.UserID AND HotelReserve.HotelID =  Hotel.HotelID AND HotelReserve.CheckInDate < @B AND HotelReserve.CheckInDate>@A 
AND Hotel.Rating < 3 AND Hotel.City = @C
)as o )
= 
(SELECT COUNT(*)
FROM
(SELECT Hotel.HotelID FROM Hotel
WHERE Hotel.Rating < 3 AND Hotel.City = @C)
 as w)
GO

--18
CREATE PROCEDURE reserveHotel_3 @A nvarchar(50) , @B nvarchar(50)
AS
SELECT U.LastName FROM 
(SELECT U.LastName FROM [dbo].[User] U 
INNER JOIN [dbo].[HotelReserve] HR ON U.UserID = HR.UserID
INNER JOIN [dbo].[Hotel] H ON HR.HotelID = H.HotelID
WHERE U.UserID NOT IN (SELECT U.UserID FROM [User] U 
INNER JOIN [dbo].[HotelReserve] HR ON U.UserID = HR.UserID
INNER JOIN [dbo].[Hotel] H ON HR.HotelID = H.HotelID
WHERE H.City <> @A) AND H.City = @A
UNION
SELECT U.LastName FROM [dbo].[User] U 
WHERE U.UserID NOT IN (SELECT U.UserID FROM [User] U 
INNER JOIN [dbo].[TripReserve] TR ON U.UserID = TR.UserID
INNER JOIN [dbo].[Trip] T ON TR.TripID = T.TripID
WHERE T.Destination = @B )) AS U
ORDER BY U.LastName ASC
GO

--19
CREATE PROCEDURE reserveHotel_4 @B nvarchar(50) , @C INT
AS
SELECT U1.* FROM [dbo].[User] U1 INNER JOIN
(SELECT U.UserID FROM [dbo].[User] U
INNER JOIN [dbo].[HotelReserve] HR ON U.UserID = HR.UserID
INNER JOIN [dbo].[Hotel] H ON HR.HotelID = H.HotelID
WHERE H.City = @B
GROUP BY U.UserID
HAVING COUNT(*) > @C) AS U2 ON U1.UserID = U2.UserID
GO

--20
CREATE PROCEDURE reserveHotel_5 @A INT
AS
SELECT H.* FROM HOTEL H
WHERE H.Rating >= @A AND 
(SELECT SUM(HR.PassengerCount) FROM HOTEL H INNER JOIN 
HotelReserve HR ON H.HotelID = HR.HotelID GROUP BY H.HotelID ) = 
(SELECT MAX(PC.PCS) FROM (SELECT SUM(HR.PassengerCount) AS PCS FROM HOTEL H INNER JOIN 
HotelReserve HR ON H.HotelID = HR.HotelID GROUP BY H.HotelID) AS PC) 
GO
