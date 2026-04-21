provider "google" {
  project = "datatalks-airbnb-data-project"
  region  = "europe-west2"
}

resource "google_storage_bucket" "data_lake_bucket" {
  name     = "datatalks-airbnb-papad-001"
  location = "europe-west2"

  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}








Welcome to Cloud Shell! Type "help" to get started, or type "gemini" to try prompting with Gemini CLI.
To set your Cloud Platform project in this session use `gcloud config set project [PROJECT_ID]`.
You can view your projects by running `gcloud projects list`.
papadammy4real@cloudshell:~$ gcloud config list
[accessibility]
screen_reader = True
[component_manager]
disable_update_check = True
[compute]
gce_metadata_read_timeout_sec = 30
[core]
account = papadammy4real@gmail.com
disable_usage_reporting = False
universe_domain = googleapis.com
[metrics]
environment = devshell

Your active configuration is: [cloudshell-1832]
papadammy4real@cloudshell:~$ gcloud config set project datatalk-airbnb-data-project
WARNING: [papadammy4real@gmail.com] does not have permission to access projects instance [datatalk-airbnb-data-project] (or it may not exist): The caller does not have permission. This command is authenticated as papadammy4real@gmail.com which is the active account specified by the [core/account] property
Are you sure you wish to set property [core/project] to datatalk-airbnb-data-project?

Do you want to continue (Y/n)?  y

Updated property [core/project].
papadammy4real@cloudshell:~ (datatalk-airbnb-data-project)$ gcloud projects list
PROJECT_ID: datatalks-airbnb-data-project
NAME: Airbnb Data Project
PROJECT_NUMBER: 826410144007
ENVIRONMENT: 

PROJECT_ID: de-project-ekpeye
NAME: De Project Ekpeye
PROJECT_NUMBER: 374218303817
ENVIRONMENT: 

PROJECT_ID: opa-restaurant-315416
NAME: Opa Restaurant
PROJECT_NUMBER: 91124032146
ENVIRONMENT: 

PROJECT_ID: project-8b873f82-2f39-4485-964
NAME: My First Project
PROJECT_NUMBER: 796387608345
ENVIRONMENT: 

PROJECT_ID: recaptcha-migrated-e1827516905
NAME: reCAPTCHA Migrated
PROJECT_NUMBER: 313345077959
ENVIRONMENT: 

PROJECT_ID: spencermorganart-1482107563944
NAME: spencermorganart
PROJECT_NUMBER: 1061112756468
ENVIRONMENT: 

PROJECT_ID: the-boss-lounge
NAME: The Boss Lounge
PROJECT_NUMBER: 230727466976
ENVIRONMENT: 
papadammy4real@cloudshell:~ (datatalk-airbnb-data-project)$ gcloud config set project datatalks-airbnb-data-project
[environment: untagged] Read more to tag: g.co/cloud/project-env-tag.
Updated property [core/project].
papadammy4real@cloudshell:~ (datatalks-airbnb-data-project)$ gcloud config list
[accessibility]
screen_reader = True
[component_manager]
disable_update_check = True
[compute]
gce_metadata_read_timeout_sec = 30
[core]
account = papadammy4real@gmail.com
disable_usage_reporting = False
project = datatalks-airbnb-data-project
universe_domain = googleapis.com
[metrics]
environment = devshell

Your active configuration is: [cloudshell-1832]
papadammy4real@cloudshell:~ (datatalks-airbnb-data-project)$ gcloud auth application-default login

You are running on a Google Compute Engine virtual machine.
The service credentials associated with this virtual machine
will automatically be used by Application Default
Credentials, so it is not necessary to use this command.

If you decide to proceed anyway, your user credentials may be visible
to others with access to this virtual machine. Are you sure you want
to authenticate with your personal account?

Do you want to continue (Y/n)?  ^C

Command killed by keyboard interrupt


papadammy4real@cloudshell:~ (datatalks-airbnb-data-project)$ terraform init
terraform plan
terraform apply
Terraform initialized in an empty directory!

