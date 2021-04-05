drop table stuff;
select * from stuff;
select * from user_wish;

drop table user_wish;

CREATE TABLE USER_WISH(
    STUFF_NO NUMBER,
    USERID VARCHAR2(20),
    STATUS VARCHAR2(1) DEFAULT 'Y',
    CONSTRAINT PRIM PRIMARY KEY(STUFF_NO, USERID)
);


SELECT STUFF_NO
		FROM USER_WISH
		WHERE USERID='user01';

CREATE TABLE STUFF(
    STUFF_NO NUMBER PRIMARY KEY,
    REGISTRANT VARCHAR2(20),
    MONEY_KIND VARCHAR2(10),
    AREA NUMBER,
    FLOORS NUMBER,
    LOCATION VARCHAR2(40),
    ELEVATOR VARCHAR2(1),
    ADMIN_MONEY NUMBER,
    STRUCTURE VARCHAR2(20),
    ENTIRE_FLOORS NUMBER,
    PHONE VARCHAR2(30),
    MONEY1 VARCHAR2(30),
    MONEY2 VARCHAR2(30), 
    STATUS VARCHAR2(1) DEFAULT 'Y',
    ORIGIN_NAME varchar2(30) DEFAULT null,
    CHANGE_NAME varchar2(30) DEFAULT null
);



insert into stuff values(1,
'admin',
'월세',
24.5,
5,
'서울 강남구 테헤란로 152',
'Y', 
5, 
'원룸', 
5, 
'010-2546-9925', 
'60', 
'1000',
DEFAULT,
DEFAULT,
DEFAULT);

insert into stuff values(2,
'admin',
'전세',
30,
2,'서울 강남구 테헤란로20길 9',
'Y', 
5, 
'원룸',
5, 
'010-1652-8413', 
'1억 3000', 
'null',
DEFAULT,
DEFAULT,
DEFAULT);

insert into stuff values(3,
'admin',
'월세',
19,
4,
'서울 관악구 남부순환로 1840',
'Y', 
9, 
'원룸', 
8, 
'010-1424-8759', 
'35', 
'300',
DEFAULT,
DEFAULT,
DEFAULT);

insert into stuff values(4,
'admin',
'전세',
33,
3,
'서울 관악구 관악로12길 16',
'Y', 
13, 
'원룸', 
5, 
'010-8563-3456', 
'1억 6000', 
'null',
DEFAULT,
DEFAULT,
DEFAULT);


insert into stuff values(5,
'admin',
'전세',
33,
3,
'서울 관악구 관악로 145',
'Y', 
13, 
'원룸', 
5, 
'010-8563-3456', 
'1억 6000', 
'null',
DEFAULT,
DEFAULT,
DEFAULT);

insert into stuff values(6,
'admin',
'전세',
33,
3,
'서울 서초구 서초대로74길 11',
'Y', 
13, 
'투룸', 
5, 
'010-8563-3456', 
'1억 6000', 
'null',
DEFAULT,
DEFAULT,
DEFAULT);


insert into stuff values(7,
'admin',
'전세',
33,
3,
'서울 서초구 강남대로 429',
'Y', 
13, 
'오피스텔', 
5, 
'010-8563-3456', 
'1억 6000', 
'null',
DEFAULT,
DEFAULT,
DEFAULT);

insert into stuff values(8,
'admin',
'전세',
33,
3,
'서울 강남구 테헤란로8길 8',
'Y', 
13, 
'아파트', 
5, 
'010-8563-3456', 
'2억 6000', 
'null',
DEFAULT,
DEFAULT,
DEFAULT);

DROP SEQUENCE SEQ_R_NO;
CREATE SEQUENCE SEQ_R_NO --게시물번호 시퀀스
INCREMENT BY 1 --증감숫자 1
START WITH 10; --시작숫자 1

select* from stuff;
commit;







