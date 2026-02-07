-- This model transforms the intermediate netflix data for final consumption


SELECT 
    f.title_id,
    f.duration_min,
    f.duration_season,
    f2.category_id,
    f3.title_id,
    f3.title,
    f5.actor_name

    
FROM 
    {{ ref('int_netflix') }} AS f
LEFT JOIN {{ ref('dim_category') }} AS f2
        on f.category = f2.category_name    
LEFT JOIN {{ ref('dim_titles') }} AS f3
        on f3.title = f.title
LEFT JOIN {{ref('bridge_actor')}} as f4
        on f4.title_id = f3.title_id
left join {{ref('dim_actors')}} as f5
        on f5.actor_id = f4.actor_id
