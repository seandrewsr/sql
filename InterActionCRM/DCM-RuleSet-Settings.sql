-- get that we want a list of all
-- settings for each Rule Collection
-- anything not showing in the result set
-- has an action of "Accept"
select
int_change_rule_collection.rule_collection_id as [Rule Collection ID Number],
int_change_rule_collection.rule_collection_nm as [Rule Collection Name], 

case int_change_rule.field_typ_ind
when 0 then 'undefined'
when 1 then 'Title'
when 2 then 'First Name'
when 3 then 'Goes By'
when 4 then 'Middle Name'
when 5 then 'Last Name'
when 6 then 'Suffix'
when 7 then 'Department'
when 8 then 'Assistant Name'
when 9 then 'Job Title'
when 10 then 'Company Name (Person)'
when 11 then 'Company Name (Company)'
when 12 then 'Company Common Name (Company)'
when 13 then 'Address'
when 14 then 'Phone'
when 15 then 'EAddr'
when 1000 then 'Contact Type'
end as [Field], --field_typ_ind

case int_change_rule.change_typ_ind
when 0 then 'Undefined'
when 1 then 'Add'
when 2 then 'Change'
when 3 then 'Delete'
when 4 then 'Format'
when 5 then 'Suspect'
end as [Action], --change_typ_ind

case int_change_rule.rule_action_ind
when 0 then 'None'
when 1 then 'Submit'
when 2 then 'Review'
when 3 then 'Reserved'
when 4 then 'Accept'
when 5 then 'Reject'
end as [Rule], --rule_action_ind

case int_change_rule.notify_ind
when 0 then 'No'
when 1 then 'Yes'
end as Notify

from  int_change_rule_collection
inner join int_change_rule on int_change_rule_collection.rule_collection_id = int_change_rule.rule_collection_id
--where (rule_collection_nm = 'Affiliate Rule Collection')
order by [Rule Collection Name],[Field]




/*
-- get a list of the Data Change Management Rule Collections
select
rule_collection_id,
rule_collection_nm,
base_rule_collection_id, -- 0 = default system
system_ind,
active_ind
from int_change_rule_collection
where base_rule_collection_id > 0
order by rule_collection_nm
*/
