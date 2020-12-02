/*
 * 18. Write a SQL query to find the highest number of foul cards given in one match.
 */
select
	  pb.match_no
	, count(*) as card_count
from player_booked pb
group by
	  pb.match_no
order by card_count desc;
