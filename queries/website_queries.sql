--Get list of all current exporting members for website	
Select  country_name
from tbl_countries as c
inner join tbl_membership_by_agreements as ma
on c.id_countries = ma.country_id
where mem_end is NULL and agreement_id =7 and mem_type_id = 1
order by country_name;

--get list of all current importing members (need to add EU info to db)
Select  country_name
from tbl_countries as c
inner join tbl_membership_by_agreements as ma
on c.id_countries = ma.country_id
where mem_end is NULL and mem_type_id = 2 and agreement_id =7
order by (c.country_name = 'European Union') DESC, c.eu_membership, c.country_name;


--Count number of importing members 
Select count(country_id) as total, mem_type_name
from tbl_membership_by_agreements
inner join tbl_mem_type
on idmember= mem_type_id
where mem_end is NULL and agreement_id =7 and country_id not in 
--excludes individual eu member countries but keeps EU for the total
	(Select id_countries
	from tbl_countries
	where country_region = 5 and eu_membership = TRUE and not id_countries = 250)
group by mem_type_name;



