# SELECT
#     e1.id,
#     e1.parent_id,
#     e2.id,
#     e2.parent_id
# FROM ecoli_data AS e1
# LEFT JOIN ecoli_data AS e2
# ON e1.ID = e2.parent_id

# 쿼리를 작성하는 목표, 확인할 지표 : 대장균 개체의 ID와 자식의 수 CHILD_COUNT 를 출력하는 SQL쿼리문 작성 자시깅 없다면 자식의 수는 0으로 출력해주세요.
# 쿼리 계산 방법 :
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :


SELECT
    E1.ID,
    COUNT(E2.ID) AS CHILD_COUNT
FROM ECOLI_DATA AS E1
LEFT JOIN ECOLI_DATA AS E2
ON E1.ID = E2.PARENT_ID
GROUP BY
    E1.ID












