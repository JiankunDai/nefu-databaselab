/*lab1*/
create table student(
    sno int primary key,
    sname varchar2(20) not null unique,
    sage int,
    ssex char(2) check(ssex in ('M','F')),
    sdept varchar2(20)
);

select * from student;

describe student;

select * from user_constraints where table_name='STUDENT';

select * from user_constraints;

create table course(
    cno int primary key,
    cname varchar2(20),
    cpno int,
    ccredit int,
    constraint FK_CPNO_COURSES foreign key(cpno) references course(cno)
);

create table sc(
    sno int,
    cno int,
    grade int,
    constraint PK_SNO_CNO_SC primary key(sno,cno),
    constraint FK_SNO_SC foreign key(sno) references student(sno),
    constraint FK_CNO_SC foreign key(cno) references course(cno)
);

desc sc;

alter table student add bloodtype char(2);

alter table student modify sdept varchar2(40);

alter table student add constraint CK_AGE check(sage>15 and sage<30);

alter table student drop constraint CK_AGE;

alter table student drop column bloodtype;

drop table student;

drop table sc;

drop table course;

create unique index i_sc_1186 on sc(sno asc,cno desc);

create unique index stusname_1186 on student(sname);

select * from user_indexes where table_name=('STUDENT');

select * from user_constraints where table_name='STUDENT';

alter table student drop constraint SYS_C0046005;

insert into student(sno,sname,sage,ssex,sdept) values(200215121,'liyong',20,'M','cs');
insert into student(sno,sname,sage,ssex,sdept) values(200215122,'liuchen',19,'F','cs');
insert into student(sno,sname,sage,ssex,sdept) values(200215123,'wangmin',18,'F','ma');
insert into student(sno,sname,sage,ssex,sdept) values(200215125,'zhangli',19,'M','is');
insert into student(sno,sname,sage,ssex,sdept) values(200215126,'wangqiang',21,'M','is');
insert into student(sno,sname,sage,ssex,sdept) values(200215127,'leixiaotian',20,'M','is');

delete from student where sno=200215121;

alter table course disable constraint FK_CPNO_COURSES;

insert into course(cno,cname,cpno,ccredit) values(1,'database system',5,4);
insert into course(cno,cname,cpno,ccredit) values(2,'math',null,2);
insert into course(cno,cname,cpno,ccredit) values(3,'information system',1,4);
insert into course(cno,cname,cpno,ccredit) values(4,'operating system',6,3);
insert into course(cno,cname,cpno,ccredit) values(5,'data structure',7,4);
insert into course(cno,cname,cpno,ccredit) values(6,'data processing',null,2);
insert into course(cno,cname,cpno,ccredit) values(7,'PASCAL language',6,4);

alter table course enable constraint FK_CPNO_COURSES;

alter table sc disable constraint FK_SNO_SC;

insert into sc(sno,cno,grade) values(200215121,1,92);
insert into sc(sno,cno,grade) values(200215121,2,85);
insert into sc(sno,cno,grade) values(200215121,3,88);
insert into sc(sno,cno,grade) values(200215122,4,90);
insert into sc(sno,cno,grade) values(200215122,3,80);
insert into sc(sno,cno,grade) values(200215126,3,95);
insert into sc(sno,cno,grade) values(200215127,1,96);

alter table sc enable constraint FK_SNO_SC;

select * from STUDENT;
select * from COURSE;
select * from SC;

update student set sage=20 where sname='??';

update student set sage=sage+1;

update sc set GRADE=0 where (select Sdept from student where student.sno = sc.sno)='cs';

delete from student where sdept=(select sdept from student where student.sname='??');

delete from sc where 'cs'=(select sdept from student where student.sno=sc.sno);





/*
lab 1 optinal
*/



create table emp(
    empno int,
    ename varchar(10),
    sal int,
    deptno int,
    hiredate date,
    mgr int,
    job varchar2(20),
    constraint PK_EMPNO_EMP primary key(empno),
    constraint CK_SAL_EMP check(sal>500)
);

