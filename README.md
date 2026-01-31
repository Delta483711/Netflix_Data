# Netflix_Data


## Step 1: Get the Data
- Kaggle datasets: Search for “Netflix movies dataset” or “Netflix viewing stats.”

## Step 2: Load Data
- Load the CSV into a small cloud warehouse like Neon (which you already use) or PostgreSQL.
- This is your raw table (e.g., netflix_raw).

## Step 3: Transform & Model in DBT
- Create a DBT project
- Create models
- Add DBT tests for data quality (no nulls in key fields, ratings between 0–10, etc.)


## Step 4: Connect Power BI
- Connect Power BI to your warehouse (Neon/Postgres).
- Load the Mart Model, not the raw data.
- Create dashboards:
  - Top genres by number of movies (bar chart)
  - Average rating over years (line chart)
  - Trending shows (table with image thumbnails if available)
  - Optional: filter by release year or genre

 ## Step 5: Add Analytics or KPIs
- Total number of movies/shows.
- Percentage of movies per genre.
- Rating distribution.
- Average duration per genre.


  







