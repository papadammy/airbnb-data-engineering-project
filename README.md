<b>Airbnb Data Engineering Pipeline & Analytics Dashboard</b><hr>

<b>Data Source: Airbnb Market Data: Europe 373 Cities</b><br> 
Link: <https://www.kaggle.com/datasets/jasonairroi/airbnb-market-data-europe>

<b>Project Overview</b><br>
This project builds a complete end-to-end data pipeline to analyze Airbnb listing performance across different locations, pricing tiers, and room types.

<b>Project Goal</b><br>
Understand what drives Airbnb revenue and occupancy and present those insights through a clean, interactive dashboard.

<b>Problem Statement</b><br>
Airbnb hosts and analysts often ask:
* Do higher-priced listings perform better?
* Which cities generate the most revenue?
* What room types are most profitable?
* How does revenue change over time?<br><br>
This project transforms raw Airbnb data into structured, analysis-ready datasets and builds a dashboard that makes these insights easy to understand.

<b>Architecture</b><br>

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

<b>Tech Stack</b><br>
Component	Tool
Cloud Platform	GCP
Data Lake	Google Cloud Storage
Data Warehouse	BigQuery
Infrastructure as Code	Terraform
Ochestration	Kestra
Transformation	SQL
Visualization	Looker Studio


<b>Pipeline Design and Process</b><br>
This is a batch pipeline, executed on demand or on schedule.

<b>1. Data Ingestion</b><br>
Raw Airbnb data stored as Parquet files was loaded into BigQuery as:<br>
  * listings_raw
  * past_rates_raw

<b>2. Data Transformation</b><br>
Three main tables were created:<br>
<b>•	dim_listings</b><br>

 Cleaned listing-level data includes:<br>
* location (city, country)
* room type
* pricing category
I handled missing values (e.g. unknown room types by assigning them the value of “unknown”).

<b>•	fact_rates</b><br>
This time-series performance data includes:<br>
  * revenue
  * occupancy
  * booking behavior
I partitioned the table by date and clustered for performance.

<b>•	fct_listing_performance</b><br>
This is an aggregated performance table which includes:<br>
  * total revenue
  * average occupancy
  * pricing metrics

<b>3. Orchestration</b><br>
All transformations are automated using Kestra and it includes<br>
* Multi-step DAG
* Executes SQL transformations in sequence
* Rebuilds tables on each run
* Can be scheduled (daily)

<b>4. Dashboard</b><br>
The dashboard is built in Looker Studio and structured into two pages:<br>

Looker Studio Dashboard link: <https://datastudio.google.com/s/mPed-xz3Fe8>
<br><br>
<b>Page 1: Performance Overview</b><br>
This provides a high-level summary as follows:<br>
* Revenue by country and city
* Revenue trend over time
* Revenue by room type
* Price category distribution

<img width="720" height="413" alt="Screenshot 2026-04-21 at 20-35-45 DataTalk_Airbnb_Data_Pipeline_Project pdf" src="https://github.com/user-attachments/assets/e441ca07-422e-4e55-a17a-8b2213c3c7d8" />


<b>Page 2 - Listing Insights</b><br>
This provides deeper analysis:<br>
* Price vs occupancy (scatter plot)
* Occupancy by room type
* Price by room type

<img width="720" height="540" alt="Screenshot 2026-04-21 at 20-37-05 DataTalk_Airbnb_Data_Pipeline_Project pdf" src="https://github.com/user-attachments/assets/f5c73ef5-bf2b-462b-9233-ef9242a00426" />


<b>5. Key Insights</b><br>
* Most listings are priced in the lower range but still achieve high occupancy
* There is no strong correlation between price and occupancy
* Entire homes dominate both pricing and revenue
* A small number of high-priced listings perform exceptionally well
* Revenue is driven by a balance of price × occupancy

<b>6. Data Quality Handling</b><br>
* Missing room_type values were replaced with "unknown"
* Invalid or zero pricing values were filtered in visualizations
* Data types were standardized using SAFE_CAST

<b>7. How to Run the Project</b><br>
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

<b>Reproducibility</b><br>
This project is fully reproducible:
* Infrastructure defined with Terraform
* Data pipeline defined in Kestra
* SQL transformations version-controlled
* Dashboard connected directly to warehouse

<b>What This Project Demonstrates</b><br>
* Building an end-to-end data pipeline
* Designing a star schema (dim/fact model)
* Using BigQuery efficiently (partitioning + clustering)
* Automating workflows with orchestration
* Turning raw data into business insights
