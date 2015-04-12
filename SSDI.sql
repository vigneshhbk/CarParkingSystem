use ssdi;

CREATE TABLE Lot(
	LotID INT NOT NULL AUTO_INCREMENT,
    BuildingID INT NOT NULL,
    Name VARCHAR(20) NOT NULL,
	Latitude FLOAT(13,9) NOT NULL,
    Longitude FLOAT(13,9) NOT NULL,
    CONSTRAINT pk_LotID PRIMARY KEY(LotID),
    CONSTRAINT fk_Buildings_BuildingID_Lot_BuildingID FOREIGN KEY (BuildingID) REFERENCES Buildings(BuildingID));
    
CREATE TABLE Slot(
	SlotID INT,
    LotID INT,
    CONSTRAINT pk_SlotID_LotID PRIMARY KEY(SlotID, LotID),
    CONSTRAINT fk_Lot_LotID_Slot_LotID FOREIGN KEY (LotID) REFERENCES Lot(LotID));
    
CREATE TABLE Booking(
	BookingID INT NOT NULL AUTO_INCREMENT,
    LotID INT NOT NULL,
    SlotID INT NOT NULL,
    From_Date DATE NOT NULL,
    From_Time TIME NOT NULL,
	To_Date DATE NOT NULL,
    To_Time TIME NOT NULL,
    UserID INT NOT NULL,
    CONSTRAINT pk_BookingID PRIMARY KEY(BookingID),
    CONSTRAINT fk_Slot_SlotID_LotID_Booking_SlotID_LotID FOREIGN KEY(SlotID, LotID) REFERENCES Slot(SlotID, LotID),
    CONSTRAINT fk_Users_UserID_Booking_UserID FOREIGN KEY(UserID) REFERENCES Users(UserID));

INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (1, 1, '2015-04-06', '08:00:00', '2015-04-06', '10:00:00', 1);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (1, 2, '2015-04-07', '08:00:00', '2015-04-07', '10:00:00', 2);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (1, 3, '2015-04-06', '08:00:00', '2015-04-06', '10:00:00', 3);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (1, 4, '2015-04-06', '09:00:00', '2015-04-06', '11:00:00', 4);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (2, 1, '2015-04-07', '13:00:00', '2015-04-07', '17:00:00', 5);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (2, 2, '2015-04-07', '15:00:00', '2015-04-07', '18:00:00', 6);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (2, 3, '2015-04-08', '08:00:00', '2015-04-08', '10:00:00', 7);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (2, 4, '2015-04-08', '23:00:00', '2015-04-09', '05:00:00', 8);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (25, 1, '2015-04-06', '08:00:00', '2015-04-06', '10:00:00', 1);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (25, 2, '2015-04-07', '08:00:00', '2015-04-07', '10:00:00', 2);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (26, 3, '2015-04-06', '08:00:00', '2015-04-06', '10:00:00', 3);

select * from Lot;
select * from Booking;
select * from Buildings;
call GetLots('2015-04-06', '2015-04-06', '09:00:00', '09:30:00', 1);

select BuildingiD, count(LotID) FROM Lot Group by BuildingID;
select * from Lot where BuildingID = 1;

INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'Lot 6',	35.30879574,	-80.72593416	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'North Entrance'), 	'Lot 25',	35.3129015,	-80.73266208	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'West Entrance'), 	'Lot 27',	35.30179964,	-80.74034393	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Foundation'), 	'Lot 101',	35.29711504,	-80.73844492	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'North Entrance'), 	'North Deck',	35.31338301,	-80.73140681	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'South Entrance'), 	'South Village Deck',	35.30064384,	-80.73617041	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Student Health Centre'), 	'Lot 11',	35.31026626,	-80.73013008	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Student Health Centre'), 	'Lot 11A',	35.31094915,	-80.73023736	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Burson'), 	'Lot 15',	35.30793737,	-80.73246896	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Rose Football Centre'), 	'Lot 29',	35.31078281,	-80.73805869	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Rose Football Centre'), 	'Lot 29A',	35.31080907,	-80.73853076	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Motorsports Research'), 	'CRI 3',	35.31287523,	-80.74066579	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Cone University Centre'), 	'Cone Deck 1',	35.30433884,	-80.73438942	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Cone University Centre'), 	'Cone Deck 2',	35.30479414,	-80.73450744	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Niner House'), 	'East Deck 1',	35.30473285,	-80.7276088	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Student Union'), 	'Union Deck',	35.30917186,	-80.73514044	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Residence Dining Hall'), 	'Lot 8A',	35.30150193,	-80.73393881	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Scott Hall'), 	'Lot 8',	35.30050374,	-80.73487222	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Student Health Centre'), 	'Lot 12',	35.31144819,	-80.72876751	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Hawthorn Hall'), 	'Lot 13',	35.31100168,	-80.72751224	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Facilities Operations Parking Services'), 	'Lot 16',	35.30888294,	-80.73050559	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Witherspoon Hall'), 	'Lot 20',	35.31022248,	-80.73258698	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Witherspoon Hall'), 	'Lot 21',	35.31115927,	-80.73113859	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Sanford Hall'), 	'Lot MSU',	35.30260519,	-80.73298395	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'Lot 4A',	35.30681668,	-80.72517335	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'Lot 5',	35.30733325,	-80.72691143	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'Lot 5A',	35.30743831,	-80.72547376	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Belk Gym'), 	'Lot 7',	35.30459276,	-80.73594511	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Memorial Hall'), 	'Lot 7A',	35.30391857,	-80.73646009	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Halton Wagner Complex'), 	'Lot 14',	35.3068517,	-80.73781192	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Woodward Hall'), 	'Lot 18',	35.30919813,	-80.73599875	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Woodward Hall'), 	'Lot 19',	35.30835763,	-80.73566616	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'EPIC'), 	'Lot 23',	35.30940825,	-80.74120224	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Facilities Management'), 	'Lot 26',	35.31243749,	-80.73108494	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Grigg Hall'), 	'CRI 2',	35.31038883,	-80.7432729	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'East Deck 2',	35.3053545,	-80.72687924	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'East Deck 3',	35.30597615,	-80.72605312	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Irwin Belk Track & Field'), 	'West Deck',	35.30542455,	-80.73656738	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'High School'), 	'CRI Deck 1',	35.30913684,	-80.74348748	);

select * from Slot LIMIT 0, 100;

