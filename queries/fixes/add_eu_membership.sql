---Add information for whether countries are EU members as of 31 December 2021
--adds as boolean value

Alter table tbl_countries
Add eu_membership boolean;

Update tbl_countries
SET eu_membership = TRUE
Where country_name in ('Austria', 'Belgium', 'Bulgaria', 'Croatia', 'Cyprus', 
					   'Czechia', 'Denmark', 'Estonia', 'Finland', 'France', 'Germany', 
					   'Greece', 'Hungary', 'Ireland', 'Italy', 'Latvia', 'Lithuania', 'Luxembourg',
					   'Malta', 'Netherlands', 'Poland', 'Portugal', 'Romania', 'Slovakia', 
					   'Slovenia', 'Spain', 'Sweden', 'European Union');
					   
Select country_name
from tbl_countries
where country_region = 5 and eu_membership = TRUE
order by (country_name = 'European Union') DESC, country_name;

--adds EU as separate member 
Insert into tbl_membership_by_agreements (id_mem_country, agreement_id, country_id, mem_type_id, mem_start,mem_accept_step)
Values (473, 7, 250, 2,'2008-6-17', 3);

