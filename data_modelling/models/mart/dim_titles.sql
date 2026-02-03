-- dim_titles.sql
WITH distinct_titles AS (
    SELECT DISTINCT
        show_id,
        title,
        description,
        release_date
    FROM {{ ref('int_netflix') }}
)

SELECT
    row_number() OVER () AS title_id,  -- unique numeric ID
    show_id,
    title,
    description,
    release_date
FROM distinct_titles
