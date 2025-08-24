# BigQuery Notebook: Analytics DW Pipeline

End-to-end notebook to build a small analytics data warehouse on BigQuery.

## Overview

This notebook:
- Stages raw CSV inputs into `stg_*` tables.
- Writes any duplicates into matching `*_rejects` tables with a reason.
- Builds dimensions: `dim_date`, `dim_location`, `dim_product`, `dim_employee`, `dim_currency`.
- Merges facts: `fact_attendance`, `fact_sales`, `fact_finance`.
- Emits JSON log lines at each step.

## Prerequisites

- A Google Cloud project (name: `analytics-pipeline-assessment`).
- BigQuery API enabled.
- Permissions for the account running the notebook.

## Inputs & Dataset

- The input files for the pipeline will be generated during the pipeline run.
- Input files generated:
  - `attendance_dataset_3m.csv`
  - `sales_dataset_3m.csv`
  - `financial_dataset_3m.csv`

## Open the Notebook in BigQuery Studio

1. In Google Cloud Console, open **BigQuery**.
2. Go to **Notebooks** -> **New Notebook** -> import the provided notebook into workspace.
3. Ensure the **analytics-pipeline-assessment** is set as the target project.

## Configure the Notebook

- Set the project ID and dataset ID in the notebook’s second cell.
- Verify a BigQuery client is initialized for the project.
- The notebook prints structured JSON logs for observability.

## Clean Up

- To remove all objects, drop the dataset.

## Expected Artifacts

- **Staging:** `stg_attendance`, `stg_sales`, `stg_finance`.
- **Dimensions:** `dim_date`, `dim_location`, `dim_product`, `dim_employee`, `dim_currency`.
- **Facts:** `fact_attendance`, `fact_sales`, `fact_finance`.
- **Logs:** JSON log lines in the notebook output indicating each step’s status and counts.
