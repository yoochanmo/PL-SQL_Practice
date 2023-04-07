/* 연습문제 */

-- ex01) 테이블명 : STAR_WARS (영화 정보를 저장한다)
--       컬럼 : EPISODE_ID : 에피소드 아이디로써, 숫자형 타입으로 기본 키가 된다.
--              EPISODE_NAME : 에피소드에 따른 영화 제목, 가변길이문자형(50 BYTE)이다.
--              OPEN_YEAR : 개봉년도로써, 숫자형 타입이다.

CREATE TABLE STAR_WARS(
	EPISODE_ID NUMBER
	,EPISODE_NAME VARCHAR2(50)
	,OPEN_YEAR NUMBER
);
SELECT * FROM STAR_WARS;

-- ex02) 테이블명 : CHARACTERS ( 등장인물 정보를 저장한다)
--         컬럼 : CHARACTER_ID   : 등장인물 아이디로써, 숫자형 타입(5자리), 기본키
--                CHARACTER_NAME : 등장인물 명으로 가변 길이 문자형 타입(30 BYTE)이다.
--                MASTER_ID      : 등장인물이제다이일 경우 마스터아이디값, 숫자형(5자리)
--                ROLE_ID        : 등장인물의 역할 아이디로써, INTEGER 타입이다.
--                EMAIL          : 등장인물의 이메일 주소로 varchar2(40 BYTE)이다.

CREATE TABLE CHARACTERS(
CHARACTER_ID NUMBER(5)
,CHARACTER_NAME VARCHAR2(30)
,MASTER_ID NUMBER(5)
,ROLE_ID INTEGER
,EMAIL VARCHAR2(40)

);

SELECT * FROM CHARACTERS;


-- ex03) 테이블명 : CASTING ( 등장인물과 실제 배우의 정보를 저장한다)
--         컬럼 : EPISODE_ID: 에피소드 아이디로써, 숫자형 타입(5자리)으로 기본키
--                CHARACTER_ID: 등장인물 아이디로써, 숫자형 타입(5자리)이며 참조키
--                REAL_NAME : 등장인물의 실제 이름으로, varchar2(30 BYTE)이다.
drop table CASTING;
CREATE TABLE CASTING(
EPISODE_ID NUMBER(5)
,CHARACTER_ID NUMBER(5)
,REAL_NAME VARCHAR2(30)
, CONSTRAINT CASTING_PK PRIMARY KEY(EPISODE_ID, CHARACTER_ID)  

);

SELECT * FROM CASTING;


-- ex04) INSERT 문을 사용하여 STAR_WARS 테이블에 다음과 같이 데이터를 저장해보자. 
-- EPISODE_ID  EPISODE_NAME                                 OPEN_YEAR              
-- ----------- ---------------------------------------  --------------                
-- 1              보이지 않는 위험(The Phantom Menace)          1999                   
-- 2              클론의 습격(Attack of the Clones)             2002                   
-- 3              시스의 복수(Revenge of the Sith)              2005
-- 4              새로운 희망(A New Hope)                       1977                   
-- 5              제국의 역습(The Empire Strikes Back)          1980                   
-- 6              제다이의 귀환(Return of the Jedi)             1983 


SELECT * FROM STAR_WARS;

INSERT INTO STAR_WARS VALUES(1,'보이지 않는 위험(The Phantom Menace)',1999 );
INSERT INTO STAR_WARS VALUES(2,'클론의 습격(Attack of the Clones)',2002 );
INSERT INTO STAR_WARS VALUES(3,'시스의 복수(Revenge of the Sith)',2005 );
INSERT INTO STAR_WARS VALUES(4,'새로운 희망(A New Hope)',1977 );
INSERT INTO STAR_WARS VALUES(5,'제국의 역습(The Empire Strikes Back)',1980 );
INSERT INTO STAR_WARS VALUES(6,'제다이의 귀환(Return of the Jedi)',1983 );









-- ex05) CHARACTERS 테이블에 다음의 데이터를 저장해보자.
-- CHARACTER_ID    CHARACTER_NAME       EMAIL                                    
-- --------------- -------------------- ------------------------ 
-- 1                 루크 스카이워커          luke@jedai.com                           
-- 2                 한 솔로                  solo@alliance.com                        
-- 3                 레이아 공주              leia@alliance.com                        
-- 4                 오비완 케노비            Obi-Wan@jedai.com                        
-- 5                 다쓰 베이더              vader@sith.com                           
-- 6                 다쓰 베이더(목소리)       Chewbacca@alliance.com                   
-- 7                 C-3PO                   c3po@alliance.com                        
-- 8                 R2-D2                   r2d2@alliance.com                        
-- 9                 츄바카                   Chewbacca@alliance.com                   
-- 10                랜도 칼리시안
-- 11                요다(목소리)              yoda@jedai.com                           
-- 12                다스 시디어스
-- 13                아나킨 스카이워커        Anakin@jedai.com                         
-- 14                콰이곤 진
-- 15                아미달라 여왕
-- 16                아나킨 어머니
-- 17                자자빙크스(목소리)        jaja@jedai.com 
-- 18                다스 몰          
-- 19                장고 펫 
-- 20                마스터 윈두              windu@jedai.com                          
-- 21                듀크 백작                dooku@jedai.com

INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(1,'루크 스카이워커','luke@jedai.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(2,'한 솔로','solo@alliance.com ');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(3,'레이아 공주','eia@alliance.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(4,'오비완 케노비','Obi-Wan@jedai.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(5,'다쓰 베이더','vader@sith.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(6,'다쓰 베이더(목소리)','Chewbacca@alliance.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(7,'C-3PO ','c3po@alliance.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(8,'R2-D2','r2d2@alliance.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(9,'츄바카','Chewbacca@alliance.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(10,'랜도 칼리시안','');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(11,'요다(목소리)','yoda@jedai.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(12,'다스 시디어스','');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(13,'아나킨 스카이워커','Anakin@jedai.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(14,'콰이곤 진','');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(15,'아미달라 여왕','');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(16,'아나킨 어머니','');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(17,'자자빙크스(목소리)','jaja@jedai.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(18,'다스 몰','');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(19,'장고 펫','');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(20,'마스터 윈두','windu@jedai.com');
INSERT INTO CHARACTERS(CHARACTER_ID,CHARACTER_NAME,EMAIL) VALUES(21,'듀크 백작','dooku@jedai.com');



SELECT * FROM CHARACTERS;





-- ex06) ROLES 테이블에 다음의 데이터를 저장해보자
-- ROLE_ID(number5,0) pk, ROLE_NAME(varchar2 30)
-- 1001, '제다이'
-- 1002, '시스'
-- 1003, '반란군'

CREATE TABLE ROLES(
	ROLE_ID NUMBER(5,0) primary key
	,ROLE_NAME VARCHAR2(30)
);
INSERT INTO ROLES VALUES(1001,'제다이');
INSERT INTO ROLES VALUES(1002,'시스');
INSERT INTO ROLES VALUES(1003,'반란군');

SELECT * FROM ROLES;



-- ex07) CHARACTERS 에는 ROLE_ID 란 컬럼, 이 값은 ROLES 테이블의 ROLE_ID 값을 참조 
-- CHARACTERS 변경하여 ROLE_ID 컬럼이 ROLES의 ROLE_ID 값을 참조하도록 참조 키를 생성

ALTER TABLE CHARACTERS 
ADD CONSTRAINT CHARACTERS_FK FOREIGN KEY(ROLE_ID) REFERENCES ROLES(ROLE_ID);

SELECT * FROM CHARACTERS;




-- ex08) 참조 키를 생성후, 다음으로 CHARACTERS 테이블의 ROLE_ID 값을 변경해보자. 
-- 값의 참조는 ROLES 테이블의 ROLE_ID 값을 참조한다. 예를 들면 루크 스카이워커,   
-- 오비완 캐노비, 요다 등은 제다이 기사이므로 1001 값을 가질 것이며, 
-- 다쓰 베이더, 다쓰 몰은 시스 족이므로 1002에 해당한다. 자신이 아는 범위 내에서 
-- 이 값을 갱신하는 UPDATE 문장을 작성해 보자.

UPDATE CHARACTERS
SET ROLE_ID = 1001
WHERE CHARACTER_ID IN (1,4,11,13,14,20,21);

UPDATE CHARACTERS
SET ROLE_ID = 1002
WHERE CHARACTER_ID IN (5,6,12,18);


UPDATE CHARACTERS
SET ROLE_ID = 1003
WHERE CHARACTER_ID IN (2,3,7,8,9);


SELECT * FROM CHARACTERS;



-- ex09) CHARACTERS MASTER_ID 란 컬럼, 이 컬럼의 용도는 EMPLOYEES 테이블의 MANAGER_ID 
-- 와 그 역할이 같다. 즉 제다이나 시스에 속하는 인물 중 그 마스터의 CHARACTER_ID 값을 
-- 찾아 이 컬럼에 갱신하는 문장을 작성
-- 
-- 제자                    마스터
-- ------------------  -------------------------
-- 아나킨 스카이워커      오비완 캐노비
-- 루크 스카이워크        오비완 캐노비
-- 마스터 윈두            요다
-- 듀크 백작              요다
-- 다쓰 베이더            다쓰 시디어스
-- 다쓰 몰                다쓰 시디어스
-- 오비완 캐노비          콰이곤 진
-- 콰이곤 진              듀크 백작
UPDATE CHARACTERS
SET MASTER_ID = 4 
WHERE CHARACTER_ID = 13;

UPDATE CHARACTERS
SET MASTER_ID = 4 
WHERE CHARACTER_ID = 1;

UPDATE CHARACTERS
SET MASTER_ID = 11 
WHERE CHARACTER_ID = 20;

UPDATE CHARACTERS
SET MASTER_ID = 11
WHERE CHARACTER_ID = 21;

UPDATE CHARACTERS
SET MASTER_ID = 12 
WHERE CHARACTER_ID = 5;

UPDATE CHARACTERS
SET MASTER_ID = 12 
WHERE CHARACTER_ID = 18;

UPDATE CHARACTERS
SET MASTER_ID = 14 
WHERE CHARACTER_ID = 4;

UPDATE CHARACTERS
SET MASTER_ID = 21 
WHERE CHARACTER_ID = 14;


SELECT * FROM CHARACTERS;



-- ex010) CASTING의 PK는 EPISODE_ID와 CHARACTER_ID 이다. 
-- 이 두 컬럼은 각각 STAR_WARS와 CHARACTERS 테이블의 기본 키를 참조하고 있다. 
-- CASTING 테이블에 각각 이 두 테이블의 컬럼을 참조하도록 참조 키를 생성 

ALTER TABLE CASTING
	ADD CONSTRAINT CASTING_EPISODE_ID_FK
		FOREIGN KEY(EPISODE_ID)
			REFERENCES STAR_WARS(EPISODE_ID);

ALTER TABLE CASTING
	ADD CONSTRAINT CASTING_CHARACTER_ID_FK
		FOREIGN KEY(CHARACTER_ID)
			REFERENCES CHARACTERS(CHARACTER_ID);


SELECT * FROM STAR_WARS;
SELECT * FROM CASTING;



-- ex11) 다음 문장을 실행해 보자. 
DELETE ROLES
 WHERE ROLE_ID = 1001;
 SELECT * FROM ROLES;
