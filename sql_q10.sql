/*
 * 10. Write a SQL query to find all available information about the players under contract to
 * Liverpool F.C. playing for England in EURO Cup 2016.
 */
select
	  pm.*
from player_mast pm
inner join soccer_country sc
	on pm.team_id = sc.country_id
where pm.playing_club = 'Liverpool'
and sc.country_name = 'England';
