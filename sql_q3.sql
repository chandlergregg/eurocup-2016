/*
 * 3. Write a SQL query to find the match number, date, and score for matches in which
 * no stoppage time was added in the 1st half.
 */
select
	  match_no
	, play_date as match_date
    , goal_score
from match_mast
where stop1_sec = 0;
