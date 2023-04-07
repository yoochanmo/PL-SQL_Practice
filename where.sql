/* 연습문제 */
-- ex01) 급여가 1000보다 작은 사원만 출력하기(ename/sal/hiredate 만 출력)
SELECT ENAME, SAL, HIREDATE FROM EMP where SAL < 1000;

-- ex02) 부서(dept)테이블에서 부서번호와, 부서명을 별칭으로 한 sql문을 작성
SELECT '부서번호',DEPTNO "부서번호", '부서명',DNAME "부서명" from DEPT;

-- ex03) 사원테이블에서 직급만 출력하는데 중복되지 않게 출력하는 sql문
SELECT DISTINCT JOB FROM EMP;

-- ex04) 급여가 800인 사원만 조회
SELECT * FROM EMP WHERE sal = 800;

-- ex05) 사원명이 BLAKE인 사원만 출력
SELECT * FROM EMP WHERE ENAME ='BLAKE';

-- ex06) 사원이름 JAMES~MARTIN사이의 사원을 사원번호, 사원명, 급여를 출력
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME >= 'JAMES' AND ENAME <= 'MARTIN';


SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME BETWEEN 'JAMES' AND 'MARTIN';


-- and / between 두가지형태로 작성