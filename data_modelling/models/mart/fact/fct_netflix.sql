-- This model transforms the intermediate netflix data for final consumption

WITH source AS (

SELECT DISTINCT
    *
FROM 
    {{ ref('int_netflix') }}

)

SELECT
*
 FROM source
 