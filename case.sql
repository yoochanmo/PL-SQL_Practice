-- 연습문제
-- ex01) student에서 jumin에 월참조해서 해당월의 분기를 출력(1Q, 2Q, 3Q, 4Q)
-- name, jumin, 분기 

SELECT NAME, JUMIN, SUBSTR(JUMIN, 3, 2),
       CASE 
         WHEN SUBSTR(JUMIN, 3, 2) BETWEEN '01' AND '03' THEN '1Q'
         WHEN SUBSTR(JUMIN, 3, 2) BETWEEN '04' AND '06' THEN '2Q'
         WHEN SUBSTR(JUMIN, 3, 2) BETWEEN '07' AND '09' THEN '3Q'
         WHEN SUBSTR(JUMIN, 3, 2) >= '10' THEN '4Q'
       END AS 분기
FROM STUDENT;





-- ex02) dept에서 10=회계부, 20=연구실, 30=영업부, 40=전산실
-- 1) decode
-- 2) case
-- deptno, 부서명

SELECT DEPTNO
,DECODE(DEPTNO, 10, '회계부'
						 , 20, '연구실'
						 , 30, '영업부'
						 , 40, '전산실') AS 부서명
FROM DEPT;

SELECT DEPTNO,
			case DEPTNO
			when 10 then'회계부'
			when 20 then'연구실'
			when 30 then'영업부'
			when 40 then'전산실' 
end as 부서명
from DEPT;




-- ex03) 급여인상율을 다르게 적용하기
-- emp에서 sal < 1000 0.8%인상, 1000~2000 0.5%, 2001~3000 0.3%
-- 그 이상은 0.1% 인상분 출력
-- ename, sal(인상전급여), 인상후급여 
-- 1) decode
-- 2) case 
SELECT SIGN(20-10),SIGN(20-20),SIGN(20-30)FROM dual;

SELECT ENAME,SAL
		,DECODE(SIGN(SAL-1000),
								-1, SAL*1.08,
								 0, SAL*1.05,
								 1, decode(SIGN(SAL-2000),
											-1,SAL*1.05,
											 0, SAL*1.05,
											 1,decode(SIGN(sal-3000),
														-1,SAL*1.03,
														 0,SAL*1.03,
														 1,SAL*1.01))) as 인상후급여
 ,case 
 WHEN sal BETWEEN 0 AND 999 then sal*1.08
 WHEN sal BETWEEN 1000 AND 2000 then sal*1.05
 WHEN sal BETWEEN 2001 AND 3000 then sal*1.03
 WHEN sal > 3000 then sal*1.01
 end 인상후급여
 
 FROM EMP;



