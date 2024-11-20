--read uncommited에서 발생할수있는 dirty read실습
--실습절차
--1)workbemch에서 auto_commit 해제후 update , commit하지 않음(트랜잭션1)
--2)터미널을 열어 select 했을때 위 변경사항이 읽히는지 확인(트랜잭션2)
--결론: mariadb는 기본이 repeatable



--read committed 에서 발생할수 있는 phantom read (또는 non-repeatable read) 실습
--아래 코드는 워크벤치에서 실행

start transaction;
select count(*) from author;
do sleep(15);
select count(*) from author;
commit;
--아래코드는 터미널에서 실행
insert into author(email) values('fffffffffff');
--결론: mariadb는 기본이 repeatable read 이므로 phantom read 발생하지않음

--repeatable read에서 발생할수있는 lost update실습
--lost update 해결을 위한 배타적 lock

start transaction;
select post_count from author where id=3 for update;
do sleep(10);
update author set post_count = (select post_count from author where id=3)-1 where id=3;
commit;
--아래코드는 터미널에서 실행
update author set post_count = (select post_count from author where id=3)-1 where id=3;


--lost update 해결을 위한 공유 lock
--아래코드는 워크벤치에서 실행
start transaction;
select post_count from author where id=3 lock in share mode;
do sleep(10);
commit;
--아래코드는 터미널에서 실행
select post_count from author where id=3 lock in share mode;

--read uncommitted(dirty) -> read commited(phantom read, non-repeatable read) -> repeatable read(lost update) : 공유락, 배타락(for update) -> serializable(동시성이슈 발생안함)

