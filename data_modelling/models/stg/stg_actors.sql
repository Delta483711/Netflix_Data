WITH source AS (
    SELECT *
    FROM {{ ref('stg_netflix') }}
)

SELECT
    s.id,
    TRIM(a.actor_name) AS actor_name
FROM source s
CROSS JOIN LATERAL unnest(string_to_array(s.actors, ',')) AS a(actor_name)
