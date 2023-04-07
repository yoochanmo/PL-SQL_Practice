/* 연습문제 */
-- ex01) student, department에서 학생이름, 학과번호, 1전공학과명출력
SELECT STUDENT.NAME,STUDENT.DEPTNO1,DEPARTMENT.DNAME
FROM STUDENT,DEPARTMENT
WHERE STUDENT.DEPTNO1=DEPARTMENT.DEPTNO;


-- ex02) emp2, p_grade에서 현재 직급의 사원명, 직급, 현재 년봉, 해당직급의 하한
--       상한금액 출력 (천단위 ,로 구분)
SELECT EMP2.NAME 이름,EMP2.POSITION 직급
,TO_CHAR((EMP2.PAY),'99,999,999') 현재연봉
,TO_CHAR((p_grade.S_PAY),'99,999,999')하한금액
,TO_CHAR((p_grade.E_PAY),'99,999,999')상한금액
FROM emp2,p_grade
WHERE EMP2.POSITION = p_grade.POSITION;
    
-- ex03) emp2, p_grade에서 사원명, 나이, 직급, 예상직급(나이로 계산후 해당 나이의
--       직급), 나이는 오늘날자기준 trunc로 소수점이하 절삭 
SELECT EMP2.NAME 이름
	,TRUNC((SYSDATE-EMP2.BIRTHDAY)/365.0)현재나이
	,EMP2.POSITION 현재직급
	,P_GRADE.POSITION 예상직급
FROM EMP2,P_GRADE
WHERE TRUNC((SYSDATE-EMP2.BIRTHDAY)/365.0) BETWEEN P_GRADE.S_AGE AND P_GRADE.E_AGE;

-- ex04) customer, gift 고객포인트보다 낮은 포인트의 상품중에 Notebook을 선택할
--       수 있는 고객명, 포인트, 상품명을 출력    
SELECT COS.GNAME 고객명, COS.POINT 포인트 , GIF.GNAME 상품명
FROM CUSTOMER COS, GIFT GIF
WHERE COS.POINT >= GIF.G_START
AND GIF.GNAME = 'Notebook';


-- ex05) professor에서 교수번호, 교수명, 입사일, 자신보다 빠른 사람의 인원수
--       단, 입사일이 빠른 사람수를 오름차순으로
SELECT p1.profno 교수번호, p1.name 교수명, p1.hiredate 입사일,count(p2.hiredate) 빠른사람
from professor p1, professor p2
where p1.hiredate > p2.hiredate(+)
group by p1.profno, p1.name, p1.hiredate
order by 4;				
 
 
 
-- ex06) emp에서 사원번호, 사원명, 입사일 자신보다 먼저 입사한 인원수를 출력
--       단, 입사일이 빠른 사람수를 오름차순 정렬
SELECT  e1.empno 사원번호, e1.ename 사원명, e1.hiredate 입사일, count(e2.hiredate) 빠른사람
from emp e1, emp e2
where e2.hiredate < e1.hiredate
group by e1.empno, e1.ename, e1.hiredate
order by 4;