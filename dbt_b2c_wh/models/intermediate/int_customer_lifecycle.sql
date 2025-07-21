

{{
    config(
        materialized='view'
    )
}}

SELECT
    customer_key,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    COUNT(DISTINCT order_key) AS total_orders,
    SUM(total_price) AS total_spend
FROM
    {{ ref('int_customer_orders') }}
GROUP BY
    customer_key
