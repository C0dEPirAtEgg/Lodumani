# 쿼리를 작성하는 목표, 확인할 지표 : USED_GOODS_BOARD 와 USED_GOODS_FILE 테이블에서 조회수가 가장 높은 중고거래 게시물에 대한 첨부 파일 경로를 조회하는 SQL문을 작성
# 쿼리 계산 방법 :
# 쿼리 결과 : /home/grep/src/B0001/IMG_000001photo1.jpg
# 데이터의 기간 :
# 사용할 테이블 :
# Join KEY :
# 데이터 특징 :

WITH MAX_VIEW AS (
    SELECT
        BOARD_ID
    FROM USED_GOODS_BOARD
    WHERE
        1=1
        AND VIEWS = (SELECT
                        MAX(VIEWS)
                    FROM USED_GOODS_BOARD)
)
SELECT
    CONCAT('/home/grep/src/',U.BOARD_ID,'/',U.FILE_ID,U.FILE_NAME,U.FILE_EXT) AS FILE_PATH
FROM MAX_VIEW AS M
INNER JOIN USED_GOODS_FILE AS U
ON M.BOARD_ID = U.BOARD_ID
ORDER BY
    U.FILE_ID DESC