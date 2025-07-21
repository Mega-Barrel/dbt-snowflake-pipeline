
{{
  config(
    materialized = 'view',
    )
}}

WITH customers AS (
    SELECT
        *
    FROM
        {{ ref('stg_tpch_customer') }}
)
,

orders AS (
    SELECT
        *
    FROM
        {{ ref('stg_tpch_orders') }}
)

SELECT
    o.order_key,
    o.customer_key,
    c.customer_name,
    c.market_segment,
    o.order_date,
    o.total_price
FROM
    orders o
    JOIN customers c
    ON o.customer_key = c.customer_key

