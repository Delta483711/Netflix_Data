
WITH Filtered_Netflix AS 
(
SELECT 
    show_id,
    category,
    title,
    director,
    actors,
    country,
    release_date,
    rating,
    duration,
    type,
    description
FROM
     {{ ref('stg_netflix') }}



)

SELECT * FROM Filtered_Netflix