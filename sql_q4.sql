/*
 * 4. Write a SQL query to compute a list showing the number of substitutions that
 * happened in various stages of play for the entire tournament.
 */
select
	  play_stage
	, sum(case when in_out = 'I' then 1 end) as num_substitutions
from match_mast mm
inner join player_in_out pio
	on mm.match_no = pio.match_no
group by play_stage
order by play_stage;
