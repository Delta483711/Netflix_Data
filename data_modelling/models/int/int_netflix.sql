-- INT model for Netflix data, transforming and cleaning the data from the staging layer

WITH Filtered_Netflix AS (
    SELECT *
    FROM {{ ref('stg_netflix') }}
)

SELECT
    id,
    category,
    title,
    director,
    country,
    release_date,
    rating,
    original_duration,
    COALESCE(duration_min, 0) AS duration_min,
    COALESCE(duration_season, 0) AS duration_season,
    type,
    description
FROM 
    netflix_with_genres
