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