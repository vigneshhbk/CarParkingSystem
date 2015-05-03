use ssdi;

-- CALL USP_SubmitUserRegistration('SUJ','M','111-11-1111','SMeed444@UNCC.EDU', 
-- '1990-12-12','+17042324472','SUJ','question','answer','a1','a2','city',33,'NC','CC'
-- ,33333333, 09,09,00, 'card name','card type',@out_value );
-- SELECT @out_value;
 
  
DROP PROCEDURE IF EXISTS USP_SubmitUserRegistration;
DELIMITER //
CREATE PROCEDURE USP_SubmitUserRegistration(
IN FirstName VARCHAR(50)
,IN LastName VARCHAR(50)
,IN SSN VARCHAR(45)
,IN UserEmail VARCHAR(100)
,IN DOB DATE
,IN Phone VARCHAR(15)
,IN UserPassword VARCHAR(20)
,IN SecurityQuestion VARCHAR(150)
,IN Answer VARCHAR(50)
-- ,IN UserId int
,IN AddressLine1 VARCHAR(45)
,IN AddressLine2 VARCHAR(45)
,IN City VARCHAR(45)
,IN Zip INT 
,IN State VARCHAR(50)
,IN Country VARCHAR(45)
,IN Creditcard  BIGINT(16)
,IN Cvv INT
,IN Expmonth INT
,IN Expyear INT
,IN CardName VARCHAR(45)
,IN CardType VARCHAR(45)
,OUT IsUserExists INT
)
BEGIN

DECLARE TempUserId INT;
DECLARE UserCount INT;

SET UserCount = (SELECT  count(userid ) FROM `ssdi`.`users` WHERE email = UserEmail);
select UserCount;
 IF (UserCount < 1 ) 
-- if ( 0 < 1)
THEN

	SET IsUserExists = 0;

	INSERT INTO `ssdi`.`users`(fname, lname, ssn, email, dob, phone, `password`, `security`, answer)  
	VALUES(FirstName, LastName, SSN, UserEmail, DOB, Phone, UserPassword, SecurityQuestion, Answer);


	SET TempUserId = (SELECT  userid  FROM `ssdi`.`users` WHERE email = UserEmail AND userid IS NOT NULL LIMIT 1);


	INSERT INTO `ssdi`.`address` (userid, line1, line2, city, zip, country)
	VALUES (TempUserId, AddressLine1, AddressLine2, City, Zip, Country);
	
	INSERT INTO `ssdi`.`creditcard` (userid,creditcard,cvv,expmonth,expyear,name,`type`)
	VALUES (TempUserId,Creditcard,Cvv,Expmonth,Expyear,CardName,CardType);
    
ELSE

SET IsUserExists =1;
END IF;

END//
DELIMITER ;


DROP PROCEDURE IF EXISTS USP_BookingRegistration;
DELIMITER //
CREATE PROCEDURE USP_BookingRegistration(
IN LID INT(11),
IN SID INT(11),
IN FDate DATE,
IN FTime TIME,
IN TDate DATE,
IN TTime TIME,
IN UsrID INT(11)
)
BEGIN

DECLARE hours INT;

SET hours = (select TIMESTAMPDIFF(MINUTE, TIMESTAMP(FDate, FTime),TIMESTAMP(TDate, TTime)) from dual);

	INSERT INTO `ssdi`.`booking`(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID, Cost)  
	VALUES(LID, SID, FDate, FTime, TDate, TTime, UsrID, hours*0.5 );


END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS GetLots; //
CREATE PROCEDURE GetLots(
	IN FromDate DATE,
	IN ToDate DATE,
	IN FromTime TIME,
    IN ToTime TIME,
    IN Building_Id INT)
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS BookedLots AS (
    SELECT LotID, SlotID FROM Booking WHERE From_Date = FromDate AND To_Date = ToDate 
	AND LotID IN (SELECT LotID FROM Lot WHERE BuildingID = Building_Id) AND (FromTime BETWEEN From_Time AND To_Time OR ToTime BETWEEN From_Time AND To_Time 
    OR From_Time BETWEEN FromTime AND ToTime OR To_Time BETWEEN FromTIme AND ToTime));
    
	CREATE TEMPORARY TABLE IF NOT EXISTS AvailableLots AS (
    SELECT l.BuildingID AS BuildingID, s.LotID AS LotID, MIN(s.SlotID) AS SlotID FROM Lot l INNER JOIN Buildings b ON l.BuildingID = b.BuildingID
    INNER JOIN Slot s ON l.LotID = s.LotID AND b.BuildingID = Building_Id AND s.SlotID NOT IN (SELECT SlotID FROM BookedLots WHERE LotID = s.LotID) GROUP BY l.BuildingID, s.LotID);
    
    SELECT l.BuildingID AS BuildingID
    , l.LotID AS LotID
    , l.Name AS Name
    , l.Latitude AS Latitude
    , l.Longitude AS Longitude
    , CASE al.SlotID WHEN NULL THEN -1
    ELSE al.SlotID END AS SlotID 
    FROM Lot l LEFT JOIN AvailableLots al ON l.LotID = al.LotID WHERE l.BuildingID = Building_Id;
    
    DROP TABLE AvailableLots;
    DROP TABLE BookedLots;
END //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS DeleteLot; //
CREATE PROCEDURE DeleteLot(
	IN Lot_ID INT)
BEGIN
	DECLARE DeleteFlag BIT;
	SELECT CASE Count(LotID) WHEN 0 THEN 0 ELSE 1 END INTO DeleteFlag FROM Booking WHERE From_Date = current_date() AND To_Date = current_date() 
	AND LotID = Lot_ID AND (From_Time BETWEEN current_time() AND current_time OR To_Time BETWEEN current_time AND current_time 
    OR current_time BETWEEN From_Time AND To_Time OR current_time BETWEEN From_Time AND To_Time OR From_Time > current_time OR To_Time > current_Time);

	IF DeleteFlag = 0 THEN
		SELECT CASE Count(LotID) WHEN 0 THEN 0 ELSE 1 END INTO DeleteFlag FROM Booking WHERE From_Date > current_date() AND To_Date > current_date();
	END IF;
    
    IF DeleteFlag = 0 THEN
		DELETE FROM Booking WHERE LotID = Lot_ID;
		DELETE FROM Slot WHERE LotID = Lot_ID;
        DELETE FROM Lot WHERE LotID = Lot_ID;
    END IF;
    
    SELECT DeleteFlag;
    
END //
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS AddLot; //
CREATE PROCEDURE AddLot(
	IN LotName VARCHAR(20),
    IN Building_ID INT,
    IN Lat FLOAT(13,9),
    IN Lon FLOAT(13,9),
    IN NoOfSlots INT)
BEGIN
	DECLARE addFlag BIT;
    DECLARE lastInsertedId INT;
    SET addFlag = 0;
	INSERT INTO Lot(BuildingID, Name, Latitude, Longitude) VALUES (Building_ID, LotName, Lat, Lon);
    SET lastInsertedId = LAST_INSERT_ID();
	WHILE NoOfSlots  > 0 DO
			   INSERT INTO Slot(SlotID, LotID) VALUES (NoOfSlots, lastInsertedId);
			   SET  NoOfSlots = NoOfSlots - 1; 
	END WHILE;
    
    SET addFlag = 1;    
    SELECT addFlag;
    
END //
DELIMITER ;