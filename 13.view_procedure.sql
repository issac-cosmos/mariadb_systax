--view : 실제데이터를 참조만 하는 가상의 테이블
--사용목적 1)복잡한 쿼리 대신 2) 테이블의 컬럼까지 권한분리

--view생성
create view author_for_marketing as select name, email from author;

--view조회
select * from author_for_marketing;

--view 권한 부여
grant select on board.author_for_marketing to '계정명'@'localhost';

--view 삭제
drop view author_for_marketing;




--프로시저 생성
DELIMITER //
create PROCEDURE hello_procedure()
begin
    select 'hello world';
end
// DELIMITER ;--세미콜론 뒤 띄어쓰기 해야함

--프로시저 호출
call hello_procedure();

--프로시저 삭제
drop procedure hello_procedure;

--게시글 목록조회 프로시저 생성
DELIMITER //
create PROCEDURE 게시글목록조회()
begin
    select * from post;
end
// DELIMITER ;

call 게시글목록조회();

--게시글 id단건조회 프로시저 생성
DELIMITER //
create PROCEDURE 게시글id단건조회(in postid bigint)
begin
    select * from post where id = postid;
end
// DELIMITER ;

call 게시글id단건조회(1);

--게시글목록조회byemail
DELIMITER //
create PROCEDURE 게시글목록조회(in postid bigint)
begin
    select id, city,village from post where id = postid;
end
// DELIMITER ;

--글쓰기
DELIMITER //
create PROCEDURE 글쓰기(in inputTitle varchar(255),in inputContents varchar(255),in intputEmail varchar(255))
begin
    declare authorId bigint;
    declare postId bigint;
    insert into post(title, contents) values(inputTitle, inputContents);
    select id into postId from post order by id desc limit 1;
    select id into authorId from author where email = inputEmail;
    insert into author_post(author_id,post_id) values();
end
// DELIMITER ;


--글삭제
DELIMITER //
create PROCEDURE 글삭제(in inputIPostid bigint,in inputEmail varchar(255))
begin
    declare authorPostCount bigint;
    declare authorId bigint;
    select count(*) into authorPostCount from author_post where post_id = inputPostid;
    select id into authorId from author where email = inputEmail;
    if authorPostCount>=2 then
    --elseif도 사용가능
        delete from author_post where post_id=inputPostid and author_id=authorId;
    else
        delete from author_post where post_id=inputPostid and author_id=authorId;
        delete from post where id=inputPostId;
    end if;
end
// DELIMITER ;

--반복문을 통해 post 대량생산 : title , 글쓴이email
DELIMITER //
create procedure 글도배(in count int, in inputEmail varchar(255))
begin
    declare countValue int default 0;
    declare authorId bigint;
    declare postId bigint;
    while countValue < count
        insert into post(title) values("안녕하세요");
        select id into postId from post order by id desc limit 1;
        select id into authorId from author where email = inputEmail;
        insert into author_post(author_id,post_id) values(authorId,postId);
        set countValue= countValue+1;
end
// DELIMITER ;