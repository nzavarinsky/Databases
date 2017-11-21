CREATE TRIGGER StudentNumCheck ON StudentsParam
AFTER INSERT,UPDATE
AS
DECLARE @Rate int
IF exists (SELECT * from StudentsParam where Rate like 'A[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][a-Z]')
BEGIN
PRINT 'Error'
ROLLBACK TRANSACTION
END
GO