
CREATE FUNCTION average()
returns int
AS
BEGIN
declare @avegare int
 set @avegare = (select avg(NumOfStudentDocument) from Students)
return @avegare 
end
GO
select [dbo].average()