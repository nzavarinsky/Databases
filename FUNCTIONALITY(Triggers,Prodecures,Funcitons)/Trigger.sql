CREATE TRIGGER FKforCityMany on Students
AFTER INSERT,UPDATE
AS
IF exists (SELECT * FROM inserted WHERE City_ID NOT IN
		(SELECT City_ID from City))
BEGIN
PRINT 'Error : foreign key doesnt exists'
ROLLBACK TRANSACTION
END
GO

CREATE TRIGGER FKforCityPK ON City
AFTER DELETE
AS 
IF exists (SELECT * FROM deleted JOIN City ON City.City_ID = Deleted.City_ID)
BEGIN
PRINT ' Error : primary key'
END
GO