-- 
-- 이 문장을 실행하면 그 결과는 어떻게 되는가? 또한 그러한 결과가 나오는 이유는 
-- 무엇인지 설명해 보자.
/*
ORA-02292: integrity constraint (SCOTT.CHARACTERS_FK) violated - child record found

자식 테이블에 부모 테이블 레코드를 참조하는 레코드가 있어서 발생합니다
*/



-- ex12) characters에 character_name 인덱스 생성하기
create index characters_ix_01 on characters(character_name);

SELECT * FROM user_indexes WHERE table_name = 'CHARACTERS';




-- ex13) 상기작업들의 data dictionary를 조회

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_INDEXES WHERE TABLE NAME = 'CHARACTERS';






/* 연습문제 */

-- ex01) new_emp4를 생성, no(number), name(), sal(number)


CREATE TABLE new_emp4(
	no NUMBER
	,name VARCHAR2(10)
	,sal NUMBER
);

SELECT * FROM new_emp4;




-- ex02) 데이터를 insert
--    1000, 'SMITH', 300
--    1001, 'ALLEN', 250
--    1002, 'KING', 430
--    1003, 'BLAKE', 220
--    1004, 'JAMES', 620
--    1005, 'MILLER', 810

INSERT INTO new_emp4 VALUES(1000, 'SMITH', 300);
INSERT INTO new_emp4 VALUES(1001, 'ALLEN', 250);
INSERT INTO new_emp4 VALUES(1002, 'KING', 430);
INSERT INTO new_emp4 VALUES(1003, 'BLAKE', 220);
INSERT INTO new_emp4 VALUES(1004, 'JAMES', 620);
INSERT INTO new_emp4 VALUES(1005, 'MILLER', 810);

SELECT * FROM new_emp4;




-- ex03) name컬럼에 인덱스 생성

CREATE UNIQUE INDEX idx_name on new_emp4(name);
SELECT * FROM user_indexes;
SELECT * FROM user_indexes WHERE TABLE_NAME = 'new_emp4';



-- ex04) 인덱스를 사용하지 않는 일반적인 SQL



				/*
      1) 데이터가 적을 경우(수천건 미만)에는 인덱스를 설정하지 않는 것이 오히려 성능에 좋다.
			2) 검색보다 update, delete, insert가 빈번하게 일어나는 테이블에는 인덱스가 없는 게 오히려 
					좋을 수가 있다.
			3) 조회결과 전체 행의 15%이상인 경우에는 사용하지 않는 것이 좋다.
			*/







