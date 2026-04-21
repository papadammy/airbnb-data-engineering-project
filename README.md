Airbnb Data Engineering Pipeline & Analytics Dashboard

Data Source: Airbnb Market Data: Europe 373 Cities 
Link: <https://www.kaggle.com/datasets/jasonairroi/airbnb-market-data-europe>

Project Overview
This project builds a complete end-to-end data pipeline to analyze Airbnb listing performance across different locations, pricing tiers, and room types.

Project Goal
Understand what drives Airbnb revenue and occupancy and present those insights through a clean, interactive dashboard.

Problem Statement
Airbnb hosts and analysts often ask:
* Do higher-priced listings perform better?
* Which cities generate the most revenue?
* What room types are most profitable?
* How does revenue change over time?
This project transforms raw Airbnb data into structured, analysis-ready datasets and builds a dashboard that makes these insights easy to understand.

Architecture

        Parquet Files (Dataset)
                ↓
        Google Cloud Storage (Data Lake)
                ↓
        BigQuery (Raw Tables)
                ↓
        Transformations (SQL via Kestra)
                ↓
   dim_listings / fact_rates / fct_listing_performance
                ↓
        Looker Studio Dashboard

Tech Stack
Component	Tool
Cloud Platform	GCP
Data Lake	Google Cloud Storage
Data Warehouse	BigQuery
Infrastructure as Code	Terraform
Ochestration	Kestra
Transformation	SQL
Visualization	Looker Studio


Pipeline Design and Process
This is a batch pipeline, executed on demand or on schedule.

1. Data Ingestion
Raw Airbnb data stored as Parquet files was loaded into BigQuery as:
  * listings_raw
  * past_rates_raw

2. Data Transformation
Three main tables were created:
•	dim_listings

 Cleaned listing-level data includes:
* location (city, country)
* room type
* pricing category
I handled missing values (e.g. unknown room types by assigning them the value of “unknown”).

•	fact_rates
This time-series performance data includes:
  * revenue
  * occupancy
  * booking behavior
I partitioned the table by date and clustered for performance.

•	fct_listing_performance
This is an aggregated performance table which includes:
  * total revenue
  * average occupancy
  * pricing metrics

3. Orchestration
All transformations are automated using Kestra and it includes
* Multi-step DAG
* Executes SQL transformations in sequence
* Rebuilds tables on each run
* Can be scheduled (daily)

4. Dashboard
The dashboard is built in Looker Studio and structured into two pages:
Page 1: Performance Overview
This provides a high-level summary as follows:
* Revenue by country and city
* Revenue trend over time
* Revenue by room type
* Price category distribution

Page 2 - Listing Insights
This provides deeper analysis:
* Price vs occupancy (scatter plot)
* Occupancy by room type
* Price by room type

5. Key Insights
* Most listings are priced in the lower range but still achieve high occupancy
* There is no strong correlation between price and occupancy
* Entire homes dominate both pricing and revenue
* A small number of high-priced listings perform exceptionally well
* Revenue is driven by a balance of price × occupancy

6. Data Quality Handling
* Missing room_type values were replaced with "unknown"
* Invalid or zero pricing values were filtered in visualizations
* Data types were standardized using SAFE_CAST

7. How to Run the Project
 1. Clone the repository

git clone <https://github.com/papadammy/airbnb-data-engineering-project>
cd airbnb-project

2. Set up Terraform

cd terraform
terraform init
terraform apply

3. Authenticate with GCP

gcloud auth application-default login

4. Run Kestra

docker run --pull=always --rm -it -p 8080:8080 \
  --user=root \
  -e GOOGLE_APPLICATION_CREDENTIALS=/app/adc.json \
  -v $HOME/.config/gcloud/application_default_credentials.json:/app/adc.json:ro \
  -v kestra_data:/app/storage \
  -v kestra_db:/app/data \
  -v /var/run/docker.sock:/var/run/docker.sock \
  kestra/kestra:latest server local

5. Execute the pipeline

* Open: http://localhost:8080
* Upload the YAML flow
* Click Execute

6. Open dashboard
Looker Studio Dashboard link: <https://datastudio.google.com/s/mPed-xz3Fe8>
* Connect Looker Studio to BigQuery
* Load fct_listing_performance and fact_rates
* View the dashboard

Reproducibility
This project is fully reproducible:
* Infrastructure defined with Terraform
* Data pipeline defined in Kestra
* SQL transformations version-controlled
* Dashboard connected directly to warehouse

What This Project Demonstrates
* Building an end-to-end data pipeline
* Designing a star schema (dim/fact model)
* Using BigQuery efficiently (partitioning + clustering)
* Automating workflows with orchestration
* Turning raw data into business insights
