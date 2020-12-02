/*
 * 5. Write a SQL query to find the number of bookings that happened in stoppage time.
 */
select
	  count(*) as ST_booking_count
from player_booked
where play_schedule = 'ST';
