CREATE PROCEDURE ParamInsert
@Name varchar(50),
@Sur varchar(50),
@MId varchar(50),
@Rate int,
@DateOFVst int,
@DateOfBirth int,
@Email varchar(50)
AS
BEGIN
INSERT INTO StudentsParam
values(@Name ,
@Sur,
@MId,
@Rate,
@DateOFVst,
@DateOfBirth,
@Email)
END
exec ParamInsert 'H','LOL','qdsfdswe',8,8,8,'qdasfdsfwe'