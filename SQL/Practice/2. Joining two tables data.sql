select s.id
from source s;

select t.id
from target t;

select s.id, "Mismatch" as comment
from source s
inner join target as t
on t.id = s.id and t.name <> s.name
union
select s.id, "New in source" as comment
from source s 
left join target t
on t.id = s.id
where t.id is null
union
select t.id, "new in target" comment
from source s 
right join target t
on t.id = s.id
where s.id is null;