-- This model transforms the intermediate netflix data for final consumption


SELECT 
    f.show_id,
    f.duration_min,
    f.duration_season,
    f2.category_id,
    f3.title_id,
    f4.actor_id
    
FROM 
    {{ ref('int_netflix') }} AS f
LEFT JOIN {{ ref('dim_category') }} AS f2
        on f.category = f2.category_name    
LEFT JOIN {{ ref('dim_titles') }} AS f3
        on f3.title = f.title
LEFT JOIN {{ ref('dim_actors') }} AS f4
        ON f4.actor_name = ANY(string_to_array(f.actors, ','))