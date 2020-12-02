/*
 * 14. Write a SQL query to find referees and the number of bookings they made for the
 * entire tournament. Sort your answer by the number of bookings in descending order.
 */
select
	  rm.referee_id
	, rm.referee_name
	, count(*) as booking_count
from referee_mast rm
inner join match_mast mm
	on rm.referee_id = mm.referee_id
inner join player_booked pb
	on mm.match_no = pb.match_no
group by
	  rm.referee_id
	, rm.referee_name
order by booking_count desc;
