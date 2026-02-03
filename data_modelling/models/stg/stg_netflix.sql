-- SQL file for the stg_netflix model.
-- This model extracts and cleans data from the raw Netflix dataset.

WITH raw_netflix AS (

SELECT 
    "Show_Id" AS show_id, 
    COALESCE("Category", 'Unknown') AS category,
    COALESCE("Title", 'Unknown') AS title,
    COALESCE("Director", 'Unknown') AS director,
    COALESCE("Cast", 'Unknown') AS actors,
    COALESCE("Country", 'Unknown') AS country,
    "Release_Date" AS release_date,
    COALESCE("Rating", 'Unknown') AS rating,
    COALESCE("Duration", 'Unknown') AS duration,
    COALESCE("Type", 'Unknown') AS type,
    COALESCE("Description", 'Unknown') AS description,
    null AS TestColumn    
FROM 
    raw."NetflixData"
)

SELECT * FROM raw_netflix


