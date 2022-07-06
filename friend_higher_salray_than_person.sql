select * from test.students;
select * from test.friends;
select * from test.packages;

select s.name from test.friends f
inner join  test.students s on f.ID=s.ID
inner join test.packages p on f.friend_ID=p.ID
inner join test.packages p1 on f.ID=p1.ID
where p.salary > p1.salary 
order by p.salary 