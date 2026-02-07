-- dim_titles.sql
WITH distinct_titles AS (
    SELECT DISTINCT
        id,
        title,
        description,
        release_date,
        rating,
        country
    FROM {{ ref('int_netflix') }}
)

SELECT
    row_number() OVER () AS title_id,  -- unique numeric ID
    id,
    title as title_name,
    description,
    release_date,
    rating,
    country
FROM distinct_titles
