CREATE TABLE IF NOT EXISTS `ssdi`.`users` (
  `userid` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(50) NOT NULL,
  `lname` VARCHAR(50) NOT NULL,
  `ssn` VARCHAR(45) NULL,
  `email` VARCHAR(100) NOT NULL,
  `dob` DATE NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS `ssdi`.`address` (
  `userid` INT NOT NULL,
  `addrid` INT NOT NULL AUTO_INCREMENT,
  `line1` VARCHAR(45) NOT NULL,
  `line2` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zip` INT NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`addrid`),
  INDEX `addr_userid_idx` (`userid` ASC),
  CONSTRAINT `addr_userid`
    FOREIGN KEY (`userid`)
    REFERENCES `ssdi`.`users` (`userid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 100;


CREATE TABLE IF NOT EXISTS `ssdi`.`creditcard` (
  `userid` INT NOT NULL,
  `creditcard` BIGINT(16) NOT NULL,
  `cvv` INT NOT NULL,
  `expmonth` INT NOT NULL,
  `expyear` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`creditcard`),
  INDEX `credit_userid_idx` (`userid` ASC),
  CONSTRAINT `credit_userid`
    FOREIGN KEY (`userid`)
    REFERENCES `ssdi`.`users` (`userid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
	
	CREATE TABLE IF NOT EXISTS `ssdi`.`buildings` (
  `buildingid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `desc` VARCHAR(100) NULL,
  `latitude` FLOAT(13,9) NOT NULL,
  `longitude` FLOAT(13,9) NOT NULL,
  PRIMARY KEY (`buildingid`));
  


INSERT INTO `ssdi`.`users` (`fname`, `lname`, `ssn`, `email`, `dob`, `phone`, `password`) VALUES ('sampath', 'kolluru', '542-23-1234', 'skolluru@uncc.edu', '1991-08-23', '3244211123', 'password');


INSERT INTO `ssdi`.`users` (`fname`, `lname`, `ssn`, `email`, `dob`, `phone`, `password`) VALUES ('lokesh', 'SRIDVI', '312-23-1234', 'lokesh@uncc.edu', '1991-08-23', '3213211123', 'password');

INSERT INTO `ssdi`.`users` (`fname`, `lname`, `ssn`, `email`, `dob`, `phone`, `password`) VALUES ('bhargav', 'xyz', '312-34-3343', 'bhargav@uncc.edu', '1991-08-24', '2341321113', 'password');


INSERT INTO `ssdi`.`users` (`fname`, `lname`, `ssn`, `email`, `dob`, `phone`, `password`) VALUES ('sujeeth', 'abc', '312-23-1243', 'sujeeth@uncc.edu', '1993-09-27', '3213213434', 'password');

INSERT INTO `ssdi`.`users` (`fname`, `lname`, `ssn`, `email`, `dob`, `phone`, `password`) VALUES ('vignesh', 'bcd', '122-23-1234', 'vignesh@uncc.edu', '1991-08-27', '6513211123', 'password');
  
  
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('1', 'East Entrance', '35.3080687', '-80.7248944');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('2', 'North Entrance', '35.31293652', '-80.73003352');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('3', 'West Entrance', '35.30200978', '-80.74168503');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('4', 'Foundation', '35.29797317', '-80.73689997');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('5', 'South Entrance', '35.30122174', '-80.73693216');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('6', 'Student Health Centre', '35.31053767', '-80.72952926');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('7', 'Burson', '35.30745582', '-80.73243678');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('8', 'Rose Football Centre', '35.30995983', '-80.73939979');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('9', 'Motorsports Research', '35.31261259', '-80.74024737');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('10', 'Cone University Centre', '35.30523192', '-80.73321998');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('11', 'Niner House', '35.30410244', '-80.72778046');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('12', 'Student Union', '35.30864655', '-80.73371351');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('13', 'Residence Dining Hall', '35.30214112', '-80.73361695');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('14', 'Scott Hall', '35.30173835', '-80.73535502');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('15', 'Hawthorn Hall', '35.31155325', '-80.72743714');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('16', 'Facilities Operations Parking Services', '35.30841891', '-80.73016226');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('17', 'Witherspoon Hall', '35.31093164', '-80.73230803');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('18', 'Sanford Hall', '35.30302547', '-80.7334882');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('19', 'Belk Gym', '35.30541579', '-80.7355696');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('20', 'Memorial Hall', '35.30377847', '-80.73585927');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('21', 'Halton Wagner Complex', '35.30730698', '-80.73667467');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('22', 'Woodward Hall', '35.30752587', '-80.73570907');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('23', 'EPIC', '35.30908431', '-80.74162066');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('24', 'Facilities Management', '35.31220987', '-80.73043048');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('25', 'Grigg Hall', '35.31130811', '-80.74188888');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('26', 'Irwin Belk Track & Field', '35.30549459', '-80.7373184');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('27', 'High School', '35.30885668', '-80.74379861');


UPDATE `ssdi`.`buildings` SET `desc`='East Entrance' WHERE `buildingid`='1';
UPDATE `ssdi`.`buildings` SET `desc`='North Entrance' WHERE `buildingid`='2';
UPDATE `ssdi`.`buildings` SET `desc`='West Entrance' WHERE `buildingid`='3';
UPDATE `ssdi`.`buildings` SET `desc`='Foundation' WHERE `buildingid`='4';
UPDATE `ssdi`.`buildings` SET `desc`='South Entrance' WHERE `buildingid`='5';
UPDATE `ssdi`.`buildings` SET `desc`='Student Health Centre' WHERE `buildingid`='6';
UPDATE `ssdi`.`buildings` SET `desc`='Burson' WHERE `buildingid`='7';
UPDATE `ssdi`.`buildings` SET `desc`='Rose Football Centre' WHERE `buildingid`='8';
UPDATE `ssdi`.`buildings` SET `desc`='Motorsports Research' WHERE `buildingid`='9';
UPDATE `ssdi`.`buildings` SET `desc`='Cone University Centre' WHERE `buildingid`='10';
UPDATE `ssdi`.`buildings` SET `desc`='Niner House' WHERE `buildingid`='11';
UPDATE `ssdi`.`buildings` SET `desc`='Student Union' WHERE `buildingid`='12';
UPDATE `ssdi`.`buildings` SET `desc`='Residence Dining Hall' WHERE `buildingid`='13';
UPDATE `ssdi`.`buildings` SET `desc`='Scott Hall' WHERE `buildingid`='14';
UPDATE `ssdi`.`buildings` SET `desc`='Hawthorn Hall' WHERE `buildingid`='15';
UPDATE `ssdi`.`buildings` SET `desc`='Facilities Operations Parking Services' WHERE `buildingid`='16';
UPDATE `ssdi`.`buildings` SET `desc`='Witherspoon Hall' WHERE `buildingid`='17';
UPDATE `ssdi`.`buildings` SET `desc`='Sanford Hall' WHERE `buildingid`='18';
UPDATE `ssdi`.`buildings` SET `desc`='Belk Gym' WHERE `buildingid`='19';
UPDATE `ssdi`.`buildings` SET `desc`='Memorial Hall' WHERE `buildingid`='20';
UPDATE `ssdi`.`buildings` SET `desc`='Halton Wagner Complex' WHERE `buildingid`='21';
UPDATE `ssdi`.`buildings` SET `desc`='Woodward Hall' WHERE `buildingid`='22';
UPDATE `ssdi`.`buildings` SET `desc`='EPIC' WHERE `buildingid`='23';
UPDATE `ssdi`.`buildings` SET `desc`='Facilities Management' WHERE `buildingid`='24';
UPDATE `ssdi`.`buildings` SET `desc`='Grigg Hall' WHERE `buildingid`='25';
UPDATE `ssdi`.`buildings` SET `desc`='Irwin Belk Track & Field' WHERE `buildingid`='26';
UPDATE `ssdi`.`buildings` SET `desc`='High School' WHERE `buildingid`='27';
		