/*
Write a sql query to find cancellation rate of requests with unbanned users (both client and driver not banned) each day between "2013-10-01" and "2013-10-03" round cancellation rate to two decimal points
cancellation rate is divide num of canceled (by client or driver) by total reusqsts with unbanned user on that day
*/
select * from Trips;
select * from Users;

select *,round((cancel_rate/total_rides),2) cancel_percentage from (
select request_at, count(case when status in ('cancelled_by_client', 'cancelled_by_driver') then 1 else null end ) as cancel_rate, count(1) as total_rides 
from trips t
inner join  Users c on t.client_id=c.users_id 
inner join  Users d on t.driver_id=d.users_id 
where c.banned='No' and d.banned='No' 
group by 1) x;



