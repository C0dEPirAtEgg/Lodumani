# 쿼리를 작성하는 목표, 확인할 지표 : 2번형질을 보유하지 않으면서 1번이나 3번형질을 보유하고있는 대장균개체수의 COUNT
# 쿼리 계산 방법 : & 비트연산자를 사용
# 데이터의 기간 : X
# 사용할 테이블 : ECLOI_DATA
# Join KEY : X
# 데이터 특징 : X
# (SIZE_OF_COLONY & 2) = 0 와 (SIZE_OF_COLONY & 2) != 2 같은 뜻이다 2가 포함되어있지않다
# (SIZE_OF_COLONY & 2) = 2 는 2가 포함되어있다.

SELECT
    COUNT(*) AS COUNT
FROM ECOLI_DATA
WHERE
    1=1
    AND (GENOTYPE & 2) != 2
    AND ((GENOTYPE & 1) >= 1 OR (GENOTYPE & 4) >= 4)
    

