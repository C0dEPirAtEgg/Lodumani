# 쿼리를 작성하는 목표, 확인할 지표 : 경제 카테고리에 속하는 도서 ID, 저자명,출판일을 출력
# 쿼리 계산 방법 : book 테이블과 author 테이블을 JOIN 하여 카테고리 검색 경제
# 데이터의 기간 : x
# 사용할 테이블 : book,author
# Join KEY : author_id
# 데이터 특징 :


SELECT
    BOOK_ID,
    AUTHOR_NAME,
    DATE_FORMAT(PUBLISHED_DATE,'%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK AS B
LEFT JOIN AUTHOR AS A
ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE
    CATEGORY = '경제'
ORDER BY
    PUBLISHED_DATE
