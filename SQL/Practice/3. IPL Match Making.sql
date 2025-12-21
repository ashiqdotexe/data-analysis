select * from teams;

#each team facing each once

with matches as 
(
select row_number() over(order by team_name) as id, team_name
from teams
)
select team.team_name as main_team, opponent.team_name as opponent
from matches team
join matches opponent
on
 team.team_name < opponent.team_name
;

select team.team_name as main_team, opponent.team_name as opponent
from teams team
join teams opponent
on team.team_name <> opponent.team_name;