# SELECT
#     ID,
#     CASE
#         WHEN size_of_colony <= 100 THEN 'LOW'
#         WHEN size_of_colony > 100 AND size_of_colony <= 1000 THEN 'MEDIUM'
#         WHEN size_of_colony > 1000 THEN 'HIGH'
#     END AS SIZE
# FROM ecoli_data
# ORDER BY
#     ID

# 쿼리를 작성하는 목표, 확인할 지표 : 대장균 개체의 크기가 100이하 라면 LOW 100초과 1000이하라면 MEDIUM 1000초과라면 HIGH 라고 분류 합니다. 대장균 개체의 ID와 분류 SIZE를 출력하는 SQL
# 쿼리 계산 방법 :
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :


SELECT
    ID,
    CASE
        WHEN SIZE_OF_COLONY <= 100 THEN 'LOW'
        WHEN SIZE_OF_COLONY > 100 AND SIZE_OF_COLONY <= 1000 THEN 'MEDIUM'
        WHEN SIZE_OF_COLONY > 1000 THEN 'HIGH'
    ELSE 0
    END AS SIZE
FROM ECOLI_DATA
ORDER BY
    ID


















