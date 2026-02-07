-- This model transforms the intermediate netflix data for final consumption

WITH source AS (

SELECT
    *
FROM 
    {{ ref('int_netflix') }}

),

filtered_source AS (
SELECT DISTINCT
    id,
    category,
    duration_min,
    duration_season
FROM 
    source
)

select * from filtered_source

