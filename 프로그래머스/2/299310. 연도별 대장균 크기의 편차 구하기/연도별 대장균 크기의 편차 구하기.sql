# 쿼리를 작성하는 목표, 확인할 지표 : 분화된 연도별(YEAR)  대장균 크기의 편차(YEAR_DEV) 대장균의 개체의 ID를 출력하는 SQL 문 작성        연도별 가장큰 대장균의 크기 - 각 대장균의 크기
# 쿼리 계산 방법 : DATE에서 YEAR만 추출하고 MAX(SIZE_OF_COLONY) 를 구하여 년도별 가장 큰 대장균의 크기 테이블을 만든후 기존 ECOLI_DATA 테이블과 YEAR JOIN 하여 SIZE_OF_COLONY 와 MAX(SIZE_OF_COLONY) 를 빼서 결과를 구한다.
# 데이터의 기간 : diffrentiation_date
# 사용할 테이블 : ecoli_date
# Join KEY : x
# 데이터 특징 : x
# YEAR | YEAR_DEV | ID

# WITH MAX_SIZE_OF_COLONY_YEAR AS (
#     SELECT
#         EXTRACT(YEAR FROM DIFFERENTIATION_DATE) AS YEAR,
#         MAX(SIZE_OF_COLONY) AS MAX_COLONY
#     FROM ECOLI_DATA
#     GROUP BY
#         EXTRACT(YEAR FROM DIFFERENTIATION_DATE)
# )
# SELECT
#     M.YEAR,
#     M.MAX_COLONY - E.SIZE_OF_COLONY AS YEAR_DEV,
#     E.ID
# FROM MAX_SIZE_OF_COLONY_YEAR AS M
# INNER JOIN ECOLI_DATA AS E
# ON M.YEAR = EXTRACT(YEAR FROM E.DIFFERENTIATION_DATE)
# ORDER BY
#     YEAR,
#     YEAR_DEV
# 쿼리를 작성하는 목표, 확인할 지표 : 분화된 연도별 가장큰 대장균의 크기, ID별 연도별 대장균의 크기의 편차
# 쿼리 계산 방법 : 연도별 가장 대장균의 크기가 큰 것을 구해주고 서브쿼리로 만든 다음 기본 테이블과 조인하여 뺼셈하여 편차 구하기
# 쿼리 결과 : YEAR | YEAR_DEV | ID
# 데이터의 기간 : x
# 사용할 테이블 : ECOLI_DATA
# Join KEY :
# 데이터 특징 : 부모 자식 관계

WITH YEAR_MAX_SIZE AS (
    SELECT
        EXTRACT(YEAR FROM DIFFERENTIATION_DATE) AS YEAR,
        MAX(SIZE_OF_COlONY) AS MAX_SIZE
    FROM ECOLI_DATA
    GROUP BY
        EXTRACT(YEAR FROM DIFFERENTIATION_DATE)
), T_DATE_TO_YEAR AS (
    SELECT
        ID,
        SIZE_OF_COLONY,
        EXTRACT(YEAR FROM DIFFERENTIATION_DATE) AS YEAR
    FROM ECOLI_DATA
)
SELECT
    T.YEAR,
    (Y.MAX_SIZE - T.SIZE_OF_COLONY) AS YEAR_DEV,
    T.ID
FROM YEAR_MAX_SIZE AS Y
INNER JOIN T_DATE_TO_YEAR AS T
ON Y.YEAR = T.YEAR
ORDER BY
    YEAR,
    YEAR_DEV













