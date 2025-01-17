-- 코드를 작성해주세요
-- 부모의 형질을 모두 보유한 대장균의 ID, 대장균의 형질, 부모대장균의 형질을 출력하는 쿼리작성
-- & 비트연산자를 사용하여 부모의 비트가 자식의 비트에 다있던가 자식의 비트가 부모의 비트에 다있는것을 확인하는것은
-- A & B = A  >>>>>> A의 비트를 B가 다가지고 있다 이렇게 표현해도된다. =B가나오면 B의 비트를 A가 다가지고 있다.
SELECT
    E2.ID,
    E2.GENOTYPE,
    E1.GENOTYPE AS PARENT_GENOTYPE
FROM ECOLI_DATA AS E1
LEFT JOIN ECOLI_DATA AS E2
ON E1.ID = E2.PARENT_ID
WHERE
    1=1
    AND (E1.GENOTYPE & E2.GENOTYPE) = E1.GENOTYPE
ORDER BY
    E2.ID