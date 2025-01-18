# SELECT
#     ED1.id,
#     ED1.parent_id,
#     ED2.id,
#     ED2.parent_id,
#     ED3.id,
#     ED3.parent_id
# FROM ECOLI_DATA AS ED1
# LEFT JOIN ECOLI_DATA AS ED2
# ON ED1.PARENT_ID = ED2.ID
# LEFT JOIN ECOLI_DATA AS ED3
# ON ED2.PARENT_ID = ED3.ID


# 쿼리를 작성하는 목표, 확인할 지표 : 3세대의 대장균의 ID를 출력하는 SQL 문을 작성해주세요. E1.ID와 E2.PARENT_ID를 LEFT JOIN하면    E1 은 부모의 테이블이 되고 E2는 자식의 테이블이 된다.
# 쿼리 계산 방법 :
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :

# SELECT
#     *
# FROM ECOLI_DATA AS E1
# LEFT JOIN ECOLI_DATA AS E2
# ON E1.ID = E2.PARENT_ID
# LEFT JOIN ECOLI_DATA AS E3
# ON E2.ID = E3.PARENT_ID
# LEFT JOIN ECOLI_DATA AS E4
# ON E3.ID = E4.PARENT_ID

# 1세대 1,2 2세대 3,4,5 3세대 6,7 4세대 8
# 한번씩 LEFT JOIN을 할때마다 1~4세대 2~4세대 3~4세대 4세대(4세대가 끝임 이 테이블에서는)


SELECT
    E3.ID
FROM ECOLI_DATA AS E1
INNER JOIN ECOLI_DATA AS E2
ON E1.ID = E2.PARENT_ID
INNER JOIN ECOLI_DATA AS E3
ON E2.ID = E3.PARENT_ID
WHERE
    1=1
    AND E1.PARENT_ID IS NULL
ORDER BY
    E3.ID

# 한번씩 INNER JOIN 을 할때마다 그 세대만 남는다