-- 실습 1 .성적관리 프로그램(pl/sql)
--테이블

create table sungjuk(
         hakbun  varchar2(10)
      , name    varchar2(10)
      , kor     number(3)
      , eng     number(3)
      , mat     number(3)
);
insert into sungjuk values(1001, '홍길동', 90,80,70);
insert into sungjuk values(1002, '홍길순', 100,100,100);
insert into sungjuk values(1003, '홍길자', 90,85,70);
insert into sungjuk values(1004, '홍길녀', 70,60,50);
insert into sungjuk values(1005, '홍길영', 40,50,70);
select * from sungjuk;

-- 성적결과 테이블
drop table sungresult;
create table sungresult(
         hakbun  varchar2(10)
      , name    varchar2(10)
      , kor     number(3)
      , eng     number(3)
      , mat     number(3)
      , tot     number(3)
      , avg     number(4,1)
      , hak     varchar2(2) -- A+ ~ F
      , pass    varchar2(10)
      , rank    number
);
select * from sungresult;


-- 1. sungjuk파일을    커서 c_sungjuk    로 정의
-- 2. sungresult파일을 커서 c_sungresult
-- 3. >=95 A+, >=90 A0, >=85 B+ 5점단위... >= 60 D0 else 'F
-- 4. 성적의 평균이 >= 70 pass= 'pass' else pass='fail';
-- 5. insert into sungresult() value()
-- 6. update sungresult rank = 순위를 update select count(*) + 1 from sungresult where tot > 180;


create or replace procedure pro_25 is

-- 커서 선언
  cursor c_sungjuk is
    select hakbun, name, kor, eng, mat
    from sungjuk;
  
  cursor c_sungresult is
    select hakbun, name, kor, eng, mat, tot, avg, hak, pass, rank
    from sungresult;

  v_tot number(3);
  v_avg number(4,1);
  v_hak varchar2(2);
  v_pass varchar2(10);
  
begin
--sungjuk 테이블에서 데이터를 하나씩 가져와서 for loop로 처리 
  for rec in c_sungjuk loop
  -- 총합 total 점수 계산
    v_tot := rec.kor + rec.eng + rec.mat;
    -- 평균 avg 구하는 계산
    v_avg := v_tot / 3.0;
    
    if v_avg >= 95 then
      v_hak := 'A+';
    elsif v_avg >= 90 then
      v_hak := 'A0';
    elsif v_avg >= 85 then
      v_hak := 'B+';
    elsif v_avg >=80 then
      v_hak := 'B0';
		elsif v_avg >=75 then
      v_hak := 'C+';
		elsif v_avg >=70 then
      v_hak := 'C0';
		elsif v_avg >=65 then
      v_hak := 'D+';
		else
      v_hak := 'F';
    end if;
    
    if v_avg >= 70 then
      v_pass := 'pass';
    else
      v_pass := 'fail';
    end if;
    -- 계산된 결과값들 insert 
    insert into sungresult values (rec.hakbun, rec.name, rec.kor, rec.eng, rec.mat, v_tot, v_avg, v_hak, v_pass, null);
      
  end loop;
  --count(*) + 1을 사용하여 현재 행보다 높은 점수를 가진 행의 개수에 1을 더해 rank 값을 계산
  update sungresult t1 --t1 별칭 사용
  set rank = (select count(*) + 1 from sungresult t2 where t1.tot < t2.tot); --서브쿼리 t2 별칭 사용 
  
exception 
  when others then
    dbms_output.put_line('예외가 발생했습니다.');
    
end pro_25;

SELECT * FROM sungjuk;

SELECT * FROM sungresult;