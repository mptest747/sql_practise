-- about finding new and repeat customers
-- order_date,new_custms,repeat_custmes


-- Select a.order_date,
-- Sum(Case when a.order_date = a.first_order_date then 1 else 0 end) as new_customer,
-- Sum(Case when a.order_date != a.first_order_date then 1 else 0 end) as repeat_customer
-- from(
-- Select customer_id, order_date, min(order_date) over(partition by customer_id) as first_order_date from customer_orders) a 
-- group by a.order_date;

-- select order_date,sum(first_visit_flags) as new_customers ,sum(repeat_visit_flags) as repeat_Cutomers
-- from (
-- select a.*,b.first_visit_date
-- ,case when a.order_date=b.first_visit_date then 1 else 0 end as first_visit_flags
-- ,case when a.order_date !=b.first_visit_date then 1 else 0 end as repeat_visit_flags
-- from customer_orders a
-- inner join 
-- ( select customer_id ,min(order_date) first_visit_date from customer_orders group by 1 ) b
-- on a.customer_id=b.customer_id ) c group by 1;



-- add order_Amt  by new and repeats

select order_date,sum(first_visit_flags) as new_customers ,
sum( case when first_visit_flags=1 then order_amount else 0 end ) as new_amts,
sum(repeat_visit_flags) as repeat_Cutomers,
sum( case when repeat_visit_flags=1 then order_amount else 0 end ) as repeat_amts from
(
select a.*,b.first_visit_date
,case when a.order_date=b.first_visit_date then 1 else 0 end as first_visit_flags
,case when a.order_date !=b.first_visit_date then 1 else 0 end as repeat_visit_flags
from customer_orders a
inner join 
( select customer_id ,min(order_date) first_visit_date from customer_orders group by 1 ) b
on a.customer_id=b.customer_id ) x group by 1 order by 1

