-- This model transforms the intermediate netflix data for final consumption

WITH source AS (

SELECT
    *
FROM 
    {{ ref('int_netflix') }}

),

category AS (

SELECT 
    *
FROM
    {{ ref('dim_category') }} 
),

titles AS (

SELECT 
    *
FROM
    
      {{ ref('dim_titles') }}
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

 )


select * from unique_netflix
