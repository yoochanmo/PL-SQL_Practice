/* 연습문제 */
-- 1. emp 테이블을 사용하여 사원 중에서 급여(sal)와 보너스(comm)를 합친 금액이 가장 많은 경우와 
--    가장 적은 경우 , 평균 금액을 구하세요. 단 보너스가 없을 경우는 보너스를 0 으로 계산하고 
--    출력 금액은 모두 소수점 첫째 자리까지만 나오게 하세요
-- MAX, MIN, AVG
SELECT TO_CHAR(MAX(SAL + NVL(COMM, 0)),'9999.9') 최대급여
			,TO_CHAR(MIN(SAL + NVL(COMM, 0)),'999.9') 최소급여
			,TO_CHAR(AVG(SAL + NVL(COMM, 0)),'9999.9')평균급여
		FROM EMP;



-- 2. student 테이블의 birthday 컬럼을 참조해서 월별로 생일자수를 출력하세요
-- TOTAL, JAN, ...,  5 DEC
--  20EA   3EA ....
SELECT COUNT(*)||'EA' "TOTAL",
	COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'01',1))||'EA' as JAN
	,COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'02',1))||'EA' as FEB
	,COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'03',1))||'EA' as MAR
	,COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'04',1))||'EA' as APR
	,COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'05',1))||'EA' as MAY
	,COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'06',1))||'EA' as JUN
	,COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'07',1))||'EA' as JUL
	,COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'08',1))||'EA' as AUG
	,COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'09',1))||'EA' as SEP
	,COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'10',1))||'EA' as OCP
	,COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'11',1))||'EA' as NOV
	,COUNT(DECODE(TO_CHAR(BIRTHDAY,'mm'),'12',1))||'EA' as DEC
FROM STUDENT;



-- 3. Student 테이블의 tel 컬럼을 참고하여 아래와 같이 지역별 인원수를 출력하세요.
--    단, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU, 055-GYEONGNAM
--    으로 출력하세요
SELECT COUNT(*) "total"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'02','*')) "02-SEOUL"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'031','*')) "031-GYEONGGI"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'051','*')) "051-BUSAN"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'052','*')) "052-ULSAN"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'053','*')) "053-DAEGU"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'055','*')) "055-GYEONGNAM"
FROM STUDENT;




-- 4. emp 테이블을 사용하여 직원들의 급여와 전체 급여의 누적 급여금액을 출력,
-- 단 급여를 오름차순으로 정렬해서 출력하세요.
-- sum() over()
SELECT DEPTNO,ENAME,SAL 급여
		,SUM(SAL) over(ORDER BY sal) 누적급여
FROM EMP;




-- 6. student 테이블의 Tel 컬럼을 사용하여 아래와 같이 지역별 인원수와 전체대비 차지하는 비율을 
--    출력하세요.(단, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU,055-GYEONGNAM)
 SELECT COUNT(*) "총인원"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'02','*'))  "02-SEOUL"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'031','*')) "031-GYEONGGI"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'051','*')) "051-BUSAN"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'052','*')) "052-ULSAN"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'053','*')) "053-DAEGU"
,COUNT(DECODE(substr(tel, 1, instr(tel, ')', 1, 1)-1),'055','*')) "055-GYEONGNAM"
,COUNT(DECODE(SUBSTR(TEL, 1,INSTR(TEL,')',1,1)-1),'02',0))/COUNT(NAME)*100||'%'"02-SEOUL",
 COUNT(DECODE(SUBSTR(TEL, 1,INSTR(TEL,')',1,1)-1),'031',0))/COUNT(NAME)*100||'%'"031-GYEONGGI",
 COUNT(DECODE(SUBSTR(TEL, 1,INSTR(TEL,')',1,1)-1),'051',0))/COUNT(NAME)*100||'%'"051-BUSAN",
 COUNT(DECODE(SUBSTR(TEL, 1,INSTR(TEL,')',1,1)-1),'052',0))/COUNT(NAME)*100||'%'"052-ULSAN",
 COUNT(DECODE(SUBSTR(TEL, 1,INSTR(TEL,')',1,1)-1),'053',0))/COUNT(NAME)*100||'%'"053-DAEGU",
 COUNT(DECODE(SUBSTR(TEL, 1,INSTR(TEL,')',1,1)-1),'055',0))/COUNT(NAME)*100||'%'"055-GYEONGNAM"
 FROM STUDENT;




-- 7. emp 테이블을 사용하여 부서별로 급여 누적 합계가 나오도록 출력하세요. 
-- ( 단 부서번호로 오름차순 출력하세요. )
SELECT DEPTNO,ENAME,SAL
	,SUM(SAL) over(partition by DEPTNO ORDER BY SAL) 누적합계
FROM EMP;


-- 8. emp 테이블을 사용하여 각 사원의 급여액이 전체 직원 급여총액에서 몇 %의 비율을 
--    차지하는지 출력하세요. 단 급여 비중이 높은 사람이 먼저 출력되도록 하세요
   
	 SELECT DEPTNO,ENAME,SAL
	 , SUM(SAL) over() 급여총액
	 ,ROUND(ratio_to_report(SAL) over()*100,2)"비율(%)"
	 FROM EMP
	 GROUP BY DEPTNO,ENAME,SAL
	 ORDER BY SAL DESC;
	
	 
	 

-- 9. emp 테이블을 조회하여 각 직원들의 급여가 해당 부서 합계금액에서 몇 %의 비중을
--     차지하는지를 출력하세요. 단 부서번호를 기준으로 오름차순으로 출력하세요.
SELECT DEPTNO,ENAME,SAL
,SUM(SAL) over(PARTITION BY DEPTNO) 부서합계금액
,ROUND((ratio_to_report(SAL) over(PARTITION BY DEPTNO))*100,2)"비중(%)"
FROM EMP
ORDER BY DEPTNO DESC;