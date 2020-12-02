/*
 * 9. Write a SQL query to find the goalkeeper’s name and jersey number, playing for
 * Germany, who played in Germany’s group stage matches
 */
select distinct
	  player_name
	, jersey_no
from soccer_team st
inner join soccer_country sc
	on st.team_id = sc.country_id
inner join player_mast pm
	on st.team_id = pm.team_id
inner join match_details md
	on st.team_id = md.team_id
where sc.country_name = 'Germany'
and pm.posi_to_play = 'GK'
and md.play_stage = 'G';
