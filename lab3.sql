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
-- Q2: Need to modify the course table first so that p_email doesnt disappear when p1 is deleted
update course
set p_email = 'p3@jmu.edu'
where p_email = 'p1@jmu.edu';

delete from professor
where p_email = 'p1@jmu.edu';

-- 2.7
select * from enroll;
"s1@jmu.edu"	"c1"
"s2@jmu.edu"	"c1"
"s3@jmu.edu"	"c1"
"s4@jmu.edu"	"c2"
"s2@jmu.edu"	"c3"
"s3@jmu.edu"	"c3"
-- copy pasted because I'm not sure what else to do
