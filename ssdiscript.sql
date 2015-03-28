CREATE TABLE `ssdi`.`users` (
  `userid` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(50) NOT NULL,
  `lname` VARCHAR(50) NOT NULL,
  `ssn` VARCHAR(45) NULL,
  `email` VARCHAR(100) NOT NULL,
  `dob` DATE NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE `ssdi`.`address` (
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


CREATE TABLE `ssdi`.`creditcard` (
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
	
	CREATE TABLE `ssdi`.`buildings` (
  `buildingid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `desc` VARCHAR(100) NULL,
  `latitude` FLOAT(13,9) NOT NULL,
  `longitude` FLOAT(13,9) NOT NULL,
  PRIMARY KEY (`buildingid`));