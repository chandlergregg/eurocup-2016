/*
 * 8. Write a SQL query to find the match number for the game with the highest number of
 * penalty shots, and which countries played that match.
 */
select
	  match_no
	, team_id
	, count(distinct kick_id) as penalty_kick_count
from penalty_shootout
group by
	  match_no
	, team_id
order by
	  penalty_kick_count desc
limit 2;
