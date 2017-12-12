/*
 * ER/Studio Data Architect 11.0 SQL Code Generation
 * Project :      DATA MODEL
 *
 * Date Created : Tuesday, November 21, 2017 13:30:19
 * Target DBMS : Microsoft SQL Server 2014
 */

USE master
go
CREATE DATABASE LAB6SCRIPTED
go
USE LAB6SCRIPTED
go
/* 
 * TABLE: Resident 
 */

CREATE TABLE Resident(
    DatesOfVisit    char(10)         NOT NULL,
    Status          varchar(1050)    NOT NULL,
    PIB             varchar(50)      NULL,
    BloodGroup      varchar(10)      NULL,
    Adress          varchar(50)      NULL,
    Xvorobu         char(10)         NOT NULL,
    YearOfBirth     int              NULL,
    CONSTRAINT PK1 PRIMARY KEY CLUSTERED (DatesOfVisit, Status)
	ALTER TABLE Resident  WITH CHECK ADD  CONSTRAINT [RezusGroup] CHECK  (([BloodGroup] like '+%'))
	GO
)
go



IF OBJECT_ID('Resident') IS NOT NULL
    PRINT '<<< CREATED TABLE Resident >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Resident >>>'
go

/* 
 * TABLE: [Перелік листів непрацездатності] 
 */

CREATE TABLE [Перелік листів непрацездатності](
    DoctorOfUnworking    varchar(1050)    NOT NULL,
    dateOfClosing        char(10)         NULL,
    Diagnos              char(10)         NULL,
    dateOfOpening        char(10)         NULL,
    CONSTRAINT PK8 PRIMARY KEY CLUSTERED (DoctorOfUnworking)
)
go



IF OBJECT_ID('Перелік листів непрацездатності') IS NOT NULL
    PRINT '<<< CREATED TABLE Перелік листів непрацездатності >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Перелік листів непрацездатності >>>'
go

/* 
 * TABLE: Поліклініка 
 */

CREATE TABLE Поліклініка(
    PIB             varchar(50)    NOT NULL,
    Speciality      varchar(50)    NULL,
    NumOfRoom       varchar(50)    NULL,
    PhoneNumbers    varchar(50)    NULL,
    CONSTRAINT PK2 PRIMARY KEY CLUSTERED (PIB)
)
go



IF OBJECT_ID('Поліклініка') IS NOT NULL
    PRINT '<<< CREATED TABLE Поліклініка >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Поліклініка >>>'
go

/* 
 * TABLE: Скарги 
 */

CREATE TABLE Скарги(
    Скарга               varchar(50)      NULL,
    DatesOfVisit         char(10)         NOT NULL,
    PIB                  varchar(50)      NOT NULL,
    Status               varchar(1050)    NOT NULL,
    DoctorOfUnworking    varchar(1050)    NOT NULL
)
go



IF OBJECT_ID('Скарги') IS NOT NULL
    PRINT '<<< CREATED TABLE Скарги >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Скарги >>>'
go

/* 
 * INDEX: Ref12 
 */

CREATE INDEX Ref12 ON Скарги(DatesOfVisit, Status)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Скарги') AND name='Ref12')
    PRINT '<<< CREATED INDEX Скарги.Ref12 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Скарги.Ref12 >>>'
go

/* 
 * INDEX: Ref23 
 */

CREATE INDEX Ref23 ON Скарги(PIB)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Скарги') AND name='Ref23')
    PRINT '<<< CREATED INDEX Скарги.Ref23 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Скарги.Ref23 >>>'
go

/* 
 * INDEX: Ref85 
 */

CREATE INDEX Ref85 ON Скарги(DoctorOfUnworking)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Скарги') AND name='Ref85')
    PRINT '<<< CREATED INDEX Скарги.Ref85 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Скарги.Ref85 >>>'
go

/* 
 * TABLE: Скарги 
 */

ALTER TABLE Скарги ADD CONSTRAINT RefResident2 
    FOREIGN KEY (DatesOfVisit, Status)
    REFERENCES Resident(DatesOfVisit, Status)
go

ALTER TABLE Скарги ADD CONSTRAINT RefПоліклініка3 
    FOREIGN KEY (PIB)
    REFERENCES Поліклініка(PIB)
go

ALTER TABLE Скарги ADD CONSTRAINT RefПерелік_листів_непрацездатності5 
    FOREIGN KEY (DoctorOfUnworking)
    REFERENCES [Перелік листів непрацездатності](DoctorOfUnworking)
go


