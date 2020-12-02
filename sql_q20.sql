/*
 * 20. Write a SQL query to find the substitute players who came into the field in the first
 * half of play, within a normal play schedule.
 */
select
	  pm.player_id
	, pm.player_name
from player_in_out pio
inner join player_mast pm
	on pio.player_id = pm.player_id
where pio.in_out = 'I'
and pio.play_schedule = 'NT'
and pio.play_half = 1;
