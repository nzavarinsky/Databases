drop procedure getStudents_Indebtness2
go
create procedure getStudents_Indebtness2(
@id int
)
as
begin
 if @id = 0
  select (select Students_ID from Students where ub.Students_ID=Students.Students_ID),
    (select Indebtedness from Indebtedness where ub.Indebt_ID=Indebtedness.Indebt_ID)
    from Students_Indebtness as ub
 if @id > 0 
  select (select Surname from Students where ub.Students_ID=Students.Students_ID),
    (select Indebtedness from Indebtedness where ub.Indebt_ID=Indebtedness.Indebt_ID)
    from Students_Indebtness as ub where ub.Indebt=@id
end
go

exec getStudents_Indebtness2 0
go