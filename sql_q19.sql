/*
 * 19. Write a SQL query to find the number of captains who were also goalkeepers.
 */
select distinct
	  pm.player_id
	, pm.player_name
from match_details md
inner join match_captain mc
	on md.match_no = mc.match_no
    and md.player_gk = mc.player_captain
inner join player_mast pm
	on mc.player_captain = pm.player_id;
