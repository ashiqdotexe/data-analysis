select *
from comments_and_translations;

select case when translation is null then `comment`
else `translation`end as output
from comments_and_translations;

select coalesce(translation, `comment`) as output
from comments_and_translations;