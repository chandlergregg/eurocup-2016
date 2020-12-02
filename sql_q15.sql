/*
 * 15. Write a SQL query to find the referees who booked the most number of players.
 */
select
	  rm.referee_id
	, rm.referee_name
	, count(distinct pb.player_id) as booking_player_count
from referee_mast rm
inner join match_mast mm
	on rm.referee_id = mm.referee_id
inner join player_booked pb
	on mm.match_no = pb.match_no
group by
	  rm.referee_id
	, rm.referee_name
order by booking_player_count desc;
