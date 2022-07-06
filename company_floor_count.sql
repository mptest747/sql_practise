
with totat_visits as (
select name,count(1) as total_visit,group_concat( distinct resources) as resources from  entries group by 1),
floor_visits as (
select name,floor,count(1) no_of_visit, rank() over (partition by name order by count(1) desc) rnk
from  entries group by 1 ,2 )
select fv.name,fv.floor,tv.total_visit, tv.resources from floor_visits fv 
inner join totat_visits tv on fv.name=tv.name
where rnk=1;

select name,count(1) as total_visit,group_concat( distinct resources) from  entries group by 1
-- select * from entries