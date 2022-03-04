


select
[int_aux_listing].*
from [int_aux_listing]

inner join [int_aux_dir_list] on [int_aux_listing].[listing_id] = [int_aux_dir_list].[listing_id]
  and [int_aux_listing].[listing_src_id] = [int_aux_dir_list].[listing_src_id]
inner join [int_aux_directory] on [int_aux_dir_list].[contain_dir_id] = [int_aux_directory].[directory_id]
  and [int_aux_dir_list].[contain_dir_src_id] = [int_aux_directory].[directory_src_id]

and [int_aux_directory].[directory_nm] = 'personnel'