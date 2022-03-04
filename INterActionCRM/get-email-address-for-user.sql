-- get employee business email address

use interactiondb
go

select
[int_aux_listing].[listing_id] as [int_aux_listing],
[int_aux_listing].[display_nm] as [int_aux_listing_name],
[int_elec_addr_typ].[elec_addr_typ_nm],
[int_aux_elec_addr].[elec_addr],
[int_aux_elec_addr].[label],
[int_elec_addr_typ].[elec_addr_typ_id]
from [int_aux_listing]
inner join [int_aux_lst_eaddr] on [int_aux_listing].[listing_id] = [int_aux_lst_eaddr].[listing_id]
inner join [int_aux_elec_addr] on [int_aux_lst_eaddr].[elec_addr_id] = [int_aux_elec_addr].[elec_addr_id]
inner join [int_elec_addr_typ] on [int_aux_elec_addr].[elec_addr_typ_id] = [int_elec_addr_typ].[elec_addr_typ_id]
where ([int_elec_addr_typ].[elec_addr_typ_id] = 1) -- email
and ([int_aux_elec_addr].[label] = 'Business')

