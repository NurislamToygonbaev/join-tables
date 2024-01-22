select *
from programmers
where experience > (select avg(experience) from programmers);





select * from programmers p join projects_programmers pp
                                 on p.id = pp.programmers_id
                            join projects pr on pp.project_id = pr.id
where pr.title = 'Food Order Website';


--1#
select * from programmers where id in
                                (select  programmers_id from projects_programmers pp
                                 where pp.project_id in (select  id from projects
                                                         where title = 'Food Order Website'));


--2#
select * from projects where id in
                             (select project_id from projects_programmers pp
                              group by project_id having count(programmers_id) > 1);

--3#
select first_name from programmers where experience >
                                         (select avg(experience) from programmers);

--4#
select * from projects where company_id in
                             (select c.id from companies c where address_id in
                                                                 (select a.id from addresses a
                                                                  where a.country ilike 'germany'));

--5#
select title from projects where company_id in
                                 (select c.id from companies c where c.rating > 4.5);

select p.title, c.rating from projects p join companies c
                                              on p.company_id = c.id where c.rating > 4.5;


--6#
select first_name from programmers where id not in
                                         (select pp.programmers_id from projects_programmers pp);

--7#
select * from projects where start_date > (
    select start_date from projects where
        projects.title = 'Survey App');

--8#
select * from projects where id in (select pp.project_id from projects_programmers pp
                                    where programmers_id in (select id from programmers p) group by pp.project_id );




--9#
select first_name from programmers p where id in
                                           (select programmers_id from projects_programmers pp where project_id in
                                                                                                     (select id from projects pr where company_id in
                                                                                                                                       (select id from companies c where address_id in
                                                                                                                                                                         (select id from addresses a where a.country in ('Germany', 'France')))));


--10#

