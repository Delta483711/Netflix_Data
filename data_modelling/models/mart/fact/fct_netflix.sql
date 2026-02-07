-- This model transforms the intermediate netflix data for final consumption

WITH source AS (

SELECT DISTINCT
    *
FROM 
    {{ ref('int_netflix') }}

),

titles AS (

SELECT 
    *
FROM
    {{ ref('dim_titles') }}
),

categories AS (

SELECT 
    *
FROM
    {{ ref('dim_category') }} 
),

actors AS (

SELECT
    *       
FROM
    {{ ref('bridge_actor') }}

),

genres AS ( 

SELECT
    *   
FROM
    {{ ref('bride_genre') }}  
),


unique_netflix AS (

SELECT DISTINCT
    f.id,
    f.duration_min,
    f.duration_season,
    f.rating,
    f.country,
    f.category

FROM 
    source AS f

 ),

join_titles AS (

SELECT
    f.id,
    f.duration_min,
    f.duration_season,
    f.rating,
    f.country,
    f.category,
    t.title_id
FROM
    unique_netflix AS f
LEFT JOIN titles AS t
    ON f.id = t.id  
),

join_categories AS (
SELECT
    j.id,
    j.duration_min,
    j.duration_season,
    j.rating,
    j.country,
    j.category,
    j.title_id,
    c.category_id
from 
    join_titles AS j
LEFT JOIN categories AS c
    ON j.category = c.category_name
),  

join_actors AS (
SELECT
    j.id,
    j.duration_min,
    j.duration_season,
    j.rating,
    j.country,
    j.title_id,
    j.category_id,
    a.actor_id  
FROM
    join_categories AS j
LEFT JOIN actors AS a
    ON j.id = a.id
),  
join_genres AS (
SELECT      
    j.id,
    j.duration_min,
    j.duration_season,
    j.rating,
    j.country,
    j.title_id,
    j.category_id,
    j.actor_id,
    g.genre_id  
FROM
    join_actors AS j    
LEFT JOIN genres AS g
    ON j.id = g.id  
)

SELECT * FROM join_genres


