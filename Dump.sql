DROP DATABASE IF EXISTS `DNA_NP`;

CREATE DATABASE IF NOT EXISTS `DNA_NP`;

USE `DNA_NP`;

CREATE TABLE IF NOT EXISTS `Companies` (
  `Company_Name` VARCHAR(75) NOT NULL,
  `Founder ID` INT NOT NULL,
  `Sector` VARCHAR(50) NOT NULL,
  `Stock Unique ID` INT NOT NULL,
  `Dividend Yield` FLOAT NOT NULL,
  PRIMARY KEY (`Company_Name`)
);

INSERT INTO `Companies` VALUES ('Avanti_Feeds',1,'Miscellaneous',1,1.45);
INSERT INTO `Companies` VALUES ('TCS',2,'IT',2,2.5);
INSERT INTO `Companies` VALUES ('Infosys',3,'IT',3,3);
INSERT INTO `Companies` VALUES ('Bajaj_Auto',4,'Automobile',4,3.5);


CREATE TABLE IF NOT EXISTS `Stocks` (
  `Company_Name` VARCHAR(75) NOT NULL,
  `Date` DATE NOT NULL,
  `Stock Unique ID` INT NOT NULL,
  `Stock Exchange Listed` VARCHAR(60) NOT NULL,
  `Current Price` FLOAT NOT NULL,
  `P/E Ratio` FLOAT NOT NULL,
  `Price to Book` FLOAT NOT NULL,
  `EBITDA` FLOAT NOT NULL,
  `Market Cap(in cr)` FLOAT NOT NULL,
  PRIMARY KEY (`Stock Unique ID`,`Date`),
  CONSTRAINT `Stocks_ibfk_1` FOREIGN KEY(`Company_Name`) REFERENCES `Companies` (`Company_Name`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `Stocks` VALUES ('Avanti_Feeds',STR_TO_DATE('2022-11-16','%Y-%m-%d'),1,'NSE',431,23,2.9,431.6,1871);
INSERT INTO `Stocks` VALUES ('Avanti_Feeds',STR_TO_DATE('2022-11-17','%Y-%m-%d'),1,'NSE',405,22,3.1,435.6,1866);
INSERT INTO `Stocks` VALUES ('Avanti_Feeds',STR_TO_DATE('2022-11-18','%Y-%m-%d'),1,'NSE',435,24,3.2,434.6,1872);
INSERT INTO `Stocks` VALUES ('Avanti_Feeds',STR_TO_DATE('2022-11-19','%Y-%m-%d'),1,'NSE',455,22,2.8,432.6,1875);
INSERT INTO `Stocks` VALUES ('TCS',STR_TO_DATE('2022-11-16','%Y-%m-%d'),2,'BSE',4310,23,2.9,631.6,5871);
INSERT INTO `Stocks` VALUES ('TCS',STR_TO_DATE('2022-11-17','%Y-%m-%d'),2,'NSE',4305,22,3.1,635.6,5866);
INSERT INTO `Stocks` VALUES ('TCS',STR_TO_DATE('2022-11-18','%Y-%m-%d'),2,'NSE',4335,24,3.2,634.6,5872);
INSERT INTO `Stocks` VALUES ('TCS',STR_TO_DATE('2022-11-19','%Y-%m-%d'),2,'NSE',4355,22,2.8,632.6,5875);
INSERT INTO `Stocks` VALUES ('Infosys',STR_TO_DATE('2022-11-16','%Y-%m-%d'),3,'BSE',5310,23,3.9,531.6,6671);
INSERT INTO `Stocks` VALUES ('Infosys',STR_TO_DATE('2022-11-17','%Y-%m-%d'),3,'BSE',5305,22,4.1,535.6,6666);
INSERT INTO `Stocks` VALUES ('Infosys',STR_TO_DATE('2022-11-18','%Y-%m-%d'),3,'BSE',5335,24,4.2,534.6,6672);
INSERT INTO `Stocks` VALUES ('Infosys',STR_TO_DATE('2022-11-19','%Y-%m-%d'),3,'BSE',5355,22,4.8,532.6,6675);
INSERT INTO `Stocks` VALUES ('Bajaj_Auto',STR_TO_DATE('2022-11-16','%Y-%m-%d'),4,'BSE',2310,13,2.9,731.6,2671);
INSERT INTO `Stocks` VALUES ('Bajaj_Auto',STR_TO_DATE('2022-11-17','%Y-%m-%d'),4,'BSE',2305,12,3.1,735.6,2666);
INSERT INTO `Stocks` VALUES ('Bajaj_Auto',STR_TO_DATE('2022-11-18','%Y-%m-%d'),4,'BSE',2335,14,3.2,734.6,2672);
INSERT INTO `Stocks` VALUES ('Bajaj_Auto',STR_TO_DATE('2022-11-19','%Y-%m-%d'),4,'BSE',2355,11,3.8,732.6,2675);

CREATE TABLE IF NOT EXISTS `Board Members` (
  `CEO` VARCHAR(50) NOT NULL,
  `CFO` VARCHAR(50) NOT NULL,
  `CTO` VARCHAR(50) NOT NULL,
  `COO` VARCHAR(50) NOT NULL,
  `Company_Name` VARCHAR(75) NOT NULL,
  `Total Members In BOD` INT NOT NULL,
  `Percentage Shares held by BOD` FLOAT NOT NULL,
  `Stock Unique ID` INT NOT NULL,
  CONSTRAINT `BM_ibfk_1` FOREIGN KEY(`Company_Name`) REFERENCES `Companies` (`Company_Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BM_ibfk_2` FOREIGN KEY(`Stock Unique ID`) REFERENCES `Stocks` (`Stock Unique ID`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `Board Members` VALUES ('Mr. A Indra Kumar','Mr. C Ramachandra Rao','Mr Ramesh Loganathan','Mr CVJ','Avanti_Feeds',11,43.28,1);
INSERT INTO `Board Members` VALUES ('Mr. Sanjay K','Mr. C Rama Rao','Mr Vineet','Mr Pratham','TCS',35,29.28,2);
INSERT INTO `Board Members` VALUES ('Mr. Sanju K','Mr. Ramana','Mr Anoop','Mr Vir','Infosys',25,39.4,3);
INSERT INTO `Board Members` VALUES ('Mr. Bhim K','Mr. Ram','Mr Madhav','Mr Harsh','Bajaj_Auto',45,49.4,4);

CREATE TABLE IF NOT EXISTS `Stock Exchange` (
  `Name` VARCHAR(60) NOT NULL, 
  `Country` VARCHAR(50) NOT NULL,
  `Location` VARCHAR(50) NOT NULL,
  `Market Index` VARCHAR(50) NOT NULL,
  `Current Value of Market Index` FLOAT NOT NULL,
  `No of Companies Listed` INT NOT NULL,

  PRIMARY KEY (`Name`)
);

INSERT INTO `Stock Exchange` VALUES ('NSE','India','Bombay','Nifty50',18403.40,1641);
INSERT INTO `Stock Exchange` VALUES ('BSE','India','Bombay','Sensex',60403.40,5293);

CREATE TABLE IF NOT EXISTS `Balance Sheet` (
  `Company_Name` VARCHAR(75) NOT NULL, 
  `Share Capital` INT NOT NULL,
  `Reserves` INT NOT NULL,
  `Borrowings` INT NOT NULL,
  `Other Liabilities` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Total Assets` INT NOT NULL,

  CONSTRAINT `BS_ibfk_1` FOREIGN KEY(`Company_Name`) REFERENCES `Companies` (`Company_Name`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `Balance Sheet` VALUES ('Avanti_Feeds',14,1915,4,693,STR_TO_DATE('2022-10-16','%Y-%m-%d'),2625.2625);
INSERT INTO `Balance Sheet` VALUES ('Avanti_Feeds',14,1915,4,693,STR_TO_DATE('2022-11-16','%Y-%m-%d'),2625.2625);


CREATE TABLE IF NOT EXISTS `User` (
  `Email Id` VARCHAR(75) NOT NULL, 
  `First Name` VARCHAR(50) NOT NULL,
  `Middle Name` VARCHAR(50) NULL,
  `Last Name` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,

  PRIMARY KEY (`Email Id`)
);

INSERT INTO `User` VALUES ('admin','admin',NULL,'admin','admin');
INSERT INTO `User` VALUES ('rhythm.aggarwal@students.iiit.ac.in','Rhythm',NULL,'Aggarwal','User1');
INSERT INTO `User` VALUES ('mitansh.kayathwal@students.iiit.ac.in','Mitansh',NULL,'Kayathwal','User2');
INSERT INTO `User` VALUES ('khushi.goyal@students.iiit.ac.in','Khushi',NULL,'Goyal','User3');

CREATE TABLE IF NOT EXISTS `Liabilities` (
  `Company_Name` VARCHAR(75) NOT NULL, 
  `Total Liabilities` INT NOT NULL,

  CONSTRAINT `CN_ibfk_1` FOREIGN KEY(`Company_Name`) REFERENCES `Companies` (`Company_Name`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `Liabilities` VALUES ('Avanti_Feeds',2625);

CREATE TABLE IF NOT EXISTS `Quarterly results` (
  `Company_Name` VARCHAR(75) NOT NULL,
  `Net profit` FLOAT NOT NULL,
  `quarter` INT NOT NULL,
  `Expenses` FLOAT NOT NULL,
  `sales` FLOAT NOT NULL,
  `Date` DATE NOT NULL,
  CONSTRAINT `QR_ibfk_1` FOREIGN KEY(`Company_Name`) REFERENCES `Companies` (`Company_Name`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `Quarterly results` VALUES ('Avanti_Feeds',30,1,1247,290,STR_TO_DATE('2021-7-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('Avanti_Feeds',67,2,1247,400,STR_TO_DATE('2021-10-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('Avanti_Feeds',110,3,1247,900,STR_TO_DATE('2022-1-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('Avanti_Feeds',200,4,1247,1022,STR_TO_DATE('2022-4-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('TCS',3000,1,1247,6322,STR_TO_DATE('2021-7-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('TCS',6700,2,3247,13422,STR_TO_DATE('2021-10-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('TCS',11000,3,4247,20322,STR_TO_DATE('2022-1-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('TCS',20000,4,5247,231322,STR_TO_DATE('2022-4-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('Infosys',8000,1,2247,10322,STR_TO_DATE('2021-7-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('Infosys',9700,2,4247,18322,STR_TO_DATE('2021-10-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('Infosys',18000,3,10247,29322,STR_TO_DATE('2022-1-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('Infosys',25000,4,12247,41322,STR_TO_DATE('2022-4-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('Bajaj_Auto',300,1,447,1322,STR_TO_DATE('2021-7-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('Bajaj_Auto',670,2,1447,2322,STR_TO_DATE('2021-10-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('Bajaj_Auto',1100,3,4247,3322,STR_TO_DATE('2022-1-16','%Y-%m-%d'));
INSERT INTO `Quarterly results` VALUES ('Bajaj_Auto',2000,4,6247,4322,STR_TO_DATE('2022-4-16','%Y-%m-%d'));


CREATE TABLE IF NOT EXISTS `HighLow` (
  `Company_Name` VARCHAR(75) NOT NULL,
  `High` FLOAT NOT NULL,
  `Low` FLOAT NOT NULL,
  CONSTRAINT `High_ibfk_1` FOREIGN KEY(`Company_Name`) REFERENCES `Companies` (`Company_Name`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `HighLow` VALUES ('Avanti_Feeds',455,405);
INSERT INTO `HighLow` VALUES ('TCS',4355,4310);
INSERT INTO `HighLow` VALUES ('Infosys',5355,5310);
INSERT INTO `HighLow` VALUES ('Bajaj_Auto',2355,2310);


CREATE TABLE IF NOT EXISTS `Founders` (
  `Founder Name` VARCHAR(50) NOT NULL,
  `Companies Founded` VARCHAR(75) NOT NULL,
  `Founder ID` INT NOT NULL,
  CONSTRAINT `Fd_ibfk_1` FOREIGN KEY(`Companies Founded`) REFERENCES `Companies` (`Company_Name`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `Founders` VALUES ('Mr. Alluri Venkateswara Rao','Infosys',1);
INSERT INTO `Founders` VALUES ('Mr. Venkatramamna','TCS',2);
INSERT INTO `Founders` VALUES ('Mr. V.V.N Khandelwal','Avanti_Feeds',3);
INSERT INTO `Founders` VALUES ('Mr. Alluri Venkateswara Rao','Bajaj_Auto',1);

CREATE TABLE IF NOT EXISTS `Favorites` (
  `Company_Name` VARCHAR(75) NOT NULL,
  `Email ID` VARCHAR(75) NOT NULL,

  CONSTRAINT `Favorites_ibfk_1` FOREIGN KEY(`Email ID`) REFERENCES `User` (`Email ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Favorites_ibfk_2` FOREIGN KEY(`Company_Name`) REFERENCES `Companies` (`Company_Name`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `Favorites` VALUES ('Avanti_Feeds','rhythm.aggarwal@students.iiit.ac.in');
INSERT INTO `Favorites` VALUES ('Bajaj_Auto','mitansh.kayathwal@students.iiit.ac.in');
INSERT INTO `Favorites` VALUES ('TCS','mitansh.kayathwal@students.iiit.ac.in');
