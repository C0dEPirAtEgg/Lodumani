# 쿼리를 작성하는 목표, 확인할 지표 : USED_GOODS_BOARD와 USED_GOODS_USER 테이블에서 중고 거래 게시물을 3건 이상 등록한 사용자의 사용자ID, 닉네임, 전체주소, 전화번호를 조회하는 SQL문을 작성 전체주소는 시, 도로명 주소, 상세 주소가 함께 출력되도록 전화번호 같은 경우 xxx-xxxx-xxx 같은 형태로 하이픈 문자열 - 을 삽입하여 출력
# 쿼리 계산 방법 :
# 쿼리 결과 : USER_ID | NICKNAME | 전체주소 | 전화번호
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :

WITH USER_3 AS (
    SELECT
        WRITER_ID,
        COUNT(*) AS CNT
    FROM USED_GOODS_BOARD
    GROUP BY
        WRITER_ID
    HAVING
        CNT >= 3
)
SELECT
    DISTINCT
    U2.USER_ID,
    U2.NICKNAME,
    CONCAT(U2.CITY,' ', U2.STREET_ADDRESS1,' ',U2.STREET_ADDRESS2) AS '전체주소',
    CONCAT(SUBSTR(U2.TLNO,1,3),'-',SUBSTR(U2.TLNO,4,4),'-',SUBSTR(U2.TLNO,8,4)) AS '전화번호'
FROM USER_3 AS U1
INNER JOIN USED_GOODS_USER AS U2
ON U1.WRITER_ID = U2.USER_ID
ORDER BY
    U2.USER_ID DESC