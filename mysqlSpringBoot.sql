use mydb;



drop table member;
CREATE TABLE MEMBER(
    M_ID VARCHAR(20) NOT NULL,
    M_PW VARCHAR(100) NOT NULL, -- 시큐리티 암호화 위해
    M_NAME VARCHAR(10),
    M_BIRTH varchar(20), 
    M_ADDR VARCHAR(50),
    M_PHONE VARCHAR(13) ,
    M_POINT int DEFAULT 0,
    PRIMARY KEY(M_ID)
);


select * from member;

insert into member value('aaa',111,'장기훈',date(19900830),'주소입니다.',010-2896-8739,10);

create table grade(

g_code char(1) primary key,
g_name varchar(10),
g_lowpoint int,
g_highpoint int


);

insert into grade values('a','브론즈',0,10);
insert into grade values('b','실버',11,20);
insert into grade values('c','골드',21,30);
insert into grade values('d','다이아',31,40);

select * from grade;

-- 복잡한 쿼리문

create or replace view minfo
as
select m_id,m_name,m_point,g_name
from member m join grade g
on m_point between g_lowpoint and g_highpoint;


select * from minfo;

drop table board; 
CREATE TABLE BOARD(
    B_num int auto_increment primary key, -- PK
    B_TITLE VARCHAR(50) NOT NULL,
    B_CONTENTS text NOT NULL, -- 
    B_WRITER VARCHAR(20) NOT NULL, -- FK, MEMBER(M_ID)
    B_DATE DATETIME DEFAULT NOW(),
    B_VIEWS INT DEFAULT 0 NOT NULL,
    CONSTRAINT FK_B_WRITER foreign key(B_WRITER) REFERENCES MEMBER(M_ID)
); 

select * from board
order by b_date desc limit 0,10;

select * from person;

select * from aaa;
select * from iboard;

desc iboard;
drop table person;

create table person(

    userId varchar(20) primary key,
    userPw varchar(20)


);

create table iboard(

    ino int auto_increment primary key ,
     iuserId varchar(20),
    ititle varchar(20),
   
    icontents varchar(1000),
    iview int default 0,
    idate DATETIME DEFAULT now()

);
drop table iboard;
select * from iboard;

select * from iboard order by ino desc limit 10;


insert into iboard(iuserid,ititle,icontents,iview) 

value('aaa','연습','testestest',10);

select * from iboard order by ino desc limit 1, 10;
 -- 더미데이터
insert into  iboard (iuserid,ititle,icontents,iview) 
(select title,content,writer from tbl_board);