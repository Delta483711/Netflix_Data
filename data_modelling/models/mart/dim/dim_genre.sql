-- this is the dimension table for genre, it will be used to create a relationship with the fact table

WITH source AS (
    SELECT TRIM(genre) AS genre
    FROM {{ ref('int_netflix') }}
),

unique_genres AS (
    SELECT DISTINCT genre
    FROM source
)

SELECT
    ROW_NUMBER() OVER (ORDER BY genre) AS genre_id,
    genre
FROM unique_genres

