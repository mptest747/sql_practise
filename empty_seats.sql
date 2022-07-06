-- select * from movie;
with cte1 as (
select * 
,left(seat,1) as row_id,cast(substr(seat,2,2) as decimal )  seat_num
from movie),
 cte2 as (
select *, max(occupancy) over (partition by row_id order by seat_num rows between current row and 3 following ) as max_num 
,count(*) over (partition by row_id order by seat_num rows between current row and 3 following ) as max_count from cte1),
cte3 as (
select * from cte2 where max_count=4 and max_num=0 )
select * from cte2 inner join cte3 on cte2.row_id=cte3.row_id and cte2.seat_num between cte3.seat_num and cte3.seat_num+ 3