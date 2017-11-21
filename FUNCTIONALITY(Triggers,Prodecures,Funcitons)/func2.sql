
CREATE FUNCTION keys6()
returns varchar(50)
AS
BEGIN
declare @regcit varchar(50)
set @regcit = (SELECT TOP 1 concat(RegionID,City) from City AS QWE) 
return @regcit
end
select [dbo].keys6()