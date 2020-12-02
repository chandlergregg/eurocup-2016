/*
 * 13. Write a SQL query to find all the defenders who scored a goal for their teams.
 */
select
	  pm.player_id
	, pm.player_name
    , pm.posi_to_play
    , count(distinct gd.goal_id) as goal_count
from goal_details gd
inner join player_mast pm
	on gd.player_id = pm.player_id
where pm.posi_to_play = 'DF'
group by
	  pm.player_id
	, pm.player_name
order by goal_count desc;
