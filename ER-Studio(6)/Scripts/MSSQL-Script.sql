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
 * TABLE: [������ ����� ���������������] 
 */

CREATE TABLE [������ ����� ���������������](
    DoctorOfUnworking    varchar(1050)    NOT NULL,
    dateOfClosing        char(10)         NULL,
    Diagnos              char(10)         NULL,
    dateOfOpening        char(10)         NULL,
    CONSTRAINT PK8 PRIMARY KEY CLUSTERED (DoctorOfUnworking)
)
go



IF OBJECT_ID('������ ����� ���������������') IS NOT NULL
    PRINT '<<< CREATED TABLE ������ ����� ��������������� >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ������ ����� ��������������� >>>'
go

/* 
 * TABLE: �������� 
 */

CREATE TABLE ��������(
    PIB             varchar(50)    NOT NULL,
    Speciality      varchar(50)    NULL,
    NumOfRoom       varchar(50)    NULL,
    PhoneNumbers    varchar(50)    NULL,
    CONSTRAINT PK2 PRIMARY KEY CLUSTERED (PIB)
)
go



IF OBJECT_ID('��������') IS NOT NULL
    PRINT '<<< CREATED TABLE �������� >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE �������� >>>'
go

/* 
 * TABLE: ������ 
 */

CREATE TABLE ������(
    ������               varchar(50)      NULL,
    DatesOfVisit         char(10)         NOT NULL,
    PIB                  varchar(50)      NOT NULL,
    Status               varchar(1050)    NOT NULL,
    DoctorOfUnworking    varchar(1050)    NOT NULL
)
go



IF OBJECT_ID('������') IS NOT NULL
    PRINT '<<< CREATED TABLE ������ >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ������ >>>'
go

/* 
 * INDEX: Ref12 
 */

CREATE INDEX Ref12 ON ������(DatesOfVisit, Status)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('������') AND name='Ref12')
    PRINT '<<< CREATED INDEX ������.Ref12 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ������.Ref12 >>>'
go

/* 
 * INDEX: Ref23 
 */

CREATE INDEX Ref23 ON ������(PIB)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('������') AND name='Ref23')
    PRINT '<<< CREATED INDEX ������.Ref23 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ������.Ref23 >>>'
go

/* 
 * INDEX: Ref85 
 */

CREATE INDEX Ref85 ON ������(DoctorOfUnworking)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('������') AND name='Ref85')
    PRINT '<<< CREATED INDEX ������.Ref85 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ������.Ref85 >>>'
go

/* 
 * TABLE: ������ 
 */

ALTER TABLE ������ ADD CONSTRAINT RefResident2 
    FOREIGN KEY (DatesOfVisit, Status)
    REFERENCES Resident(DatesOfVisit, Status)
go

ALTER TABLE ������ ADD CONSTRAINT Ref��������3 
    FOREIGN KEY (PIB)
    REFERENCES ��������(PIB)
go

ALTER TABLE ������ ADD CONSTRAINT Ref������_�����_���������������5 
    FOREIGN KEY (DoctorOfUnworking)
    REFERENCES [������ ����� ���������������](DoctorOfUnworking)
go


