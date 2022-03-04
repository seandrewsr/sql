-- get a list of interaction user accounts

use interactiondb
go

select
[int_user].[account_nm] as [account],
[int_user].[first_nm] as [firstname],
[int_user].[last_nm] as [lastname],
case when [int_user].[active_ind] = 0 then 'inactive' else 'active' end as [accountstatus] -- 0 = inactive users 1 = inactive users
from [int_user]
where [int_user].[account_nm] not in ('iaadmin', '02csync')
order by [int_user].[account_nm]
