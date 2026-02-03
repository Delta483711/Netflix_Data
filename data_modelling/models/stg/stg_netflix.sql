
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

deduped AS (

    -- Deduplicate rows by show_id, keeping the latest release_date first
    SELECT *
    FROM {{ deduplicate('source', 'show_id', 'release_date desc, title desc') }}

)

SELECT *
FROM deduped;