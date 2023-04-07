* 연습문제 */
-- ex01) 두 숫자를 제공하면 덧셈을 해서 결과값을 반환하는 함수를 정의
-- 함수명은 add_num
create or replace function add_num(num1 in number, num2 in number) return number is
plus_result number;
begin
	plus_result := num1 + num2;
	dbms_output.put_line(plus_result);
	return plus_result;
end; 
SELECT add_num(15,20) from dual;

-- ex02) 부서번호를 입력하면 해당 부서에서 근무하는 사원 수를 반환하는 함수를 정의
-- 함수명은 get_emp_count
create or replace function get_emp_count(p_deptno in number ) return number is
sw_count number;
begin
	select count(*)
	into sw_count
	from emp
	where deptno = p_deptno;
	return sw_count;
end;

SELECT get_emp_count(10) FROM DUAL;

-- ex03) emp에서 사원번호를 입력하면 해당 사원의 관리자 이름을 구하는 함수
-- 함수명 get_mgr_name
CREATE OR REPLACE FUNCTION get_mgr_name(p_empno in number) RETURN varchar2 is
 mgr_name varchar2(10);

begin
select ename
into mgr_name
from emp
where empno = p_empno;
return mgr_name;


end;

SELECT get_mgr_name(7369) FROM DUAL;



-- ex04) emp테이블을 이용해서 사원번호를 입력하면 급여 등급을 구하는 함수
-- 4000~5000 A, 3000~4000미만 B, 2000~3000미만 C, 1000~200미만 D, 1000미만 F 
-- 함수명 get_sal_grade

CREATE OR REPLACE FUNCTION get_sal_grade(p_empno in varchar2) RETURN VARCHAR2
IS
    temp_sal NUMBER;
    grade VARCHAR2(10);
BEGIN

    SELECT SAL
    INTO temp_sal
    FROM EMP
    WHERE empno = p_empno;

    CASE
        WHEN 4000 <= temp_sal THEN grade:='A';
        WHEN 3000 <= temp_sal AND temp_sal < 4000 THEN grade:='B';
        WHEN 2000 <= temp_sal AND temp_sal < 3000 THEN grade:='C';
        WHEN 1000 <= temp_sal AND  temp_sal <2000 THEN grade:='D';
        ELSE grade:='F';
    END CASE;

    RETURN grade;
END;
SELECT get_sal_grade('7369') FROM DUAL;

-- ex05) star_wars에 episode를 신규추가등록
-- episode_id = 7, episode_name = '새로운 공화국(New Republic)', open_year=2009
-- 새로운 에피소드를 추가하는 new_star_wars프로시저를 생성
CREATE OR REPLACE PROCEDURE NEW_STAR_WARS(P_EPISODE_ID IN STAR_WARS.EPISODE_ID%TYPE, P_EPISODE_NAME IN STAR_WARS.EPISODE_NAME%TYPE, P_OPEN_YEAR IN STAR_WARS.OPEN_YEAR%TYPE) IS 
BEGIN 
	INSERT INTO STAR_WARS VALUES(P_EPISODE_ID, P_EPISODE_NAME, P_OPEN_YEAR);
END;

CALL NEW_STAR_WARS(7,'새로운 공화국(New Republic)', 2009);

SELECT * FROM STAR_WARS;





