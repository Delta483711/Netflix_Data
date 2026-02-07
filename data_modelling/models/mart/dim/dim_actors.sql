-- this is a dimension table for actors, it will contain the actor's name and a unique identifier for each actor.
-- It will be used to join with the bridge table to get the actor's name for each netflix title.

WITH source AS (
    SELECT DISTINCT TRIM(actor_name) AS actor_name
    FROM {{ ref('stg_actors') }}
    WHERE TRIM(actor_name) <> ''
)

SELECT
    ROW_NUMBER() OVER (ORDER BY actor_name) AS actor_id,
    actor_name
FROM source
