/*
 * 16. Write a SQL query to find referees and the number of matches they worked in each
 * venue.
 */
select
	  rm.referee_id
	, rm.referee_name
    , sv.venue_name
    , count(distinct mm.match_no) as match_count
from referee_mast rm
inner join match_mast mm
	on rm.referee_id = mm.referee_id
inner join soccer_venue sv
	on mm.venue_id = sv.venue_id
group by
	  rm.referee_id
	, rm.referee_name
    , sv.venue_name
order by match_count desc;
