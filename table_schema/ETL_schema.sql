--=====================================================
--DS Jobs database
--=====================================================

----------
-- Tables:
----------

-- housing <- avg_housing_count.csv
-- ds_jobs  <- cleaner_job_data.csv
-- breweries <- dirty_breweries.csv
-- salary <- salary_cleaner.csv
-- state_boundary <- state_poly.csv

-- To set of the database you must run the code and use the import wizard in the correct order.
	-- For each tables, run the code for the table schema, then import the table by right clicking the table in the database.
	-- Add the keys after loading the table.

-------------------------------------------------------

DROP TABLE IF EXISTS housing;
DROP TABLE IF EXISTS ds_jobs;
DROP TABLE IF EXISTS breweries;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS state_boundary;

-------------------------------------------------------
-------------------------------------------------------

-------------
-- housing --
-------------

-- Create the housing table first!

-- Damiso

-- cleaning_house.ipynb
-- output_housing_value_by_state.csv

-- cleaner_house.ipynb # Edits: CDA
-- avg_housing_cost.csv # Use this.

CREATE TABLE housing(
	state varchar,
	average_home_price numeric
);


-- Import table using wizard: avg_housing_cost.csv

-- Then:
ALTER TABLE housing
ADD PRIMARY KEY (state);

------------------------
-- Explore housing table
SELECT * FROM housing;
------------------------

-------------------------------------------------------
-------------------------------------------------------

-----------------
---- ds_jobs ----
-----------------

-- Harsha Vinoy

-- job_postings_data.ipynb
-- clean_job_data.csv

-- job_cleaner.ipynb # Edits: CDA
-- cleaner_job_data.csv # Use this.


CREATE TABLE ds_jobs(
	job_title varchar,
 	category varchar,
 	company_name varchar,
	city varchar,
 	state varchar, 
 	post_date varchar,
	job_type varchar,
    salary_offered varchar,
	job_board varchar
);

-- Import table using wizard: cleaner_job_data.csv

---------------------------------------------------------
-- Explore ds_jobs:

SELECT * FROM ds_jobs;

-- Remember that postgresql does not like ""; use ''

SELECT * FROM  ds_jobs WHERE state = 'CA';
SELECT * FROM ds_jobs WHERE job_title = 'Data Scientist';
---------------------------------------------------------

-- Add the keys
ALTER TABLE ds_jobs
ADD COLUMN job_id serial PRIMARY KEY;

ALTER TABLE ds_jobs
ADD FOREIGN KEY (state) REFERENCES housing(state);

-------------------------------------------------------
-------------------------------------------------------

---------------
-- breweries --
---------------

-- Corey
-- source API: openbrewerydb.org/

-- breweries_5050_to_table.ipynb
-- dirty_breweries.csv # Use this


CREATE TABLE breweries(
	name varchar,
  	brewery_type varchar,
    city varchar,
    state varchar,
 	postal_code varchar,
    longitude varchar,
    latitude varchar,
    website_url varchar
);

-- Import table using wizard: dirty_breweries.csv

-- Add the keys
ALTER TABLE breweries
ADD COLUMN brew_ID serial PRIMARY KEY;

ALTER TABLE breweries
ADD FOREIGN KEY (state) REFERENCES housing(state);


-------------------------------------------------------
-------------------------------------------------------

------------
-- salary --
------------

-- Eric

-- Salary_Data_Transformation.ipynb
-- clean_salarly_data.csv

-- wage_cleaner.ipynb # Edits: CDA
-- salary_cleaner.csv # Use this


CREATE TABLE salary (
    state varchar,
    job_title varchar,
    hourly_wage_mean numeric,
    hourly_wage_median numeric,
    annual_wage_median numeric
);

-- Import using table wizard: salary_cleaner.csv

-------------------------------
-- Explore salary table:

SELECT * FROM salary
WHERE hourly_wage_mean > 30.00;
-------------------------------

-- Add the keys
ALTER TABLE salary
ADD COLUMN salary_iD SERIAL PRIMARY KEY;

ALTER TABLE salary
ADD FOREIGN KEY (state) REFERENCES housing(state);

------------------------------------------------------

-----------------
-- state_boundary
-----------------

-- Corey

-- geopandas_states.ipynb
-- state_poly.csv

CREATE TABLE state_boundary (
	state varchar,
	geometry varchar
);

-- Import table using Wizard: state_poly.csv

------------------------------
-- Explore:
	
SELECT * FROM state_boundary;
------------------------------
	
-- Add the keys	
ALTER TABLE state_boundary
ADD COLUMN oid SERIAL PRIMARY KEY;

ALTER TABLE state_boundary
ADD FOREIGN KEY (state) REFERENCES housing(state);
	
-------------------------------

	