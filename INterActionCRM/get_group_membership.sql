-- get_group_membership.sql

use interactiondb
go

-- get users who are in the
-- interaction marketing lead pilot group
select
[int_user].[user_id],
[int_user].[account_nm],
[int_group].[group_id],
[int_group].[group_nm],
[int_group].[active_ind],
[int_group_user].[group_id],
[int_group_user].[user_id]
from [int_user]
inner join [int_group_user] on [int_user].[user_id] = [int_group_user].[user_id]
left join [int_group] on [int_group_user].[group_id] = [int_group].[group_id]
order by [int_group].[group_nm] asc

