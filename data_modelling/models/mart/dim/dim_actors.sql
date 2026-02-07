-- this is a dimension table for actors, it will contain the actor's name and a unique identifier for each actor.
-- It will be used to join with the bridge table to get the actor's name for each netflix title.

WITH source AS (
    SELECT TRIM(actor_name) AS actor_name
    FROM {{ ref('int_netflix') }}
),

unique_actors AS (
    SELECT DISTINCT actor_name
    FROM source
)

SELECT
    ROW_NUMBER() OVER (ORDER BY actor_name) AS actor_id,
    actor_name
FROM unique_actors