The directory has no Terraform configuration files. You may begin working
with Terraform immediately by creating Terraform configuration files.
╷
│ Error: No configuration files
│ 
│ Plan requires configuration to be present. Planning without a configuration would mark everything for destruction, which is normally not what is desired. If
│ you would like to destroy everything, run plan with the -destroy option. Otherwise, create a Terraform configuration file (.tf file) and try again.
╵
╷
│ Error: No configuration files
│ 
│ Apply requires configuration to be present. Applying without a configuration would mark everything for destruction, which is normally not what is desired. If
│ you would like to destroy everything, run 'terraform destroy' instead.
╵
papadammy4real@cloudshell:~ (datatalks-airbnb-data-project)$ pwd
ls
/home/papadammy4real
README-cloudshell.txt
papadammy4real@cloudshell:~ (datatalks-airbnb-data-project)$ mkdir -p terraform-gcs && cd terraform-gcs
papadammy4real@cloudshell:~/terraform-gcs (datatalks-airbnb-data-project)$ nano main.tf
papadammy4real@cloudshell:~/terraform-gcs (datatalks-airbnb-data-project)$ ls
main.tf
papadammy4real@cloudshell:~/terraform-gcs (datatalks-airbnb-data-project)$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/google...
- Installing hashicorp/google v7.28.0...
- Installed hashicorp/google v7.28.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
papadammy4real@cloudshell:~/terraform-gcs (datatalks-airbnb-data-project)$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_storage_bucket.data_lake_bucket will be created
  + resource "google_storage_bucket" "data_lake_bucket" {
      + effective_labels            = {
          + "goog-terraform-provisioned" = "true"
        }
      + force_destroy               = true
      + id                          = (known after apply)
      + location                    = "EUROPE-WEST2"
      + name                        = "datatalks-airbnb-papad-001"
      + project                     = (known after apply)
      + project_number              = (known after apply)
      + public_access_prevention    = (known after apply)
      + rpo                         = (known after apply)
      + self_link                   = (known after apply)
      + storage_class               = "STANDARD"
      + terraform_labels            = {
          + "goog-terraform-provisioned" = "true"
        }
      + time_created                = (known after apply)
      + uniform_bucket_level_access = true
      + updated                     = (known after apply)
      + url                         = (known after apply)

      + versioning {
          + enabled = true
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
papadammy4real@cloudshell:~/terraform-gcs (datatalks-airbnb-data-project)$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_storage_bucket.data_lake_bucket will be created
  + resource "google_storage_bucket" "data_lake_bucket" {
      + effective_labels            = {
          + "goog-terraform-provisioned" = "true"
        }
      + force_destroy               = true
      + id                          = (known after apply)
      + location                    = "EUROPE-WEST2"
      + name                        = "datatalks-airbnb-papad-001"
      + project                     = (known after apply)
      + project_number              = (known after apply)
      + public_access_prevention    = (known after apply)
      + rpo                         = (known after apply)
      + self_link                   = (known after apply)
      + storage_class               = "STANDARD"
      + terraform_labels            = {
          + "goog-terraform-provisioned" = "true"
        }
      + time_created                = (known after apply)
      + uniform_bucket_level_access = true
      + updated                     = (known after apply)
      + url                         = (known after apply)

      + versioning {
          + enabled = true
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

google_storage_bucket.data_lake_bucket: Creating...
google_storage_bucket.data_lake_bucket: Creation complete after 1s [id=datatalks-airbnb-papad-001]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
papadammy4real@cloudshell:~/terraform-gcs (datatalks-airbnb-data-project)$

papadammy4real@cloudshell:~$ mkdir data-ingestion
cd data-ingestion
papadammy4real@cloudshell:~/data-ingestion$ pip install kaggle
Defaulting to user installation because normal site-packages is not writeable
Collecting kaggle
  Downloading kaggle-2.0.1-py3-none-any.whl.metadata (16 kB)
Requirement already satisfied: bleach in /usr/local/lib/python3.12/dist-packages (from kaggle) (6.3.0)
Collecting kagglesdk<1.0,>=0.1.17 (from kaggle)
  Downloading kagglesdk-0.1.18-py3-none-any.whl.metadata (13 kB)
Requirement already satisfied: packaging in /usr/local/lib/python3.12/dist-packages (from kaggle) (26.0)
Requirement already satisfied: protobuf in /usr/local/lib/python3.12/dist-packages (from kaggle) (6.33.6)
Requirement already satisfied: python-dateutil in /usr/local/lib/python3.12/dist-packages (from kaggle) (2.9.0.post0)
Collecting python-slugify (from kaggle)
  Downloading python_slugify-8.0.4-py2.py3-none-any.whl.metadata (8.5 kB)
Requirement already satisfied: requests in /usr/local/lib/python3.12/dist-packages (from kaggle) (2.33.0)
Collecting tqdm (from kaggle)
  Downloading tqdm-4.67.3-py3-none-any.whl.metadata (57 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 57.7/57.7 kB 3.5 MB/s eta 0:00:00
Requirement already satisfied: urllib3>=1.15.1 in /usr/local/lib/python3.12/dist-packages (from kaggle) (2.6.3)
Requirement already satisfied: webencodings in /usr/local/lib/python3.12/dist-packages (from bleach->kaggle) (0.5.1)
Requirement already satisfied: six>=1.5 in /usr/local/lib/python3.12/dist-packages (from python-dateutil->kaggle) (1.17.0)
Collecting text-unidecode>=1.3 (from python-slugify->kaggle)
  Downloading text_unidecode-1.3-py2.py3-none-any.whl.metadata (2.4 kB)
Requirement already satisfied: charset_normalizer<4,>=2 in /usr/local/lib/python3.12/dist-packages (from requests->kaggle) (3.4.6)
Requirement already satisfied: idna<4,>=2.5 in /usr/local/lib/python3.12/dist-packages (from requests->kaggle) (3.11)
Requirement already satisfied: certifi>=2023.5.7 in /usr/local/lib/python3.12/dist-packages (from requests->kaggle) (2026.2.25)
Downloading kaggle-2.0.1-py3-none-any.whl (76 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 76.8/76.8 kB 7.1 MB/s eta 0:00:00
Downloading kagglesdk-0.1.18-py3-none-any.whl (201 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 201.8/201.8 kB 17.5 MB/s eta 0:00:00
Downloading python_slugify-8.0.4-py2.py3-none-any.whl (10 kB)
Downloading tqdm-4.67.3-py3-none-any.whl (78 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 78.4/78.4 kB 7.8 MB/s eta 0:00:00
Downloading text_unidecode-1.3-py2.py3-none-any.whl (78 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 78.2/78.2 kB 7.4 MB/s eta 0:00:00
Installing collected packages: text-unidecode, tqdm, python-slugify, kagglesdk, kaggle
  WARNING: The script tqdm is installed in '/home/papadammy4real/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script slugify is installed in '/home/papadammy4real/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The script kaggle is installed in '/home/papadammy4real/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
Successfully installed kaggle-2.0.1 kagglesdk-0.1.18 python-slugify-8.0.4 text-unidecode-1.3 tqdm-4.67.3
papadammy4real@cloudshell:~/data-ingestion$ ls
papadammy4real@cloudshell:~/data-ingestion$ cd ..
papadammy4real@cloudshell:~$ ls
data-ingestion  README-cloudshell.txt  terraform-gcs
papadammy4real@cloudshell:~$ ls ~
data-ingestion  README-cloudshell.txt  terraform-gcs
papadammy4real@cloudshell:~$ ~/.kaggle/kaggle.json
-bash: /home/papadammy4real/.kaggle/kaggle.json: No such file or directory
papadammy4real@cloudshell:~$ export PATH=$PATH:/home/papadammy4real/.local/bin
papadammy4real@cloudshell:~$ echo 'export PATH=$PATH:/home/papadammy4real/.local/bin' >> ~/.bashrc
source ~/.bashrc
papadammy4real@cs-991724546383-default:~$ kaggle --version
Kaggle CLI 2.0.1
papadammy4real@cs-991724546383-default:~$



gsutil cp listings.parquet gs://datatalks-airbnb-papad-001/raw/airbnb/






Kaggle API name: datatalks-airbnb-project

API Token
KGAT_29554a8850ee9ecd88f5b2c4ff355d2e

o use this token, set the KAGGLE_API_TOKEN environment variable:
export KAGGLE_API_TOKEN=KGAT_29554a8850ee9ecd88f5b2c4ff355d2e

After setting KAGGLE_API_TOKEN, you can use the client as follows:
kaggle competitions list

{
  "username": "papadammy",
  "key": "KGAT_29554a8850ee9ecd88f5b2c4ff355d2e"
}


kaggle datasets download -d jasonairroi/airbnb-market-data-europe


CREATE OR REPLACE TABLE `datatalks-airbnb-data-project.airbnb_data.listings_clean` AS
SELECT
  SAFE_CAST(id AS INT64) AS id,
  name,
  room_type,
  SAFE_CAST(price AS FLOAT64) AS price,
  SAFE_CAST(latitude AS FLOAT64) AS latitude,
  SAFE_CAST(longitude AS FLOAT64) AS longitude,
  country,
  city,

  -- Example derived column
  CASE 
    WHEN SAFE_CAST(price AS FLOAT64) < 50 THEN 'cheap'
    WHEN SAFE_CAST(price AS FLOAT64) < 150 THEN 'moderate'
    ELSE 'expensive'
  END AS price_category

FROM `datatalks-airbnb-data-project.airbnb_data.listings_raw`
WHERE price IS NOT NULL



SELECT column_name
FROM `datatalks-airbnb-data-project.airbnb_data.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'listings_raw';

column_name
listing_id
listing_type
room_type
cover_photo_url
photos_count
host_id
superhost
latitude
longitude
guests
bedrooms
beds
baths
registration
amenities
instant_book
professional_management
min_nights
cancellation_policy
currency
cleaning_fee
extra_guest_fee
num_reviews
rating_overall
rating_accuracy
rating_checkin
rating_cleanliness
rating_communication
rating_location
rating_value
ttm_revenue
ttm_revenue_native
ttm_avg_rate
ttm_avg_rate_native
ttm_occupancy
ttm_adjusted_occupancy
ttm_revpar
ttm_revpar_native
ttm_adjusted_revpar
ttm_adjusted_revpar_native
ttm_reserved_days
ttm_blocked_days
ttm_available_days
ttm_total_days
l90d_revenue
l90d_revenue_native
l90d_avg_rate
l90d_avg_rate_native
l90d_occupancy
l90d_adjusted_occupancy
l90d_revpar
l90d_revpar_native
l90d_adjusted_revpar
l90d_adjusted_revpar_native
l90d_reserved_days
l90d_blocked_days
l90d_available_days
l90d_total_days
country
state
city


1115174

past_rates_raw

listing_id	date	vacant_days	reserved_days	occupancy	revenue	rate_avg	booked_rate_avg	booking_lead_time_avg	length_of_stay_avg	min_nights_avg	native_booked_rate_avg	native_rate_avg	native_revenue	country	state	city
825166	2025-02-01	10	18	0.643	672.0	36.4	37.3	94	3	2	14679.0	14325.0	264466.0	Hungary	Central Hungary	Budapest
1584983	2025-02-01	23	5	0.179	982.0	209.0	196.4	23	3	4	77293.0	82252.0	386466.0	Hungary	Central Hungary	Budapest
1056233	2025-02-01	15	13	0.464	1391.0	100.0	107.0	14	3	2	42110.0	39355.0	547429.0	Hungary	Central Hungary	Budapest
1344349	2025-02-01	21	7	0.25	232.0	33.7	33.1	1	7	1	13027.0	13263.0	91304.0	Hungary	Central Hungary	Budapest
2389626	2025-02-01	1	27	0.964	1070.0	39.7	39.6	15	28	3	15585.0	15624.0	421099.0	Hungary	Central Hungary	Budapest
