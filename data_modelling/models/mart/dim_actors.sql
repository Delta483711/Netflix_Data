SELECT
    row_number() OVER () AS actor_id,
    actor_name
FROM (
    SELECT DISTINCT
        trim(actor_name) AS actor_name
    FROM {{ ref('int_netflix') }},
    unnest(string_to_array(actors, ',')) AS actor_name
    WHERE actors IS NOT NULL
) t
