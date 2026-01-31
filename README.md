# Netflix_Data

**Project Summary:**  
This project analyzes Netflix movies and shows by building a complete data pipeline from raw dataset ingestion to insightful dashboards. Using DBT for transformation and testing, a cloud warehouse for storage, and Power BI for visualization, this project uncovers trends in genres, ratings, durations, and content additions over time. It demonstrates skills in data modeling, analytics, and dashboard storytelling, making it a portfolio-ready example of end-to-end data analysis.

---

## Step 1: Get the Data
- **Source:** Kaggle datasets (e.g., [Netflix Movies and Shows](https://www.kaggle.com/datasets/shivamb/netflix-shows)) or other Netflix viewing stats datasets.  
- Ensure the dataset includes key fields: `title`, `release_year`, `genre(s)`, `rating`, `duration`, `country`, `actors/directors`, and `thumbnail URL` if available.

---

## Step 2: Load Data
- Load the CSV into a cloud warehouse like **Neon** or **PostgreSQL**.  
- Create a **raw table** (e.g., `netflix_raw`) with proper data types:  
  - `release_year` → `integer`  
  - `rating` → `decimal`/`float`  
  - `duration` → `integer` or `string` (normalized later)  
- Optional: create a **staging layer** (`netflix_staging`) for initial cleaning and normalization.

---

## Step 3: Transform & Model in DBT
- Create a **DBT project** connected to your warehouse.  
- **Transformations / Models:**  
  - Normalize multi-genre entries (split into separate rows)  
  - Calculate `age_of_show` = `current_year – release_year`  
  - Flag trending shows based on recent addition + high rating  
  - Create a **fact table** (e.g., `netflix_fact`) and **dimension tables** (`genre`, `actor`, `director`)  
- **DBT Tests:**  
  - No nulls in key fields  
  - Ratings between 0–10  
  - Release years are reasonable  
  - Durations positive

---

## Step 4: Connect Power BI
- Connect Power BI to the **warehouse** (Neon/Postgres).  
- Load **transformed/mart model**, not raw data.  
- **Dashboards / Visualizations:**  
  - Top genres by number of movies (bar chart)  
  - Average rating over years (line chart)  
  - Trending shows (table with image thumbnails)  
  - Top actors/directors by number of appearances (bar chart)  
  - Optional: filters/slicers for `release year`, `genre`, `rating`, `duration`

---

## Step 5: Analytics / KPIs
- Total number of movies/shows  
- Percentage of movies per genre  
- Rating distribution  
- Average duration per genre  
- Content additions over years/months  
- Percentage of high-rated content per genre  
- Optional: trend analysis for trending shows

---

## Step 6: Documentation & Reproducibility
- Include **README** with steps to install DBT, clone repo, connect to warehouse, run `dbt run` and `dbt test`.  
- Track changes in **Git** for version control.  
- Ensure dashboards are **dynamic** and easy to filter/slice for different insights.
