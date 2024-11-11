SELECT
    ID,
    CASE
        WHEN size_of_colony <= 100 THEN 'LOW'
        WHEN size_of_colony > 100 AND size_of_colony <= 1000 THEN 'MEDIUM'
        WHEN size_of_colony > 1000 THEN 'HIGH'
    END AS SIZE
FROM ecoli_data
ORDER BY
    ID