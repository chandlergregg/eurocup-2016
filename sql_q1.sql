/*
 * 1. Write a SQL query to find the date EURO Cup 2016 started on.
 */
select
	  min(play_date) as play_start_date
from match_mast;
