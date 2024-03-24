SELECT
    F.FLAVOR
FROM
    FIRST_HALF F
    LEFT JOIN (
        SELECT
            FLAVOR,
            SUM(TOTAL_ORDER) AS TOTAL_ORDER_SUM
        FROM
            JULY
        GROUP BY
            FLAVOR
    ) J ON F.FLAVOR = J.FLAVOR
GROUP BY
    F.FLAVOR
ORDER BY
    SUM(F.TOTAL_ORDER + COALESCE(J.TOTAL_ORDER_SUM, 0)) DESC
LIMIT
    3;

-- 
SELECT
    h.FLAVOR
FROM
    FIRST_HALF h
    JOIN JULY j ON h.FLAVOR = j.FLAVOR
GROUP BY
    h.FLAVOR
ORDER BY
    SUM(h.TOTAL_ORDER + j.TOTAL_ORDER) DESC
LIMIT
    3;