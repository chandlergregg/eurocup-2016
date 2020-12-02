/*
 * 11. Write a SQL query to find the players, their jersey number, and playing club who
 * were the goalkeepers for England in EURO Cup 2016.
 */
select
	  pm.player_id
	, pm.player_name
	, pm.jersey_no
    , pm.playing_club
from player_mast pm
inner join soccer_country sc
	on pm.team_id = sc.country_id
    and sc.country_name = 'England'
where pm.posi_to_play = 'GK';
