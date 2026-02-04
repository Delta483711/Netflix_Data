
SELECT 
    row_number() OVER () AS actor_id,  -- generate a unique ID
    SPLIT(actor, ',')  AS actor_name
FROM (
    SELECT DISTINCT 
        actor_name   
    FROM 
        {{ ref('int_netflix') }}
) t 
