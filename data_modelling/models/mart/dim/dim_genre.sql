-- this is the dimension table for genre, it will be used to create a relationship with the fact table

WITH source AS (
SELECT DISTINCT
    TRIM(genre) AS genre
FROM
     {{ ref('stg_genres') }}
)

SELECT
    ROW_NUMBER() OVER (ORDER BY genre) AS genre_id,
    genre
FROM source

