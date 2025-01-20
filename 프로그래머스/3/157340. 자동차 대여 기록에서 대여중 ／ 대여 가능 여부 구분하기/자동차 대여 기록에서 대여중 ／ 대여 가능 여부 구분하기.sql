# 쿼리를 작성하는 목표, 확인할 지표 : 2022년 10월 16일 대여 중인 자동차 대여중 
# 쿼리 계산 방법 : START_DATE 와 END_DATE 사이에 2022년 10월 16일 있으면 대여중 없으면 대여가능
# CAR_ID 가 있으면 CAR_ID를 기준으로 대여중, 대여가능 CASE WHEN THEN END 사용
# 데이터의 기간 :
# 사용할 테이블 : CAR_RENTAL_COMPANY_RENTAL_HISTORY
# Join KEY :
# 데이터 특징 :

-- 2022년 10월 16일에 대여 중인 자동차인 경우 '대여중' 이라고 표시 대여중이 아닌 자동차 경우 '대여가능' 을 표시하는 컬럼(AVAILABILITY)
-- 자동차 ID와 AVAILABILITY 리스트를 출력
-- 반납 날짜가 2022년 10월 16일인 경우에도 대여중 으로 표시
-- 자동차 ID를 기준으로 내림차순 정렬
-- 같은 car_id가 있으며 대여중 그리고 대여가능인 행이 여러개있음 근데 car_id중 대여가능한 

# SELECT
#     car_id,
#     IF('2022-10-16' BETWEEN start_date AND end_date, '대여중', '대여 가능') AS AVAILABILITY
# FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
# GROUP BY
#     car_id
# ORDER BY
#     car_id DESC

# 쿼리를 작성하는 목표, 확인할 지표 : 테이블에서 2022년 10월 16일에 대여중인 자동차인 경우 '대여중'이라고 표시하고 대여중이지 않은 자동차인 경우 대여가능을 표시하는 컬럼(컬럼명 : AVAILABILITY)을 추가하여 자동차 ID와 AVAILABILITY 리스틀를 출력하는 SQL 쿼리 작성 반납 날짜가 2022년 10월 16일인 경우에도 대여중으로 표시해주세요.
# 쿼리 계산 방법 : CASE WHEN
# 쿼리 결과 : CAR_ID | AVAILABILTY
# 데이터의 기간 : 2022년 10월 16일
# 사용할 테이블 : CAR_RENTAL_COMPANY_RENTAL_HISTORY
# Join KEY : x 
# 데이터 특징 : x

SELECT 
    CAR_ID,
    CASE
    WHEN MAX('2022-10-16' BETWEEN START_DATE AND END_DATE) = 1 THEN '대여중'
    ELSE '대여 가능'
    END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC