-- This model transforms the intermediate netflix data for final consumption

WITH source AS (

SELECT 
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

category AS (

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
    f.category
FROM 
    source AS f

 ),

join_titles AS (
SELECT
    f.id,
    f.duration_min,
    f.duration_season,
    f.category,
    t.title_id
FROM 
    unique_netflix AS f
LEFT JOIN titles AS t
    ON f.id = t.id  
),

join_category AS (
SELECT
    f.id,
    f.duration_min,
    f.duration_season,
    f.title_id,
    f.category,
    c.category_id
FROM join_titles AS f
LEFT JOIN category AS c
    ON f.category = c.category_name
),

join_actors AS (
SELECT
    f.id,
    f.duration_min,
    f.duration_season,
    f.title_id,
    f.category,
    f.category_id,
    a.actor_id
FROM 
    join_category AS f
LEFT JOIN actors AS a
    ON f.id = a.id  
),

join_genres AS (
SELECT 
    f.id,
    f.duration_min,
    f.duration_season,
    f.title_id,
    f.category,
    f.category_id,
    f.actor_id,
    g.genre_id
FROM 
    join_actors AS f
LEFT JOIN genres AS g
    ON f.id = g.id
)

SELECT
    id,
    duration_min,
    duration_season,
    title_id,
    category_id,
    actor_id,
    genre_id
FROM
    join_genres
