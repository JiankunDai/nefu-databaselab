/*lab2*/


select sno,sname from student where sdept='ma';

select distinct sno from sc;

select sno,grade from sc where cno=2 order by grade desc,sno asc;

select sno,grade*0.8 from sc where(cno=2 and grade>80 and grade<90);

select * from student where (sname like 'zhang%' and (sdept='ma' or sdept='cs'));

select sno,cno from sc where grade is null;

select cno,count(*) from sc group by cno;

select * from student,course,sc where student.sno=sc.sno and sc.cno=course.cno;

select student.sno,student.sname,course.cname,sc.grade from student,course,sc where student.sno=sc.sno and sc.cno=course.cno;

select student.sno,student.sname,sc.grade from student,sc where student.sno=sc.sno and sc.cno=1 and sc.grade>90;

select first.cno,second.cpno from course first,course second where first.cpno=second.cno;/*indirectly prerequisite course*/

select * from student where sdept=(select sdept from student where sname='liuchen');

select student.sno,student.sname from student,sc,course where student.sno=sc.sno and sc.cno=course.cno and cname='information system';

select student.sno,avg(sc.grade) from student,sc where(student.sno=sc.sno) group by student.sno having avg(sc.grade)>80;

select sno from sc group by sno having count(*)>1;

select sno,sname from student where sno in (select sno from sc,course where sc.cno=course.cno and course.cname='information system');

select sname from student where sdept in (select sdept from student where sname='liuchen');

select sno,grade from sc where cno=1 and grade>(select max(grade) from sc,student where sc.sno=student.sno and student.sname='liuchen' group by student.sno);

select sname from student where sage<(select max(sage) from student where sdept='cs' group by sdept) and sdept!='cs';

select sname,sage from student where sage<(select min(sage) from student where sdept='cs' group by sdept) and sdept!='cs';

select sname from student where not exists (select * from sc where sno=student.sno and cno=3);

select sname from student where not exists(select * from course where not exists (select * from sc where sc.sno=student.sno and sc.cno=course.cno));

/*still doubt*/
select distinct scx.sno,student.sname from sc scx,student where scx.sno=student.sno and not exists (select * from sc scy where scy.sno=200215122 and not exists (select * from sc scz where scz.sno=scx.sno and scz.cno=scy.cno));

select distinct sno from sc scx where not exists (select * from sc scy where scy.sno=200215121 and not exists (select * from sc scz where scz.sno=scx.sno and scz.cno=scy.cno));

select sno,sname from student where sno in(select sno from sc group by sno having count(*)>2);

create view is_view(sno,sname,sage,ssex,sdept,cno,grade) as select student.sno,sname,sage,ssex,sdept,sc.cno,sc.grade from student,sc where sdept='is' and sc.sno=student.sno with read only;

select * from is_view;

drop view is_view;

create view is_view_one as select sno,sname,grade from is_view where cno=1;

select * from is_view_one;

drop view is_view_one;

create view ave_view(sno,avg_grade) as select sno,avg(grade) from sc group by sno;

select * from ave_view;

create view famale_view(sno,sname,sdept,ssex) as select sno,sname,sdept,ssex from student where ssex='F' with check option;

select * from famale_view;

drop view famale_view;

insert into famale_view(sno,sname,sdept) values(200215129,'smith','ma');
/*ORA-01402: view WITH CHECK OPTION where-clause violation*/

insert into famale_view(sno,sname,sdept,ssex) values(200215129,'smith','ma','F');

select * from student;
select * from course;
select * from sc;