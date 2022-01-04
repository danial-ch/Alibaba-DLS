INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (1,'Ali',123,11223344,'Ali1@gmail.com',0,11,1,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1378,09,03)))
,44562532,754368216,'Gholami',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,08,15))))
GO

INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (2,'Zohreh',345,11223355,'Rasouli2@gmail.com',0,22,0,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,9,20)))
,44665535,864721597,'Rasouli',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,02,17))))
GO

INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (3,'Elham',567,11223366,'Eli3@gmail.com',0,33,0,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1342,01,20)))
,77659423,462579315,'Niayeshi',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,03,29))))
GO

INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (4,'Reza',789,11223377,'Reza4@gmail.com',0,44,1,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1356,05,12)))
,55643711,645213798,'Maleki',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,9,14))))
GO

INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (5,'Morteza',901,11223388,'MortezaMolaee5@gmail.com',0,55,1,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1384,06,10)))
,22436157,745628913,'Molayee',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,9,19))))
GO

INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (6,'Saeid',111,11223399,'Saeid6@gmail.com',50000,66,1,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1336,12,05)))
,88465219,124693578,'Hejazi',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,08,30))))
GO

INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (7,'John',112,11223300,'John7@gmail.com',100000000,77,1,987654321,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1369,11,21)))
,66548924,456327891,'Weak',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,9,11))))
GO

INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (8,'Arman',113,11220000,'Fadaee8@gmail.com',10000000,88,1,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1379,07,23)))
,55462789,123456789,'Fadaei',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,9,18))))
GO

INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (9,'Mohammad',114,11220001,'M.sajadi9@gmail.com',6000000,99,1,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1348,05,14)))
,22554697,1346798462,'Sajadi',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,07,20))))
GO

INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (10,'Ali',115,11220002,'Ali.Mohammadi10@gmail.com',8000000,100,1,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1375,08,15)))
,44156278,469785364,'Mohammadi',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,06,24))))
GO

INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (11,'Narges Ramezani',116,11220003,'Narges11@gmail.com',4500000,101,0,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1335,04,16)))
,77854691,1468753167,'Ramezani',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,9,10))))
GO

INSERT INTO [User] (userId,[Name],[Password],PhoneNumber,Email,Credit,NationalCode,Gender,DateOfBirth,TelePhone,AccountNumber,LastName,SignUpDate)
VALUES (12,'Saber',116,11220004,'Sab12@gmail.com',3450000,102,1,(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1360,08,03)))
,55324698,4302798728,'Ahmadi',(SELECT dbo.[UDF_Julian_To_Grerian](dbo.[UDF_Persian_To_Julian](1400,9,20))))
GO

--------------------------------------------

INSERT INTO Trip 
VALUES (1,'Tehran','Mashhad',(SELECT dbo.[UDF_Julian_To_Gregorian](dbo.[UDF_Persian_To_Julian](1400,9,23))),22)
GO
INSERT INTO Trip 
VALUES (2,'Tehran','Babol',(SELECT dbo.[UDF_Julian_To_Gregorian](dbo.[UDF_Persian_To_Julian](1400,9,24))),22)
GO
INSERT INTO BusCompany
VALUES (123,'Iran Peyma')
GO
INSERT INTO BusTrip
VALUES (1,'Mashhad','Tehran',1,123,1)
GO
INSERT INTO BusTrip
VALUES (2,'Babol','Tehran',1,123,1)

-------------------------------------------
GO 
INSERT INTO Trip 
VALUES (3,'Los Angles','Tehran',(SELECT dbo.[UDF_Julian_To_Gregorian](dbo.[UDF_Persian_To_Julian](1400,9,20)))
,300)
GO

INSERT INTO Flight (FlightId,TicketType,IsOneWay,ArrivalTime)
VALUES (3,'Economy',1,(SELECT dbo.[UDF_Julian_To_Gregorian](dbo.[UDF_Persian_To_Julian](1400,9,21))))
GO

INSERT INTO ForeignFlight
VALUES (3,20,0)

