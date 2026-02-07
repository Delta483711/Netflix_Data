-- INT model for Netflix data, transforming and cleaning the data from the staging layer
WITH Filtered_Netflix AS (
SELECT 
    *
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

SELECT * FROM UpdateDuration