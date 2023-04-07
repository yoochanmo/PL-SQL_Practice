/* 연습문제 */
-- ex01) professor, department을 join 교수번호, 교수이름, 소속학과이름 조회 View
CREATE OR REPLACE VIEW v_pro as
SELECT pro.profno
	, pro.name
	, dep.dname
FROM PROFESSOR pro, DEPARTMENT dep
WHERE pro.deptno = dep.deptno;

select * from v_pro;

-- ex02) inline view를 사용, student, department를 사용 학과별로 
-- 학생들의 최대키, 최대몸무게, 학과명을 출력

SELECT dep.dname 학과명
			, dep.deptno 학과번호
			, std.max_height 최대키
			, std.max_weight 최대몸무게
FROM(select deptno1, max(height) max_height,max(weight) max_weight from student group by deptno1) std, DEPARTMENT dep
WHERE std.deptno1 = dep.deptno;

-- ex03) inline view를 사용, 학과명, 학과별최대키, 학과별로 가장 키가 큰 학생들의
-- 이름과 키를 출력


SELECT dep.dname 학과명, m.height "학과 최대키", std.NAME 학생명, std.HEIGHT 키
FROM (SELECT deptno1, max(height) height FROM STUDENT GROUP BY deptno1) m,
     STUDENT std, DEPARTMENT dep WHERE std.DEPTNO1=dep.DEPTNO
AND m.height=std.HEIGHT
AND std.DEPTNO1=m.DEPTNO1;



-- ex04) student에서 학생키가 동일학년의 평균키보다 큰 학생들의 학년과 이름과 키
-- 해당 학년의 평균키를 출력 단, inline view로
CREATE OR REPLACE view v_avg_grade as
SELECT std.grade 학년, std.name 학생명, std.height 학생키, a.height 평균키 
FROM(SELECT grade , avg(height) height from student group by grade) a,
		STUDENT std
WHERE std.height > a.height 
AND std.grade = a.grade;

SELECT * FROM v_avg_grade;
-- ex05) professor에서 교수들의 급여순위와 이름, 급여출력 단, 급여순위 1~5위까지
-- create.....

SELECT rownum 급여순위 , name 이름, pay 급여
FROM(SELECT name, pay FROM PROFESSOR ORDER BY pay DESC)
WHERE ROWNUM BETWEEN 1 and 5;


-- ex06) 교수번호정렬후 3건씩해서 급여합계와 급여평균을 출력
-- hint) 
select rownum, profno, pay, ceil(rownum/3) from professor; -- rollup


SELECT num 번호, profno 교수번호, name 교수명, pay 급여, sum(pay) 급여합계, round(avg(pay),1) 평균급여
FROM(SELECT profno, name, pay, rownum num FROM professor )
GROUP BY ceil(rownum/3), rollup((profno,name,pay,num))
ORDER BY ceil(rownum/3);





SELECT num 번호, profno 교수번호, name 교수명, pay 급여, sum(pay) 급여합계, round(avg(pay),1) 평균급여
FROM(select rownum num, name, profno, pay, ceil(rownum/3) from professor )
GROUP BY ceil(rownum/3), rollup((profno,name,pay,num))
ORDER BY ceil(rownum/3);











