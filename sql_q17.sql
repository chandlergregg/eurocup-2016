/*
 * 17. Write a SQL query to find the country where the most assistant referees come from,
 * and the count of the assistant referees.
 */
select
	  sc.country_name
	, count(distinct arm.ass_ref_id) as asst_ref_count
from asst_referee_mast arm
inner join soccer_country sc
	on arm.country_id = sc.country_id
group by
	  sc.country_name
order by asst_ref_count desc;
