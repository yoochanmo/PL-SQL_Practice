/* 연습문제 */
-- view문제를 기초로 자유롭게 procedure를 작성하세요!
-- 매개변수를 받아서 만드는 것을 기본으로 하고
-- 	dbms_output.put_line('========================================================');
-- 	dbms_output.put_line('교수명' || chr(9) || '교수번호' || chr(9) || '학과명');
-- 	dbms_output.put_line('========================================================');
-- 출력하는 프로시저를 작성해 보세요!!
-- 프로시저명 ex01~ex06 

-- ex01) professor, department을 join 교수번호, 교수이름, 소속학과이름 조회 View
create or replace procedure ex01 is
-- 테이블 형식지정
type tab_pno_type is table of professor.profno%type index by binary_integer;
type tab_name_type is table of professor.name%type index by binary_integer;
type tab_posi_type is table of professor.position%type index by binary_integer;

v_pno_table tab_pno_type;
v_name_table tab_name_type;
v_posi_table tab_posi_type;

idx binary_integer := 0;
BEGIN
-- professor라는 이름의 커서(cursor)를 선언하고, professor 커서가 SELECT 문의 결과를 하나씩 순회.
-- SELECT 문은 professor 테이블의 profno, name, position 열을 조회하고, profno 열을 기준으로 오름차순으로 정렬.
for professor in(SELECT profno,name,position from professor ORDER BY profno) loop
-- idx := idx +1;은 배열에 데이터를 저장하기 위해 인덱스를 1씩 증가.
	idx := idx +1;
  -- v_pno_table 배열의 idx번째 원소에 professor 커서의 profno 값을 대입.
	v_pno_table(idx) := professor.profno;
  -- v_name_table 배열의 idx번째 원소에 professor 커서의 name 값을 대입.
	v_name_table(idx) := professor.name;
  -- v_posi_table 배열의 idx번째 원소에 professor 커서의 position 값을 대입.
	v_posi_table(idx) := professor.position;

	end loop;
  -- DBMS_OUTPUT.PUT_LINE 함수를 이용하여 교수의 번호, 이름, 소속학과명을 출력.
  -- CHR(9)는 수평 탭 문자를 의미.
	dbms_output.put_line('============================================');
	dbms_output.put_line('교수명' || chr(9) || '교수번호' || chr(9) || '소속학과명');
	dbms_output.put_line('============================================');
  -- i 변수를 1부터 idx까지 반복하면서, v_pno_table, v_name_table, v_posi_table 배열을 차례대로 출력.
for i in 1..idx loop
	dbms_output.put_line(v_pno_table(i) || chr(9) || v_name_table(i) || chr(9) || v_posi_table(i));
	end loop;

EXCEPTION when others then
 dbms_output.put_line('에러가 발생했습니다.');
END;


-- ex02) inline view를 사용, student, department를 사용 학과별로 
-- 학생들의 최대키, 최대몸무게, 학과명을 출력

CREATE OR REPLACE PROCEDURE ex02 IS
  TYPE tab_deptname_type IS TABLE OF department.dname%TYPE INDEX BY BINARY_INTEGER;
  TYPE tab_deptno_type IS TABLE OF department.deptno%TYPE INDEX BY BINARY_INTEGER;
  TYPE tab_max_height_type IS TABLE OF student.height%TYPE INDEX BY BINARY_INTEGER;
  TYPE tab_max_weight_type IS TABLE OF student.weight%TYPE INDEX BY BINARY_INTEGER;
  
  v_deptname_table tab_deptname_type;
  v_deptno_table tab_deptno_type;
  v_max_height_table tab_max_height_type;
  v_max_weight_table tab_max_weight_type;
  
  idx BINARY_INTEGER := 0;
BEGIN
  FOR r IN (SELECT d.dname, d.deptno, MAX(s.height) AS max_height, MAX(s.weight) AS max_weight
            FROM student s
            INNER JOIN department d ON s.deptno1 = d.deptno
            GROUP BY d.dname, d.deptno)
  LOOP
    idx := idx + 1;
    v_deptname_table(idx) := r.dname;
    v_deptno_table(idx) := r.deptno;
    v_max_height_table(idx) := r.max_height;
    v_max_weight_table(idx) := r.max_weight;
  END LOOP;
  
  dbms_output.put_line('============================================');
  dbms_output.put_line('학과명' || chr(9) || '학과번호' || chr(9) || '최대키' || chr(9) || '최대몸무게');
  dbms_output.put_line('============================================');
  
  FOR i IN 1..idx
  LOOP
    dbms_output.put_line(v_deptname_table(i) || chr(9) || v_deptno_table(i) || chr(9) || v_max_height_table(i) || chr(9) || v_max_weight_table(i));
  END LOOP;
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('에러가 발생했습니다.');
END;


-- ex03) inline view를 사용, 학과명, 학과별최대키, 학과별로 가장 키가 큰 학생들의
-- 이름과 키를 출력

CREATE OR REPLACE PROCEDURE ex03 IS
  v_deptname department.dname%TYPE;
  v_max_height student.height%TYPE;
  v_student_name student.name%TYPE;
  v_student_height student.height%TYPE;
