-- insert into 정보 삽입
insert into 테이블명(컬럼명1,컬럼명2,컬럼명3) value(데이터1,데이터2,데이터3)
--문자열은 일반적으로 작은따옴표 ''를 사용
insert into author(id,name,email) value(3, 'kim','rud____@naver.com');
--select : 데이터조회 , * : 모든 컬럼을 의미
select * from author;
select name, email from author;

-- post 데이터 1줄추가
insert into post(id, title, content,author_id) value(1, 'hello' ,'helloooo',4);
--테이블 제약조건 조회
select * from information_schema.key_column_usage where table_name = 'post';

-- insert문을 통해 author데이터 2개정도 추가 , post 데이터 2개정도 추가(1개는 익명)

-- update : 데이터 수정
-- where문을 빠트리게 될경우 , 모든 데이터에 update문이 실행돔에 유의.
update author set name='홍길동' where id=1;
update author set name='홍길동2', email = 'hongildong@naver.com' where id=2;
-- delate : 데이터 삭제
-- where조건을 생략할경우 모든 데이터가 삭제됨에 유의
delate from author where id = 5;

--select : 조회
select * from author; --어떠한 조회조건없이 모든 컬럼조회
select * from author where id =1; --where 뒤에 조회 조건을 통해 조회
select * from author where name = 'hongildong';
select * from author where id>3;
select * from author where id>2 and name='rud'; --또는일경우 or를 사용

--중복제거 조회  distint
select name from author;
select distinct name from author;

-- 정렬 : order by +컬럼명
-- 아무런 정렬조건 없이 조회할경우에는 pk 기준으로 오름차순정력
--asc : 오름차순, desc : 내림차순

--멀티 컬럼 order : 여러 컬럼으로 정렬, 먼저쓴컬럼 운선정렬,중복시 그다음 정렬옵션 적용
select *from author order by name desc , email asc;
--결과값 개수 제한
select *from author order by desc ilmit2;

--별칭(alias)을 이용한 select
select name as '이름',email as '이메일' from author;
select a.name, a.email from author as a;
select a.name, a.email from author a;

--null을 조회조건으로 활용
select * from author where password is null;
select * from author where password is not null;


--문제풀이
--여러 기준으로 정렬하기
--상위n개 레코드
SELECT name from ANIMAL_INS order by DATETIME limit 1;
