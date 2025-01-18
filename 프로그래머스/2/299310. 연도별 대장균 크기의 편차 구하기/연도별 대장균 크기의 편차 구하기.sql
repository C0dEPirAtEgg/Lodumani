# 쿼리를 작성하는 목표, 확인할 지표 : 분화된 연도별(YEAR)  대장균 크기의 편차(YEAR_DEV) 대장균의 개체의 ID를 출력하는 SQL 문 작성        연도별 가장큰 대장균의 크기 - 각 대장균의 크기
# 쿼리 계산 방법 : 
# 데이터의 기간 : diffrentiation_date
# 사용할 테이블 : ecoli_date
# Join KEY : x
# 데이터 특징 : x
# YEAR | YEAR_DEV | ID

WITH MAX_SIZE_OF_COLONY_YEAR AS (
    SELECT
        EXTRACT(YEAR FROM DIFFERENTIATION_DATE) AS YEAR,
        MAX(SIZE_OF_COLONY) AS MAX_COLONY
    FROM ECOLI_DATA
    GROUP BY
        EXTRACT(YEAR FROM DIFFERENTIATION_DATE)
)
SELECT
    M.YEAR,
    M.MAX_COLONY - E.SIZE_OF_COLONY AS YEAR_DEV,
    E.ID
FROM MAX_SIZE_OF_COLONY_YEAR AS M
INNER JOIN ECOLI_DATA AS E
ON M.YEAR = EXTRACT(YEAR FROM E.DIFFERENTIATION_DATE)
ORDER BY
    YEAR,
    YEAR_DEV