BEGIN
  FOR r IN (SELECT d.dname, m.height AS max_height, s.name, s.height
            FROM (SELECT deptno1, max(height) height FROM student GROUP BY deptno1) m,
                 student s,
                 department d
            WHERE s.deptno1 = d.deptno
              AND m.height = s.height
              AND m.deptno1 = s.deptno1)
  LOOP
    v_deptname := r.dname;
    v_max_height := r.max_height;
    v_student_name := r.name;
    v_student_height := r.height;
    DBMS_OUTPUT.PUT_LINE(v_deptname || ' 학과');
    DBMS_OUTPUT.PUT_LINE('최대 키: ' || v_max_height);
    DBMS_OUTPUT.PUT_LINE('학생명: ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('학생 키: ' || v_student_height);
    DBMS_OUTPUT.PUT_LINE('=======================');
  END LOOP;
  
  EXCEPTION WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('에러가 발생했습니다.');
END;





-- ex04) student에서 학생키가 동일학년의 평균키보다 큰 학생들의 학년과 이름과 키


CREATE OR REPLACE PROCEDURE ex04 IS
v_grade student.grade%TYPE;
v_name student.name%TYPE;
v_height student.height%TYPE;
v_avg_height student.height%TYPE;
BEGIN
FOR rec IN (SELECT std.grade, std.name, std.height, a.height AS avg_height
FROM (SELECT grade, AVG(height) AS height FROM student GROUP BY grade) a,
student std
WHERE std.height > a.height
AND std.grade = a.grade)
LOOP
v_grade := rec.grade;
v_name := rec.name;
v_height := rec.height;
v_avg_height := rec.avg_height;
DBMS_OUTPUT.PUT_LINE('학년: ' || v_grade);
DBMS_OUTPUT.PUT_LINE('학생명: ' || v_name);
DBMS_OUTPUT.PUT_LINE('학생키: ' || v_height);
DBMS_OUTPUT.PUT_LINE('평균키: ' || v_avg_height);
DBMS_OUTPUT.PUT_LINE('=======================');
END LOOP;

EXCEPTION WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('에러가 발생했습니다.');
END;


-- ex05) professor에서 교수들의 급여순위와 이름, 급여출력 단, 급여순위 1~5위까지
-- create.....



CREATE OR REPLACE PROCEDURE ex05 IS
BEGIN
  FOR rec IN (SELECT ROWNUM AS 급여순위, name AS 이름, pay AS 급여
              FROM (SELECT name, pay FROM professor ORDER BY pay DESC)
              WHERE ROWNUM BETWEEN 1 AND 5)
  LOOP
	  DBMS_OUTPUT.PUT_LINE('=============================================');
    DBMS_OUTPUT.PUT_LINE(rec.급여순위 || chr(9) || rec.이름 || chr(9) || rec.급여);
		DBMS_OUTPUT.PUT_LINE('=============================================');
  END LOOP;

  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('에러가 발생했습니다.');
END;





-- ex06) 교수번호정렬후 3건씩해서 급여합계와 급여평균을 출력

CREATE OR REPLACE PROCEDURE EX06(P_ORDER IN VARCHAR) IS
	TYPE T_PROFNO IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
	TYPE T_PAY IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;

	V_PROFNO T_PROFNO;
	V_SUM_PAY T_PAY;
	V_AVG_PAY T_PAY;

	IDX BINARY_INTEGER := 0;
BEGIN 
	
	IF(P_ORDER = 'ASC') THEN
		FOR PROF_LIST IN (
					SELECT T1.profno,  SUM(T1.PAY) AS "SUM_PAY", ROUND(AVG(T1.PAY), 2) AS "AVG_PAY"
					FROM (SELECT PROFNO, PAY FROM PROFESSOR ORDER BY PROFNO) T1
					GROUP BY ROLLUP(ceil(rownum/3), T1.profno)
		) LOOP
			IDX := IDX + 1;
			V_PROFNO(IDX) := PROF_LIST.PROFNO;
			V_SUM_PAY(IDX) := PROF_LIST.SUM_PAY;
			V_AVG_PAY(IDX) := PROF_LIST.AVG_PAY;
		END LOOP;
	ELSIF(P_ORDER = 'DESC') THEN
		FOR PROF_LIST IN (
					SELECT T1.profno,  SUM(T1.PAY) AS "SUM_PAY", ROUND(AVG(T1.PAY), 2) AS "AVG_PAY"
					FROM (SELECT PROFNO, PAY FROM PROFESSOR ORDER BY PROFNO DESC) T1
					GROUP BY ROLLUP(ceil(rownum/3), T1.profno)
		) LOOP
			IDX := IDX + 1;
			V_PROFNO(IDX) := PROF_LIST.PROFNO;
			V_SUM_PAY(IDX) := PROF_LIST.SUM_PAY;
			V_AVG_PAY(IDX) := PROF_LIST.AVG_PAY;
		END LOOP;
	END IF;

	DBMS_OUTPUT.PUT_LINE('======================================');
	DBMS_OUTPUT.PUT_LINE('교수번호' || CHR(9) || '봉급 합계' || CHR(9) || '봉급 평균');
	DBMS_OUTPUT.PUT_LINE('======================================');

	FOR I IN 1..IDX LOOP
		DBMS_OUTPUT.PUT_LINE(V_PROFNO(I) || CHR(9) || V_SUM_PAY(I) || CHR(9) ||V_AVG_PAY(I));
	END LOOP;
END;


CALL EX06('DESC');
