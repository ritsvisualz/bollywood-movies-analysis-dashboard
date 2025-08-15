#  Movie Analytics Project

##  Project Overview
This project performs **end-to-end movie data analysis** using SQL, Jupyter Notebook, and Power BI.  
We extract, clean, analyze, and visualize data to gain insights about movie performance, genres, and ratings.

##  Tech Stack
- **SQL (PostgreSQL)** → Data extraction & transformation  
- **Jupyter Notebook (Python, Pandas, Matplotlib)** → Data analysis & insights  
- **Power BI** → Interactive dashboard creation  

##  Workflow
1. **Data Extraction**  
   - Imported raw datasets into PostgreSQL  
   - Created tables and relationships  
   - Cleaned and filtered data using SQL queries  

2. **Data Analysis**  
   - Used Python (Pandas, NumPy) for exploratory data analysis  
   - Generated insights such as top-rated movies, popular genres, and revenue trends  

3. **Dashboard Creation**  
   - Built an interactive Power BI dashboard  
   - Visuals include:
     - Top 10 highest-rated movies
     - Movie count by genre
     - Average rating by release year
     - Revenue by director

## Dashboard Preview
![Dashboard](dashboard/screenshots/dashboard_overview.png)

##  Folder Contents
- `data/` → Contains datasets  
- `sql/` → SQL scripts for table creation, data insertion, and analysis queries  
- `notebooks/` → Jupyter Notebook for detailed analysis  
- `dashboard/` → Power BI `.pbix` file and screenshots  

##  How to Run
1. Clone this repository  
2. Import `create_tables.sql` and `insert_data.sql` into PostgreSQL  
3. Run analysis queries from `analysis_queries.sql`  
4. Open `analysis.ipynb` to see Python analysis  
5. Open `movie_insights.pbix` in Power BI for the dashboard

## Key Insights
- **Drama** and **Action** genres dominate top ratings.  
- Directors with consistent high-rated movies also generate higher revenue.  
- Average ratings peaked between **2005–2015**.  

