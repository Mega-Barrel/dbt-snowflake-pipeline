{{ config(materialized='table') }}

WITH customer_orders AS (
    SELECT * FROM {{ ref('int_customer_orders') }}
),
aggregated AS (
    SELECT
        customer_key,
        COUNT(DISTINCT order_key) AS total_orders,
        SUM(total_price) AS total_spend,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS last_order_date
    FROM customer_orders
    GROUP BY customer_key
)

SELECT *
FROM aggregated
