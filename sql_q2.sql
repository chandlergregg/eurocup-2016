/*
 * 2. Write a SQL query to find the number of matches that were won by penalty shootout.
 */
select
	  count(distinct match_no) as match_count
from match_mast
where decided_by = 'P';
