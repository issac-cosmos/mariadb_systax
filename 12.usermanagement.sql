--사용자관리
--사용자목록조회
select * from mysql.user;

--사용자 생성
create user '계정명'@'%' identified by '4321' --%는 원격

--사용자에게 select 권한 부여
grant select on board.author to '계정명'@'localhost';

--사용자 권한 회수
grant select on board.author to '계정명'@'localhost';

--사용자 계정삭제
drop user '계정명'@'localhost';