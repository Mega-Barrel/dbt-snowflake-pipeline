

USE ROLE ACCOUNTADMIN;

CREATE WAREHOUSE dbt_wh WITH warehouse_size = "x-small";

CREATE DATABASE dbt_db;

CREATE ROLE dbt_role;

SHOW GRANTS ON WAREHOUSE dbt_wh;

GRANT USAGE ON WAREHOUSE dbt_wh TO ROLE dbt_role;

GRANT ROLE dbt_role TO USER <username>;

GRANT ALL ON DATABASE dbt_db TO ROLE dbt_role;

USE ROLE dbt_role;

CREATE SCHEMA dbt_db.dbt_schema;


-- USE ROLE ACCOUNTADMIN;
-- DROP WAREHOUSE IF EXISTS dbt_wh;
-- DROP DATABASE IF EXISTS dbt_db;
-- DROP ROLE IF EXISTS dbt_role;


