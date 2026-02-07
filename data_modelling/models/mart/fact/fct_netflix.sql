-- This model transforms the intermediate netflix data for final consumption

WITH unique_netfixl AS (

SELECT DISTINCT
    f.id,
    f.duration_min,
    f.duration_season,
    f.rating,
    f.country

FROM 
    {{ ref('int_netflix') }} AS f

 )

SELECT * FROM unique_netfixl