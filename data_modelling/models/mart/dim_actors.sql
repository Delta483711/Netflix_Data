-- this is a dimension table for actors, it will contain the actor's name and a unique identifier for each actor.
-- It will be used to join with the bridge table to get the actor's name for each netflix title.

WITH source AS (
SELECT
    *
FROM
     {{ ref('int_netflix') }}
),

actors AS (
SELECT
    row_number() OVER () AS actor_id,  -- generate a unique ID
    actor AS actor_name
FROM    
    source 

)

SELECT
    actor_id,
    TRIM(actor_name) AS actor_name
FROM
     actors



