-- people_listing_company_listing

-- from a person perspective
select
top (100)
[person].[listing_id],
[person].[display_nm],
[person].[company_list_id],
[company].[listing_id] as [company_listing_id],
[company].[display_nm] as [company_display_nm]
from [agmrkprodsql3].[intera].[dbo].[int_aux_listing] as [person]
left join [agmrkprodsql3].[intera].[dbo].[int_aux_listing] as [company] on [person].[company_list_id] = [company].[listing_id]
where [person].[listing_typ_ind] = 0 -- 0 = person, 1 = company, 2 = unknown
order by [person].[display_nm]

-- from a company perspective
select top(100)
[company].[listing_id] as [company_listing_id],
[company].[display_nm] as [company_display_nm],
[person].[listing_id] as [person_listing_id],
[person].[display_nm] as [person_display_nm],
[person].[company_list_id] as [person_company_list_id]
from [agmrkprodsql3].[intera].[dbo].[int_aux_listing] as [company]
left join [agmrkprodsql3].[intera].[dbo].[int_aux_listing] as [person] on [company].[listing_id] = [person].[company_list_id]
where [company].[listing_typ_ind] = 1
order by [company].[display_nm]