--------------------------------------------
GO
INSERT INTO TripReserve
VALUES (1,235,1,7,3,35000000,245)

--------------------------------------------
GO
INSERT INTO TripReserve
VALUES (2,489,1,9,1,40000,6)

--------------------------------------------
GO
INSERT INTO TripReserve
VALUES (3,500,1,2,1,40000,7)

UPDATE TripReserve SET SeatNumber = 10 where ReserveID = 3

--------------------------------------------
GO
INSERT INTO Hotel
VALUES (789,'Espinas Palace','Tehran','Behroud Sq-Shaghayegh Blv',500000,3000000,4.4,8,'Hotel',1)

--------------------------------------------
GO
INSERT INTO Room(RoomId,isVip,NumberOfBeds,BAndB,HotelId,HotelReserveId)
VALUES (1,1,2,1,789,Null)
GO

INSERT INTO Room(RoomId,isVip,NumberOfBeds,BAndB,HotelId,HotelReserveId) 
VALUES (2,1,2,1,789,Null)
GO

INSERT INTO Room(RoomId,isVip,NumberOfBeds,BAndB,HotelId,HotelReserveId) 
VALUES (3,1,2,1,789,Null)
GO

INSERT INTO Room(RoomId,isVip,NumberOfBeds,BAndB,HotelId,HotelReserveId) 
VALUES (4,1,2,1,789,Null)
GO

INSERT INTO Room(RoomId,isVip,NumberOfBeds,BAndB,HotelId,HotelReserveId) 
VALUES (5,1,2,1,789,Null)
GO

INSERT INTO Room(RoomId,isVip,NumberOfBeds,BAndB,HotelId,HotelReserveId) 
VALUES (6,1,2,1,789,Null)
GO

INSERT INTO Room(RoomId,isVip,NumberOfBeds,BAndB,HotelId,HotelReserveId) 
VALUES (7,1,2,1,789,Null)
GO

INSERT INTO Room(RoomId,isVip,NumberOfBeds,BAndB,HotelId,HotelReserveId) 
VALUES (8,1,2,1,789,Null)
GO

INSERT INTO Room(RoomId,isVip,NumberOfBeds,BAndB,HotelId,HotelReserveId) 
VALUES (9,1,2,1,789,Null)
GO

INSERT INTO Room(RoomId,isVip,NumberOfBeds,BAndB,HotelId,HotelReserveId) 
VALUES (10,1,2,1,789,Null)

---------------------------------------------
GO
INSERT INTO HotelReserve (ReserveID,CheckInDate,CheckOutDate,price,PassengerCount,NumberOfRooms,UserId,HotelId)
VALUES(764,(SELECT dbo.[UDF_Julian_To_Gregorian](dbo.[UDF_Persian_To_Julian](1400,9,20)))
,(SELECT dbo.[UDF_Julian_To_Gregorian](dbo.[UDF_Persian_To_Julian](1400,9,25))),700000,1,1,7,789)
GO
UPDATE Room SET HotelReserveId = 764 WHERE roomId = 1
GO
UPDATE [User] SET Credit = Credit - 700000 WHERE UserID = 7

--------------------------------------------
GO
DELETE U1 FROM [dbo].[User] U1 INNER JOIN 
(SELECT U.UserID FROM [User] U WHERE U.UserID NOT IN
(SELECT U.UserID FROM [User] U 
INNER JOIN [Transaction] T ON U.UserID = T.UserID)) AS U2
ON U1.UserID = U2.UserID
WHERE (SELECT DATEDIFF(day, U1.SignUpDate, GETDATE())) > 7

--------------------------------------------
GO
CREATE TABLE ActiveUsers
(
UserID int,
[Name] nvarchar(50)
)                                                                               

INSERT INTO ActiveUsers (UserID, [Name])
SELECT U.UserID  , U.Name
FROM [dbo].[User]  U
WHERE U.credit <> 0

-------------------------------------------
GO
CREATE VIEW  NotZero As
SELECT U.UserID, U.Name
FROM [dbo].[User]  U                                           
WHERE credit <> 0

-------------------------------------------


