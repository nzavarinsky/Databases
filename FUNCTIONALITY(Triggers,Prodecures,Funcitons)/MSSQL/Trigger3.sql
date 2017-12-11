CREATE TRIGGER Riznica On StudentsParam
AFTER INSERT,UPDATE
AS
DECLARE @DateOFVst int
DECLARE @DateOfBirth int
IF exists (SELECT DateOfBirth,DateOFVst from StudentsParam where Rizn > 16)
BEGIN
PRINT 'Error'
ROLLBACK TRANSACTION
END
