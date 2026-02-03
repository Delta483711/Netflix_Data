-- This model transforms the intermediate netflix data for final consumption


SELECT 
    f.show_id,
    f.duration_min,
    f.duration_seasons,
    f2.category_id,
    f3.title_id

FROM 
    {{ ref('int_netflix') }} AS f
LEFT JOIN {{ ref('dim_category') }} AS f2
        on f.category = f2.category_name    
LEFT JOIN {{ ref('dim_titles') }} AS f3
        on f3.title = f.title