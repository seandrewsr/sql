-- reindex-script.sql

use interactiondb
go

declare @objname varchar(80)
declare @reindstr varchar(200)

declare mycursor cursor for
	select name from sysobjects
        where type = 'U' and name like 'INT_%'
        and name not like '%DTS%' and
	   uid != user_id('IDCAPP')
        order by name desc

open mycursor

fetch mycursor into @objname

while @@fetch_status = 0
begin
	set @reindstr = 'dbcc dbreindex (''' + ltrim(rtrim(@objname)) + '''' + ',''''' + ',0,SORTED_DATA_REORG)'
	
	exec (@reindstr)
  
	fetch mycursor into @objname
end  

close mycursor
deallocate mycursor
go


