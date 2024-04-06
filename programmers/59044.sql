SELECT
    i.NAME,
    i.DATETIME
FROM
    ANIMAL_INS i
    LEFT JOIN ANIMAL_OUTS o ON i.ANIMAL_ID = o.ANIMAL_ID
WHERE
    o.ANIMAL_ID IS NULL
ORDER BY
    i.DATETIME
LIMIT
    3;

-- 
SELECT
    i.NAME,
    i.DATETIME
FROM
    ANIMAL_INS i
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            ANIMAL_OUTS o
        WHERE
            o.ANIMAL_ID = i.ANIMAL_ID
    )
ORDER BY
    i.DATETIME
LIMIT
    3;