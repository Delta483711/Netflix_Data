-- Bridge table to join actor and netflix tables

WITH source AS (

SELECT
    *   
FROM
     {{ ref('stg_actors') }}   

),

actors AS (
SELECT
    *   
FROM    
    {{ ref('dim_actors') }}
)

SELECT
    s.id,
    a.actor_id
FROM source s
JOIN actors a
    ON s.actor_name = a.actor_name