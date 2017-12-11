
CREATE FUNCTION TrackingItemsModified(@min int)
RETURNS @trackingItems TABLE (
   Concated       varchar(50)
) 
AS
BEGIN
   INSERT INTO @trackingItems (City)
   SELECT concat(CityID, Region)
   FROM   Region
     
   RETURN;
END;
GO
select * from TrackingItemsModified(2)