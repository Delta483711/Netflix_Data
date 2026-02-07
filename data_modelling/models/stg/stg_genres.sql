WITH source AS (
    SELECT *
    FROM {{ ref('stg_netflix') }}
)

SELECT
    s.show_id,
    TRIM(a.genre) AS genre
FROM source s
CROSS JOIN LATERAL unnest(string_to_array(s.type, ',')) AS a(genre)
