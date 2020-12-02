/*
 * 12. Write a SQL query that returns the total number of goals scored by each position on
 * each country’s team. Do not include positions which scored no goals.
 */
select
	  sc.country_name
	, pm.posi_to_play
    , count(distinct gd.goal_id) as goal_count
from goal_details gd
inner join player_mast pm
	on gd.player_id = pm.player_id
inner join soccer_country sc
	on gd.team_id = sc.country_id
group by
	  sc.country_name
	, pm.posi_to_play
order by
	  sc.country_name
	, goal_count desc;
