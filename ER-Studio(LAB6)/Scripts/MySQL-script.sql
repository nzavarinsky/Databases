--
-- ER/Studio Data Architect 11.0 SQL Code Generation
-- Project :      Model1.DM1
--
-- Date Created : Tuesday, November 21, 2017 14:27:42
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: Resident 
--

CREATE TABLE Resident(
    DatesOfVisit    CHAR(10)         NOT NULL,
    Status          VARCHAR(1050)    NOT NULL,
    PIB             VARCHAR(50),
    BloodGroup      VARCHAR(10),
    Adress          VARCHAR(50),
    Xvorobu         CHAR(10)         NOT NULL,
    YearOfBirth     INT,
    PRIMARY KEY (DatesOfVisit, Status)
	ALTER TABLE Resident  WITH CHECK ADD  CONSTRAINT [RezusGroup] CHECK  (([BloodGroup] like '+%'))
)ENGINE=MYISAM
;



-- 
-- TABLE: `ListsOfUnworking` 
--

CREATE TABLE ListsOfUnworking(
    DoctorOfUnworking    VARCHAR(1050)    NOT NULL,
    dateOfClosing        CHAR(10),
    Diagnos              CHAR(10),
    dateOfOpening        CHAR(10),
    PRIMARY KEY (DoctorOfUnworking)
)ENGINE=MYISAM
;



-- 
-- TABLE: Поліклініка 
--

CREATE TABLE Clinic(
    PIB             VARCHAR(50)    NOT NULL,
    Speciality      VARCHAR(50),
    NumOfRoom       VARCHAR(50),
    PhoneNumbers    VARCHAR(50),
		ALTER TABLE Clinic  WITH CHECK ADD  CONSTRAINT [Num] CHECK  (([NumOfRoom] like '%3'))
    PRIMARY KEY (PIB)
)ENGINE=MYISAM
;



-- 
-- TABLE: Скарги 
--

CREATE TABLE Skargs(
    Skarga               VARCHAR(50),
    DatesOfVisit         CHAR(10)         NOT NULL,
    PIB                  VARCHAR(50)      NOT NULL,
    Status               VARCHAR(1050)    NOT NULL,
    DoctorOfUnworking    VARCHAR(1050)    NOT NULL
)ENGINE=MYISAM
;



-- 
-- INDEX: Ref12 
--

CREATE INDEX Ref12 ON Скарги(DatesOfVisit, Status)
;
-- 
-- INDEX: Ref23 
--

CREATE INDEX Ref23 ON Skargs(PIB)
;
-- 
-- INDEX: Ref85 
--

CREATE INDEX Ref85 ON Skargs(DoctorOfUnworking)
;
-- 
-- TABLE: Скарги 
--

ALTER TABLE Skargs ADD CONSTRAINT RefResident2 
    FOREIGN KEY (DatesOfVisit, Status)
    REFERENCES Resident(DatesOfVisit, Status)
;

ALTER TABLE Скарги ADD CONSTRAINT RefClinic3 
    FOREIGN KEY (PIB)
    REFERENCES Clinic(PIB)
;

ALTER TABLE Скарги ADD CONSTRAINT RefListsOfUnworking5 
    FOREIGN KEY (DoctorOfUnworking)
    REFERENCES `ListsOfUnworking`(DoctorOfUnworking)
;


