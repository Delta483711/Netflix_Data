
WITH Filtered_Netflix AS (
SELECT 
    CAST(TRIM(show_id, 's') AS INT ) AS show_id,
    category,
    title,
    director,
    actors,
    country,
    CAST(release_date AS DATE) AS release_date,
    rating,
    CASE
        WHEN duration like '%min%'
            THEN CAST(regexp_replace(duration, '[^0-9]', '', 'g') AS INT)
        END AS duration_min,
    CASE
        WHEN duration ilike '%season%'
            THEN CAST(regexp_replace(duration, '[^0-9]', '', 'g') AS INT)
        END AS duration_season
    type,
    description
FROM
     {{ ref('stg_netflix') }} 

),

UpdateDuration AS (
SELECT 
    show_id,
    category,
    title,
    director,
    actors,
    country,
    release_date,
    rating,
    COALESCE(duration_min, 0) AS duration_min,
    COALESCE(duration_season, 0) AS duration_season,
    type,
    description

FROM
    Filtered_Netflix
)

SELECT * FROM UpdateDuration;