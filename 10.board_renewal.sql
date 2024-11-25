 -- 여러 사용자가 1개의 글을 수정할 수 있다 가정 후 DB 리뉴얼
 -- author와 post가 n:m관계가 되어 관계테이블을 별도로 생성
 create table author(id bigint autho_increment,
 email VARCHAR(255) not null unique, name VARCHAR(255),
 create_time datetime DEFAULT current_timestamp());

 creat table post(id bigint autho_increment primary key,
 title VARCHAR(255) not null, contents VARCHAR(3000), create_time datetime DEFAULT create_time());

 --1:1관계인 author_address
 -- 1:1관계의 보장은 author_id unique 설정
 create table author_address(id bigint autho_increment primary key,
 country VARCHAR(255), city VARCHAR(255), street VARCHAR(255),j author_id bigint not null unique,
 foreign key(author_id) references author(id));

 -- author_post는 연결테이블로 생성
create table author_post(id bigint autho_increment primary key, 
author_id bigint not null, post_id bigint not null, 
foreign key(author_id) references author(id),
foreign key(post_id) references post(id))

--복합키로 author_post 생성
create table author_post2(
    author_id bigint not null,
    post_id bigint not null,
    primary key(author_id,post_id),
    foreign key(author_id) references author(id),
    foreign key(post_id) references post(id));

    --테스트
insert into author(email, name) values ('hans1@naver.com',  'hans');
insert into author(email, name) values ('hans2@naver.com',  'hansi');
insert into author(email, name) values ('hans3@naver.com',  'hansu');
insert into author(email, name) values ('july1@naver.com',  'july');
insert into author(email, name) values ('july2@naver.com',  'jully');

insert into author_address(author_id, country, city, street) values ( 1, 'japan', 'osaka', 'nara');
insert into author_address(author_id, country, city, street) values ( 2, 'korea', 'incheon', 'san-ro');
insert into author_address(author_id, country, city, street) values ( 3, null, null, null);
insert into author_address(author_id, country, city, street) values ( 4, null, null, null);
insert into author_address(author_id, country, city, street) values ( 5, null, null, null);

insert into post(title, contents) values ( 'hello,java' , 'hi,i`m java!');
insert into post(title, contents) values ( 'hello,python' , 'hi,we are python!');

insert into author_post(author_id, post_id) values ( 1, 1);
insert into author_post(author_id, post_id) values ( 2, 1);
insert into author_post(author_id, post_id) values ( 5, 1);
insert into author_post(author_id, post_id) values ( 3, 2);
insert into author_post(author_id, post_id) values ( 4, 2);
insert into author_post(author_id, post_id) values ( 5, 2);

--내 id로 내가 쓴글 조회
select * from post p inner join author_post ap on p.id=ap.post_id 
where ap.author_id =1;
