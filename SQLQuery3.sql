

use Course418

--select [FullName] from Students
--union
--select [FullName] from Teachers



--select [FullName] from Students
--union all
--select [FullName] from Teachers


--select [FullName] from Students
--intersect
--select [FullName] from Teachers

--select [FullName] from Students
--except
--select [FullName] from Teachers

--insert into Teachers([FullName],[Salary],[Age])
--values('Test1',2000,32),
--      ('Test2',1600,25),
--	  ('Test3',1800,27),
--	  ('Test4',2500,35),
--	  ('Nurlan Musayev',2200,21)


--SELECT COUNT(*) as Count, Age
--FROM Students
--GROUP BY Age
--ORDER BY Age ASC;

--DECLARE @Counter INT 
--SET @Counter=1
--WHILE ( @Counter <= 10)
--BEGIN
--    PRINT 'The counter value is = ' + CONVERT(NVARCHAR,@Counter)
--    SET @Counter  = @Counter  + 1
--END


select GETDATE()


create table TeacherLogs(
    [Id] int primary key identity(1,1),
	[TeacherId] int,
	[Operation] nvarchar,
	[Date] datetime

)


select * from TeacherLogs

--create trigger trg_writeLogAfterCreate on Teachers
--after insert
--as  
--begin
--    insert into TeacherLogs([TeacherId],[Operation],[Date])
--	select [Id],'Insert',GETDATE() from inserted
--end



--insert into Teachers([Name],[Surname],[Age],[Email])
--values('Eltun','Haciyev',44,'eltn@mail.ru')




select * from TeacherLogs
select * from Teachers

create trigger trg_writeLogAfterCreate on Teachers
after update
as  
begin
    insert into TeacherLogs([TeacherId],[Operation],[Date]) 
	select [Id],'Update',GETDATE() from deleted
end

update Teachers
set [FullName] = 'Elgun Eliyev'
where [Id] = 4

select * from TeacherLogs where [Operation] = 'Update'


create table Employees(
     [Id] int primary key identity(1,1),
	 [EmployeeName] nvarchar,
	 [OldEmail] nvarchar(100),
	 [NewEmail] nvarchar(100),
	 [Operation] nvarchar(20),
	 [Date] datetime

)

insert into Employees([EmployeeName],[OldEmail],[NewEmail],[Operation],[Date])
values('Eltun Goyusov','eltun@gmail.ru','eltun1@gmail.ru',

