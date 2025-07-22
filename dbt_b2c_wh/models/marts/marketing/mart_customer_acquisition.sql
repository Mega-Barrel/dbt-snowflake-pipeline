{{ config(materialized='table') }}

SELECT
    DATE_TRUNC('month', first_order_date) AS acquisition_month,
    COUNT(DISTINCT customer_key) AS new_customers
FROM {{ ref('int_customer_lifecycle') }}
GROUP BY 1
