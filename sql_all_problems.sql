CREATE SCHEMA euro_cup_2016;
USE euro_cup_2016;

/*
 * 1. Write a SQL query to find the date EURO Cup 2016 started on.
 */
select
	  min(play_date) as play_start_date
from match_mast;

/*
 * 2. Write a SQL query to find the number of matches that were won by penalty shootout.
 */
select
	  count(distinct match_no) as match_count
from match_mast
where decided_by = 'P';

/*
 * 3. Write a SQL query to find the match number, date, and score for matches in which
 * no stoppage time was added in the 1st half.
 */
select
	  match_no
	, play_date as match_date
    , goal_score
from match_mast
where stop1_sec = 0;

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

/*
 * 5. Write a SQL query to find the number of bookings that happened in stoppage time.
 */
select
	  count(*) as ST_booking_count
from player_booked
where play_schedule = 'ST';

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

/*
 * 7. Write a SQL query to find all the venues where matches with penalty shootouts were
 * played.
 */
select
	  sv.venue_id
	, sv.venue_name
from match_mast mm
inner join soccer_venue sv
	on mm.venue_id = sv.venue_id
where decided_by = 'P';

/*
 * 8. Write a SQL query to find the match number for the game with the highest number of
 * penalty shots, and which countries played that match.
 */
select
	  match_no
	, team_id
	, count(distinct kick_id) as penalty_kick_count
from penalty_shootout
group by
	  match_no
	, team_id
order by
	  penalty_kick_count desc
limit 2;

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

/*
 * 14. Write a SQL query to find referees and the number of bookings they made for the
 * entire tournament. Sort your answer by the number of bookings in descending order.
 */
select
	  rm.referee_id
	, rm.referee_name
	, count(*) as booking_count
from referee_mast rm
inner join match_mast mm
	on rm.referee_id = mm.referee_id
inner join player_booked pb
	on mm.match_no = pb.match_no
group by
	  rm.referee_id
	, rm.referee_name
order by booking_count desc;

/*
 * 15. Write a SQL query to find the referees who booked the most number of players.
 */
select
	  rm.referee_id
	, rm.referee_name
	, count(distinct pb.player_id) as booking_player_count
from referee_mast rm
inner join match_mast mm
	on rm.referee_id = mm.referee_id
inner join player_booked pb
	on mm.match_no = pb.match_no
group by
	  rm.referee_id
	, rm.referee_name
order by booking_player_count desc;

/*
 * 16. Write a SQL query to find referees and the number of matches they worked in each
 * venue.
 */
select
	  rm.referee_id
	, rm.referee_name
    , sv.venue_name
    , count(distinct mm.match_no) as match_count
from referee_mast rm
inner join match_mast mm
	on rm.referee_id = mm.referee_id
inner join soccer_venue sv
	on mm.venue_id = sv.venue_id
group by
	  rm.referee_id
	, rm.referee_name
    , sv.venue_name
order by match_count desc;

/*
 * 17. Write a SQL query to find the country where the most assistant referees come from,
 * and the count of the assistant referees.
 */
select
	  sc.country_name
	, count(distinct arm.ass_ref_id) as asst_ref_count
from asst_referee_mast arm
inner join soccer_country sc
	on arm.country_id = sc.country_id
group by
	  sc.country_name
order by asst_ref_count desc;

/*
 * 18. Write a SQL query to find the highest number of foul cards given in one match.
 */
select
	  pb.match_no
	, count(*) as card_count
from player_booked pb
group by
	  pb.match_no
order by card_count desc;

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
