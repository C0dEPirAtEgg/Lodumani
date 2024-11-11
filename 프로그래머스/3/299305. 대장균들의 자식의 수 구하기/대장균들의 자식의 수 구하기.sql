SELECT
    e1.ID,
    IFNULL(COUNT(e2.ID),0) AS CHILD_COUNT
FROM ecoli_data AS e1
LEFT JOIN ecoli_data AS e2
ON e1.ID = e2.parent_id
GROUP BY
    e1.ID