
CREATE PROCEDURE create_2tables_v4
AS
BEGIN

	DECLARE @sqlCOmmand varchar(300)
	DECLARE @timestamp varchar(20)
	SET @timestamp = replace(convert(VARCHAR(10),getdate(),111),'/','') +
       replace(convert(VARCHAR(8),getdate(),108),':','')
	SET @sqlCOmmand = 'create table testt1' + @timestamp +
	'(Name varchar(50), Sur varchar(50),MId varchar(50),Rate int,DateOFVst int,DateOfBirth int,Email varchar(50))'
	EXECUTE (@sqlCommand)
	SET @sqlCOmmand = 'create table testt2' + @timestamp +
	'(Name varchar(50), Sur varchar(50),MId varchar(50),Rate int,DateOFVst int,DateOfBirth int,Email varchar(50))'
	EXECUTE (@sqlCommand)



	DECLARE @Name varchar(50)
	DECLARE @Sur varchar(50)
	DECLARE @MId varchar(50)
	DECLARE @Rate int
	DECLARE @DateOFVst int
	DECLARE @DateOfBirth int
	DECLARE @Email varchar(50)
 	DECLARE @r int
	DECLARE CursForLabv1 CURSOR
	FOR SELECT Name,Sur,MId,Rate,DateOFVst,DateOfBirth,Email from StudentsParam
	OPEN CursForLabv1
	FETCH NEXT FROM CursForLabv1 into @Name,@Sur,@MId,@Rate,@DateOFVst,@DateOfBirth,@Email
	WHILE @@FETCH_STATUS=0
	BEGIN
	SET @r  =RAND()*10000
	IF @r%2 = 1
	SET @sqlCOmmand = 'insert into testt1' + @timestamp + ' values('' @Name  '',''  @Sur '',''  @MId'','  + convert(varchar(50),@Rate) +',' + convert(varchar(50),@DateOFVst) +',' + convert(varchar(50),@DateOfBirth) +','' @Email '')'
	ELSE
	SET @sqlCOmmand = 'insert into testt2' + @timestamp + ' values('' @Name '','' @Sur '','' @MId'','  + convert(varchar(50),@Rate) +',' + convert(varchar(50),@DateOFVst) +',' + convert(varchar(50),@DateOfBirth) +',''  @Email '')'
	print @sqlCOmmand
	EXECUTE (@sqlCommand)


	FETCH NEXT FROM CursForLabv1 into @Name,@Sur,@MId,@Rate,@DateOFVst,@DateOfBirth,@Email
	END
	CLOSE CursForLabv1
	DEALLOCATE CursForLabv1
	
END

execute create_2tables_v4

