-- Split the actors list into individual rows

WITH source  AS (

SELECT 
    *
FROM
     {{ ref('stg_netflix') }}
)

SELECT  
    id,
    TRIM(f.value) AS actor_name
FROM
    source
LATERAL FLATTEN(input => SPLIT(actors, ',')) f