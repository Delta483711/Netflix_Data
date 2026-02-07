
SELECT
    row_number() OVER () AS category_id,  -- generate a unique ID
    category AS category_name
FROM (
    SELECT DISTINCT category
    FROM {{ ref('int_netflix') }}
) t