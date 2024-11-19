--tinyint는 -128~127 까지 표현()
--author테이블에 age추가
--data insert 테스트 : 200살 insert.

insert into author(id, age) values(6,200);
alter table author modify column age tinyint unsigned;

--decimal실습
--decimal(정수부 , 소수부)
alter table post add column price decimal(10,3);

--decimal 소수점 초과 후 값 짤림 현상
insert into post(id, title ,price) value(4 , 'java programming',10.334122);

--문자열 실습
alter table author add column self_introduction text;
insert into author(id, self_introduction) value(7,'안녕하세요');

--blob(바이너리데이터) 타입 실습.
--binary=이진법
--이미지 또는 동영상->바이너리(binary) 데이터 변환
alter table author add column profile_image longblob;
insert into author(id, profile_image) value(8,LOAD_FILE('C:\1.png'));

--enum : 삽입 될수 있는 데이터의 종류를 한정하는 데이터타입
--role컬럼 추카
alter table author add column role enum('user','admin') not null default 'user';
--user값 세팅후 insert
insert into author(id,role)value(10,'user');
--users갑 세팅후 insert(잘못된 값)
insert into author(id,role)value(11,'users');
--아무것도 안넣고 insert(default 값)

-- date : 날짜 , datetime : 날짜 및 시분초 (microseconds)
-- datetime은 입력,수정, 조회시 문자열 형식을 활용
alter table post add column created_time datetime default current_timestamp();
update post set created_time = '2024-11-18 17:12:43' where id =3;

--조회시 비교연산자
select * from author where id >= 2 and id <=4;
select * from author where id between 2 and 4; --위와 같은 구문 2 =< id =< 4
select * from author where id not(id < 2 or id > 4);
select * from author where id in( 2,3,4 );
select * from author where id not in( 1,5 ); --전체 데이터가 1~5까지 밖에 없다는 가정.

--응용.. 한번이라도 글쓴사람 골라내기
select *from author where id in(select author_id from post);

--like : 특정문자를 포함하는 데이터를 조회하기 위해 사용하느 키워드
select * from post where title like '%h'; --h로 끝나는 title검색
select * from post where title like 'h%'; --h로 시작하는 title검색
select * from post where title like '%h%';--h가 들어가있는 키워드 검색

--regexp : 정규표현식을 활용한 조회
select * from post where title regexp '[a-z]'; --하나라도 알파벳이 들어있으면 
select * from post where title regexp '[가-힣]'; --하나라도 한글이 포함돼 있으면

--날짜변환 cast,convert : 숫자 ->날짜 , 문자->날짜
select cast(20241119 as date);
select cast('20241119' as date);
select convert(20241119 date);
select convert('20241119' date);
--문자 ->숫자 변환
select cast('12' as unsigned);

--날짜 조회 방법
--like패턴, 부등호 활용, date_pormat
select * from post where created_time like '2024-11%';  --문자열처럼 조회
select * from post where created_time >= '2024-01-01' and created_time < '2025-01-01';
select date_format(created_time,'%Y-%m-%d') from post;
select date_format(created_time,'%H-%i-%s') from post;
select * from post where date_format(created_time, '%Y')='2024';
select * from post where cast(date_format(created_time, '%Y')='2024' as unsigned) = 2024;

--오늘현재시간
select now();

