/*
 * 6. Write a SQL query to find the number of matches that were won by a single point, but
 * do not include matches decided by penalty shootout.
 */
select
	  count(distinct match_no) as matchcount
from match_mast
where abs(cast(substring(goal_score, 1, locate('-', goal_score) - 1) as signed) -
		  cast(substring(goal_score, locate('-', goal_score) + 1, length(goal_score)) as signed)) = 1
and decided_by = 'N';
