select * from icc_world_cup;


select team, count(1) as no_of_matches_played, sum(Win_flag) as wins, count(1)-sum(Win_flag) as loss from
(
select Team_1 as team  , case when Team_1=winner then 1 else 0 end as Win_flag
from icc_world_cup
union all 
select Team_2 as team , case when Team_2=winner then 1 else 0 end as Win_flag
from icc_world_cup
) x group by team order by wins desc


-- select team,num_of_played,coalesce(wins,0) as win ,(num_of_played-coalesce(wins,0)) as loss from  ( select winner,count(*) as wins from icc_world_cup group by 1 ) a
-- right join (
-- select team,count(*) as num_of_played from (
-- select Team_1 as team ,count(*) from icc_world_cup group by Team_1
-- union all
-- select Team_2 as team,count(*) from icc_world_cup group by Team_2) c
-- group by 1 ) b
-- on a.winner=b.team

