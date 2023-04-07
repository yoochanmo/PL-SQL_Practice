-- 연습문제
-- ex01) student 테이블의 주민등록번호 에서 성별만 추출
SELECT JUMIN
,SUBSTR(JUMIN,7, 1) as 성별
FROM STUDENT;
-- ex02) student 테이블의 주민등록번호 에서 월일만 추출
SELECT JUMIN
,SUBSTR(JUMIN,3, 4) as 월일
FROM STUDENT;
-- ex03)70년대에 태어난 사람만 추출
SELECT JUMIN
FROM STUDENT
WHERE JUMIN
BETWEEN '70' AND '79';

-- ex04) student 테이블에서 jumin컬럼을 사용, 1전공이 101번인 학생들의
--       이름과 태어난월일, 생일 하루 전 날짜를 출력
SELECT NAME, DEPTNO1, TO_CHAR(BIRTHDAY, 'YYYY-MM-DD'), TO_CHAR(BIRTHDAY-1, 'YYYY-MM-DD') AS "생일 하루 전"
FROM STUDENT
WHERE DEPTNO1 = '101';






-- 형변환 함수, 자동(묵시적)형변환, 수동(명시적)형변환