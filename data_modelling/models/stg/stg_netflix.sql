

-- SQL file for the stg_netflix model
-- This model extracts and cleans data from the raw Netflix dataset

WITH raw_netflix AS (

SELECT 
    show_id as Id,
    Category,
    title,
    director,
    cast,
    country,
    release_added,
    rating,
    duration,
    type, 
    description
FROM 
    raw.netflix_data
)

SELECT * FROM raw_netflix;


