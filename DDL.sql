CREATE SCHEMA IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}`;

CREATE TABLE IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}.dim_date` (
  date_key DATE, 
  year INT64, 
  quarter INT64, 
  month INT64, 
  month_name STRING,
  day_of_month INT64, 
  day_of_week INT64, 
  day_name STRING
);

CREATE TABLE IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}.dim_location` (
  location_key STRING, 
  region STRING, 
  country STRING
);

CREATE TABLE IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}.dim_product` (
  product_key STRING, 
  product_name STRING
);

CREATE TABLE IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}.dim_employee` (
  employee_key STRING, 
  staffid STRING, 
  name STRING,
  department STRING, 
  home_country STRING, 
  home_region STRING
);

CREATE TABLE IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}.dim_currency` (
  currency_key STRING, 
  currency_code STRING, 
  date_to_usd NUMERIC
);

CREATE TABLE IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}.stg_attendance` (
  StaffID STRING, 
  Name STRING, 
  Region STRING, 
  Country STRING, 
  Department STRING,
  Date DATE, 
  Status STRING, 
  CheckInTime STRING, 
  CheckOutTime STRING
);

CREATE TABLE IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}.stg_sales` (
  SaleID STRING, 
  Region STRING, 
  Country STRING, 
  Product STRING, 
  Date DATE,
  Currency STRING, 
  Quantity INT64, 
  UnitPrice NUMERIC, 
  TotalSales NUMERIC
);

CREATE TABLE IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}.stg_finance` (
  TransactionID STRING, 
  Region STRING, 
  Country STRING, 
  Product STRING, 
  Date DATE,
  Currency STRING, 
  Revenue NUMERIC, 
  Expense NUMERIC, 
  Profit NUMERIC
);

CREATE TABLE IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}.fact_attendance` (
  attendance_key STRING,
  employee_key STRING, 
  location_key STRING, 
  date_key DATE,
  status STRING, 
  checkin_time TIMESTAMP, 
  checkout_time TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}.fact_sales` (
  saleid STRING,
  product_key STRING, 
  location_key STRING, 
  date_key DATE, 
  currency_key STRING,
  quantity INT64,
  conversion_rate_to_usd NUMERIC,
  unit_price_usd NUMERIC, 
  total_sales_usd NUMERIC
);

CREATE TABLE IF NOT EXISTS `{PROJECT_ID}.{DATASET_ID}.fact_finance` (
  transaction_id STRING,
  product_key STRING, 
  location_key STRING, 
  date_key DATE, 
  currency_key STRING,
  conversion_rate_to_usd NUMERIC,
  revenue_usd NUMERIC, 
  expense_usd NUMERIC, 
  profit_usd NUMERIC
);