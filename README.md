# ETL_project_T7
ETL project repository
Team name “Team 7 Phil”

Team Members: Damiso Hutchinson, Harsha Vinoy, Corey Anderson, Matthew Kenney, Eric Shadle

Project Title: “Essential Database for Bootcampers” (EDB)

Description: The goal of this project was to create a useful geodatabase (at the level of US states) for boot campers looking for data science or analytics jobs in the USA. We combined five data sources into a relational database (postgreSQL) with five tables: housing, ds_jobs, breweries, salary, and state_boundary. We have provided a notebook file with an example workflow in Python using sqlalchemy, pandas, geopandas, and matplotlib to query the database and make a corresponding map of the output (see example map, below). 

All tables contain the column ‘state’ with the standard two-letter, uppercase acronym for US state (e.g., ‘CA’ for California and ‘GA’ for Georgia).
The housing and state_boundary tables each have 51 rows, representing the 50 US states plus the District of Columbia. In other columns with ‘state’, there is a many-to-one relationship with rows in the ‘state’ column of housing (and state_boundary).
The state_boundary table contains a geometry column containing the wkt-formatted vector boundary.
After importing from postgreSQL, you can transform the DataFrame back into a GeoDataFrame by re-assigning the shapely geometry (where df is a placeholder for the name of your DataFrame containing the geometry column):
> df['geometry'] = df['geometry'].apply(wkt.loads)
> gdf = geopd.GeoDataFrame(df, geometry = 'geometry')


See the Documentation word doc for more explanations and step by step ETL process

