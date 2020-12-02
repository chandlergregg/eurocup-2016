/*
 * 7. Write a SQL query to find all the venues where matches with penalty shootouts were
 * played.
 */
select
	  sv.venue_id
	, sv.venue_name
from match_mast mm
inner join soccer_venue sv
	on mm.venue_id = sv.venue_id
where decided_by = 'P';
