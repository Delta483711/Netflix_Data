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
    {{ ref('bridge_genre') }}  
),


unique_netflix AS (

SELECT DISTINCT
    f.id,
    f.duration_min,
    f.duration_season,
    f.rating,
    f.country

FROM 
    unique_netflix AS f

 ),

join_titles AS (

SELECT
    f.id,
    f.duration_min,
    f.duration_season,
    f.rating,
    f.country,
    t.title
FROM
    unique_netflix AS f
LEFT JOIN titles AS t
    ON f.id = t.id  
)

SELECT
*
FROM 
    join_titles


