--case문
select 컬럼1,컬럼2,컬럼3,컬럼,
--if(컬럼4==비교값1){결과값1출력}else if(컬럼4==비교값2){결과값2출력}else{결과값2출력}
case 컬럼4
 when 비교값1 then 결과값1
 when 비교값2 then 결과값2
 else 결과값3
end
from 테이블명;


select id, email,
case name  
    when name is null then '익명사용자'
    else name
end as '사용자명'
from author;

--ifnull(a , b) : 만약에 a가 null이면 b반환, null아니면 b반환
select id, email, ifnull(name, '익명사용자') as '사용자명' from author;

--경기도에 위치한 식품창고 목록 출력하기

--if(a,b,c) : a조건이 참이면 b반환 , a조건이 거짓이면 c반환
select id, email, if(name is null, '익명사용자', name) as '사용자명' from author;

--조건에 부합하는 중고거래 상태 조회하기
SELECT  BOARD_ID,WRITER_ID,TITLE, PRICE,
case STATUS
 when SALE then '판매중'
 when RESERVED then '예약중'
else '거래완료'
end
from USED_GOODS_BOARD where// orderby desc  --답아님 이런 형태임
--12세 이하인 여자 환자 목록 출력하기
select ~~ ifnull~
from ~~ where ~~ and ~~order by~
