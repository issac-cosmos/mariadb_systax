-- mariadb 서버에 접속 : 중요
mariadb -u root -p

-- 스키마(databases) 목록조회 : 중요
show databases;

--스키마(databases) 생성 : 중요
CREATE DATABASE board;

--스키마 삭제
drop delate

--데이터베이스 선택
use board;

--테이블목록조회
show tables;

--문자 인코딩 조회
show variables like 'character_set_server';
--문자 인코딩 변경
alter database board character set utf8mb4;

--테이블 생성 : 중요
create table author(id int primary key, name varchar(255), email varchar(255), password varchar(255));

--테이블 컬럼 조회 (뒤에 테이블명) : 중요
describe author;

--테이블 컬럼 상세 조회
show full columns from author;

--테이블 생성명령문 조회
show create table author;

--테이블 컬럼조회 : 중요
describe author;

select * from author;

--post테이블 신규 생성(id, title, content, author)
create table post(id int primary key, title varchar(255),content varchar(225), author_id int not null, foreign key(author_id) references author(id));

--테이블 index(성능향상 옵션) 조회
show index from author;

--alter 문 : 테이블의 구조를 변경
-- 테이블의 이름 변경
alter table post rename posts;
--테이블 컬럼추가
alter table author add column age int;
--테이블 컬럼 삭제
alter table author drop column age;
--테이블 컬럼명 변경
alter table post change column content contents varchar(255);
--테이블 컬럼 타입과 제약조건 변경 : 중요 (덮어쓰기됨에 유의)
alter table author modify column email varchar(100) not null;

--실습 : author 테이블에 address컬럼추가 varchar255
alter table author add column address varchar(255);
--실습 : post 테이블에 title은 not null 로 변경 , contents 3000자로 변경
alter table post modify column title varchar(255) not null;
alter table post modify column contents varchar(3000);

--테이블 삭제 
show create table post;
drop table post;

-- DDL : 테이블 구조 생성/변경/삭제 작업
-- DML : 테이블안에서 데이터를 삽입/ 변경 / 조회 / 삭제
-- intset ,update ,select, delete