# WITH ABC AS (
#     SELECT
#         i1.ITEM_ID
#     FROM item_tree AS i1
#     LEFT JOIN item_tree AS i2
#     ON i1.PARENT_ITEM_ID = i2.ITEM_ID
#     WHERE
#         1=1
#         AND i2.ITEM_ID IS NOT NULL
# )
# SELECT
#     AB.item_id,
#     AB.item_name,
#     AB.rarity
# FROM item_info AS AB
# INNER JOIN ABC AS AB1
# ON AB.item_id = AB1.item_id
# ORDER BY
#     AB.item_id DESC

# 쿼리를 작성하는 목표, 확인할 지표 : 아이템의 희귀도가 RARE인 아이템들의 모든 다음 업그레이드 아이템의 아이템 ID 아이템 명 아이템 희귀도를 출력해주세요.
# 쿼리 계산 방법 :
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :


SELECT
    IT2.ITEM_ID,
    II2.ITEM_NAME,
    II2.RARITY
FROM ITEM_TREE AS IT1
LEFT JOIN ITEM_TREE AS IT2
ON IT1.ITEM_ID = IT2.PARENT_ITEM_ID
LEFT JOIN ITEM_INFO AS II1
ON IT1.ITEM_ID = II1.ITEM_ID
LEFT JOIN ITEM_INFO AS II2
ON IT2.ITEM_ID = II2.ITEM_ID
WHERE
    1=1
    AND II1.RARITY = 'RARE'
    AND IT2.ITEM_ID IS NOT NULL
ORDER BY
    IT2.ITEM_ID DESC















