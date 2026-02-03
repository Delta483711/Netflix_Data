-- SQL file for the stg_netflix model.
-- This model extracts and cleans data from the raw Netflix dataset.

WITH source AS (

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
        NULL AS TestColumn    
    FROM raw."NetflixData"

),

ranked AS (

    SELECT
        *,
        row_number() OVER (
            PARTITION BY show_id
            ORDER BY release_date DESC, title DESC
        ) AS rn
    FROM source

),

deduped AS (

    SELECT *
    FROM ranked
    WHERE rn = 1

)

SELECT *
FROM deduped


