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