create table dept(
    deptno int,
    dname varchar2(20),
    loc varchar2(40),
    managerID int,
    constraint PK_DEPTNO_DEPT primary key(deptno),
    constraint FK_MANAGERID_DEPT foreign key(managerID) references emp(empno),
    constraint CK_DNAME_DEPT check (deptno is not null)
);

create table salgrade(
    grade int primary key,
    losal int,
    hisal int
);

drop table salgrade;

drop table emp;

alter table emp add comm int;

alter table emp modify ename varchar2(20) default 'none';

alter table emp add grade references salgrade(grade);

alter table emp drop column comm;

drop table dept;

drop table emp;
/*An attempt was made to drop a table with unique or primary keys referenced by foreign keys in another table.*/


desc emp;
select * from emp;
select * from dept;
select * from salgrade;


create unique index emp_sname_1186 on emp(ename);

create unique index e_de_1186 on emp(deptno asc,ename desc);

drop index emp_sname_1186;

select * from user_constraints;

drop index e_de_1186;

insert into dept(deptno,dname,loc) values(10,'huashan pie','shanxi province weinan');
insert into dept(deptno,dname,loc) values(20,'sun moon holy sect','heimuya');
insert into dept(deptno,dname,loc) values(30,'hengshan pie','hunan province hengshan');
insert into dept(deptno,dname,loc) values(40,'shaolin temple','henan province dengfeng');

insert into emp(empno,ename,sal,deptno,hiredate,mgr,job,grade) values(1000,'linghuchong',4000,10,TO_DATE('2015-03-02','YYYY-MM-DD'),1003,'manager',3);
insert into emp(empno,ename,sal,deptno,hiredate,mgr,job,grade) values(1001,'liuchen',3000,20,TO_DATE('2010-08-26','YYYY-MM-DD'),'','general manager',4);
insert into emp(empno,ename,sal,deptno,hiredate,mgr,job,grade) values(1003,'yuebuqun',10000,30,TO_DATE('2008-09-20','YYYY-MM-DD'),'','chairman',5);
insert into emp(empno,ename,sal,deptno,hiredate,mgr,job,grade) values(1004,'yuelingshan',4000,40,TO_DATE('2009-10-25','YYYY-MM-DD'),'','clerk',1);
insert into emp(empno,ename,sal,deptno,hiredate,mgr,job,grade) values(1005,'daijiankun',8000,30,TO_DATE('2016-09-12','YYYY-MM-DD'),'','student',null);

insert into salgrade(grade,losal,hisal) values(1,700,4000);
insert into salgrade(grade,losal,hisal) values(2,2000,9000);
insert into salgrade(grade,losal,hisal) values(3,3000,15000);
insert into salgrade(grade,losal,hisal) values(4,8000,20000);
insert into salgrade(grade,losal,hisal) values(5,10000,50000);

update emp set sal=sal*2 where deptno=10;

update emp set ename='daijiankun' where empno=1004;

delete from emp where deptno=(select deptno from dept where dname='sun moon holy sect');

delete from emp where empno>1003;



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



/*lab2 optinal*/
select * from emp;
select * from dept;
select * from salgrade;

select empno,ename,job as workspace from emp;

select empno,ename,job from emp;

select distinct job from emp;

select empno,ename from emp where sal>1500;

select * from emp where hiredate like '%-%-08';

select * from emp where empno not in(1000,1003,1004);

select * from emp where ename like '____hu%';

select * from emp order by sal asc;

select * from emp where deptno=30 order by sal asc,hiredate asc;

/*11.*/

select emp.empno,ename,emp.deptno,dept.dname,loc from emp,dept where emp.deptno=dept.deptno;

select emp.deptno,empno,ename,dept.deptno,dept.dname,loc from emp full join dept on emp.deptno=dept.deptno;

select count(grade) from emp;

select min(sal) from emp;

select deptno,count(*) as "department people number" from emp group by deptno;

select empno,dname from emp,dept where(emp.deptno=dept.deptno and emp.deptno=20 and sal<4000);

select ename from emp where empno in (select first.mgr from emp first,emp second where first.empno=second.empno);

select * from 

/*lab3*/








/*lab4*/

