-- INT model for Netflix data, transforming and cleaning the data from the staging layer

WITH Filtered_Netflix AS (
    SELECT *
    FROM {{ ref('stg_netflix') }}
),

actors_table AS (
    SELECT *
    FROM {{ ref('stg_actors') }}
),

genres_table AS (
    SELECT *
    FROM {{ ref('stg_genres') }}
),

-- Join Netflix to actors

netflix_with_actors as (

    SELECT
        n.id,
        n.category,
        n.title,
        n.director,
        n.country,
        n.release_date,
        n.rating,
        n.original_duration,
        n.duration_min,
        n.duration_season,
        n.type,
        n.description,
        a.actor_name
    FROM 
        Filtered_Netflix AS n
    LEFT JOIN actors_table AS a 
        ON n.id = a.id
),

-- Join Netflix to genres
netflix_with_genres as (

    SELECT
        n.id,
        n.category,
        n.title,
        n.director,
        n.country,
        n.release_date,
        n.rating,
        n.original_duration,
        n.duration_min,
        n.duration_season,
        n.description,
        n.actor_name,
        g.genre
    FROM 
        netflix_with_actors AS n
    LEFT JOIN genres_table AS g 
        ON n.id = g.id
)

SELECT
    id,
    category,
    title,
    director,
    country,
    release_date,
    rating,
    original_duration,
    COALESCE(duration_min, 0) AS duration_min,
    COALESCE(duration_season, 0) AS duration_season,
    description,
    actor_name,
    genre
FROM 
    netflix_with_genres
