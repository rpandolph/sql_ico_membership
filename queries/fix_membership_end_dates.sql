--Fix countries that have left ICA 2007
--First get the id for the membership by agreement table based on country and agreement
Select country_id, country_name, mem_end, id_mem_country
from tbl_membership_by_agreements as ma
inner join tbl_countries as c
on c.id_countries = ma.country_id
where country_name in ('Guatemala', 'Paraguay', 'Turkey', 'United States of America') and agreement_id =7

--change USA end date
Update tbl_membership_by_agreements
SET mem_end = '2018-06-27'
where id_mem_country = 470;

--add Paraguay's end date
Update tbl_membership_by_agreements
Set mem_end = '2019-11-26'
where id_mem_country = 284;

--Check which countries have end dates for ICA 2007(should just be the 4)
Select  country_name, mem_end, id_mem_country
from tbl_membership_by_agreements as ma
inner join tbl_countries as c
on c.id_countries = ma.country_id
where mem_end is not NULL and agreement_id =7
order by country_name;

Update tbl_membership_by_agreements
Set mem_end = NULL
where id_mem_country = 256 or id_mem_country = 257 ;

--Add DRC and Nigeria Memberships
Insert into tbl_membership_by_agreements (id_mem_country, agreement_id, country_id, mem_type_id, mem_start,mem_accept_step)
Values (474, 7, 18, 1,'2021-07-08', 5),
	   (475, 7, 4, 1,'2014-12-15', 9);