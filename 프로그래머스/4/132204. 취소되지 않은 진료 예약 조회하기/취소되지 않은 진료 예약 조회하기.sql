# 쿼리를 작성하는 목표, 확인할 지표 : PATIENT, DOCTOR, APPOINTMENT 테이블에서 2022년 4월 13일 취소되지 않은 흉부외과(CS)          진료 예약 내역을 조회하는 SQL문을 작성해주세요. 진료예약번호, 환자이름, 환자번호, 진료과코드, 의사이름, 진료예약 일시 항목이 출력
# 쿼리 계산 방법 :
# 쿼리 결과 : 진료예약번호 | 환자이름 | 환자번호 | 진료과 코드 | 의사이름 | 진료예약일시
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :

WITH CTE1 AS (
    SELECT
        *
    FROM APPOINTMENT
    WHERE
        1=1
        AND DATE(APNT_YMD) = '2022-04-13'
        AND MCDP_CD = 'CS'
        AND APNT_CNCL_YN = 'N'
)
SELECT
    C.APNT_NO,
    P.PT_NAME,
    P.PT_NO,
    C.MCDP_CD,
    D.dR_NAME,
    C.APNT_YMD
FROM CTE1 AS C
INNER JOIN PATIENT AS P
ON C.PT_NO = P.PT_NO
INNER JOIN DOCTOR AS D
ON C.MDDR_ID = D.DR_ID
ORDER BY
    C.APNT_YMD
