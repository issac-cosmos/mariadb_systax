--inner join
--두 테이블 사이에 지정된 조건에 맞는 레코드만 반환. on 조건을 통해 교집합 찾기
select * from post p inner join author a on p.author_id=a.id;
--출력순서만 달라질뿐 조회결과는 유사
select * from author a inner join post p on p.author_id=a.id;
--글쓴이가 있는 글목록과 글쓴이의 이메일을 출력하시오.
--post의 글쓴이가 없는데이터는 포함x, 글쓴이중에 글을 한번도 안쓴사람은 포함x
select p.*,a.email from post p inner join author a on p.author_id=a.id;

--모든 글목록을 출력하고 ,만약애 글쓴이가 있다면 이메일정볼르 출력
--글을 한번도 안쓴 글쓴이는 정보 포함 x
select p.*,a.email from post p left join author a on p.author_id=a.id;

--글쓴이를 기준으로 left join 할경우, 글쓴이가 n개의 글을 쓸수았으므로 같은 글쓴이가 여러번 출력
--author와 post가 1:n 관계이므로.
--글쓴이가 없는글은 포함 x
select * from author a left join post p on p.author_id=a.id;
--실습) 글쓴이가있는 글 중에서 글의 title과 저자의 email만을 출력하되,
--저자의 나이가 30세 이상인 글만 출력

select p.title, a.email from author a inner join post p on p.author_id=a.id where a.age >=30;

--글의 내용과 글의 저자의 이름이있는 글 목록을 출력하되 ,
--2024-06이후에 만들어진 글만 출력
select p.* from post p left join

--프로그래머스 -조건에 맞는 도서와 저자 리스트 출력
SELECT b.BOOK_ID,a.AUTHOR_NAME,date_format(b.PUBLISHED_DATE,'%y-%m-%d' ) from BOOK b inner join AUTHOR a
on b.AUTHOR_ID=a.AUTHOR_ID where CATEGORY='경제' oder by b.PUBLISHED_DATE;
--수정해야함

--union : 두 테이블의 select결과를 횡으로 결합(기본적으로 distinct 적용)
--컬럼의 개수와 컬럼의 타입이 같아야함에 유의
--union all: 중복까지 모두 포함
select name, email from author union select title,content from post;

--서브쿼리 : select문 안에 또다른 select문을 서브 쿼리라 한다
--where절 안에 서브쿼리
--한번이라도 글을 쓴 author목록 조회
select distinct a.* from post p inner join author a on p.author_id=a.id;
select * from author a where id in (select author_id from post);
--select절 안에 서브쿼리
--author의 email과 author별로 본인이 쓴 글의 개수를 출력
select a.email, (select count(*) from post where author_id=a.id) from author a;

--from절 안에 서브쿼리
select a.name from (select * from author) as a;

--프러그래머스) 없어진 기록 찾기
SELECT ANIMAL_OUTS.ANIMAL_ID,ANIMAL_OUTS.NAME from ANIMAL_OUTS where ANIMAL_ID not in (select ANIMAL_ID from ANIMAL_INS) ;
--서브쿼리, join


--집계함수
--null은 count()함수에서 제외
select count(*) from author;
select sum(price) from post;
select avg(price) from post;
-- 소수점 첫번쨰자리에서 반올림해서 소수점을 없앰
select round(avg(price), 0) from post;


--group by : 그룹화된 데이터를 하나의 행(row)처럼 취급.
--author_id로 그룹핑 하였으면, 그외의 컬럼을 조회하는것은 적절치 않음.
select author_id from post group by author_id;
--group by와 집계함수
-- 아래 쿼리에서 *은 그룹화된 데이터내에서의 개수
select author_id, count(*) from post group by author_id;
select author_id, count(*), sum(price) from post group by author_id;


--author의 email과 author별로 본인이 쓴 글의 개수를 출력
select a.email, (select count(*) from post where author_id=a.id) from author a;
--join과 group by, 집계함수 활용한 글의 개수 출력
select a.email, count(p.author_id) from author a left join post p on a.id=p.author_id
group by a.id;--group by 뒤에 a.email 이 더좋을듯하다.

--where와 proup by
--연도별 post 글의 개수 출력, 연도가 null인 값은 제외
select date_format(created_time ,'%y') as year , count(author_id) 
from post where post.created_time is not null group by year;

--프로그래머스 문제
--자동차 종류별 특정 옵션이 포함된 자동차수 구하기
--입양시각구하기

--having : group by를 통해 나온 집계값에 대한 조건
--글을 2개 이상 쓴사람에 대한 정보조회
select author_id from post group by author_id having count(*)>=2;
select author_id count(*) as count from post group by author_id having count>=2;

--동명동물수찾기

--다중열 group by 
--post에서 작성자가 만든 제목의 개수를 출력하시오
select author_id,title, count(*) from post group by author_id, title;

--재구매가 일어난 상품과 회원라스트 구하기

