

-- people_at_law_firm.sql

select
int_aux_listing.listing_id,
int_aux_listing.listing_src_id,
int_aux_listing.display_nm,
int_aux_listing.company_nm
from int_aux_listing
where int_aux_listing.company_nm = 'Finnegan, Henderson, Farabow, Garrett & Dunner, LLP'
order by int_aux_listing.display_nm


