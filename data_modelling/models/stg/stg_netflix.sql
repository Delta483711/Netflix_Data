

-- SQL file for the stg_netflix model
-- This model extracts and cleans data from the raw Netflix dataset

WITH raw_netflix AS (

SELECT 
    "Show_Id" AS show_id, 
    "Category" AS category,
    "Title" AS title,
    COALESCE("Director", 'Unknown') AS director,
    COALESCE("Cast", 'Unknown') AS actors,
    COALESCE("Country", 'Unknown') AS country,
    "Release_Date" AS release_date,
    "Rating" AS rating,
    "Duration" AS duration,
    "Type" AS type,
    "Description" AS description    
FROM 
    raw."NetflixData"
)

SELECT * FROM raw_netflix


