--  bridge table to link the genre dimension to the netflix fact table

WITH source AS (

SELECT
    *   
FROM
     {{ ref('int_netflix') }}   

),

actors AS (
SELECT
    *   
FROM    
    {{ ref('dim_genre') }}
)

SELECT
    s.id,
    a.genre_id
FROM source s
JOIN actors a
    ON s.genre = a.genre