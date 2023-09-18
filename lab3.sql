-- 2.1
insert into student(s_email,s_name,major)
values('s1@jmu.edu','s1','IA'),
  ('s2@jmu.edu','s2','IA'),
  ('s3@jmu.edu','s3','ISAT'),
  ('s4@jmu.edu','s4','ISAT');

-- 2.2
insert into professor(p_email,p_name,office)
values('p1@jmu.edu','p1','o1'),
  ('p2@jmu.edu','p2','o2');

-- 2.3
insert into course(c_number,c_name,room,p_email)
values('c1','postgresql','r1','p1@jmu.edu'),
  ('c2','mongodb','r2','p2@jmu.edu'),
  ('c3','twitter','r1','p1@jmu.edu');

-- 2.4
insert into enroll(s_email,c_number)
values('s1@jmu.edu','c1'),
  ('s2@jmu.edu','c1'),
  ('s3@jmu.edu','c1'),
  ('s4@jmu.edu','c2'),
  ('s2@jmu.edu','c3'),
  ('s3@jmu.edu','c3');

-- 2.5
-- Q1: Need to update the professor list first since p_email is a foreign key in the course table
insert into professor(p_email,p_name,office)
values('p3@jmu.edu','p3','o3');

insert into course(c_number,c_name,room,p_email)
values('c4','facebook','r1','p3@jmu.edu');

-- 2.6
-- Q2: Need to modify the course table first so that p_email doesnt disappear when p1 is deleted, AND you can't add a new course without having a new professor
update course
set p_email = 'p3@jmu.edu'
where p_email = 'p1@jmu.edu';

delete from professor
where p_email = 'p1@jmu.edu';

-- 2.7
select * from enroll
order by c_number asc;
/* "s1@jmu.edu"	"c1"
"s2@jmu.edu"	"c1"
"s3@jmu.edu"	"c1"
"s4@jmu.edu"	"c2"
"s2@jmu.edu"	"c3"
"s3@jmu.edu"	"c3" */
-- copy pasted because I'm not sure what else to do

--2.8
-- course 1 (c1) has three students enrolled (s1, s2, and s3)

--2.9
create view p_name_c_name as
select professor.p_name,
		course.c_name
from professor
inner join course
on professor.p_email = course.p_email;

/* "p3"	"facebook"
"p2"	"mongodb"
"p3"	"postgresql"
"p3"	"twitter" */


--2.10
-- p3 teaches the largest number of courses; facebook, postresql, and twitter (will probably have to join tables)





select count(c_number)
from course
group by p_email




select count(s_email)
from enroll
group by c_number
