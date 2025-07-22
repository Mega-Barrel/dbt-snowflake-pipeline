
{{
    config(
        materialized='view'
    )
}}

WITH customer_orders AS (
    SELECT
        o.order_key,
        o.customer_key,
        c.market_segment
    FROM
        {{ ref('int_customer_orders') }} o
    JOIN
        {{ ref('stg_tpch_customer') }} c
        ON o.customer_key = c.customer_key
)
,

order_revenue AS (
    SELECT
        order_key,
        SUM(net_revenue) AS segment_revenue
    FROM
        {{ ref('int_order_lineitems') }}
    GROUP BY
        order_key
)

SELECT
    co.market_segment,
    co.order_key,
    orr.segment_revenue
FROM
    customer_orders co
JOIN
    order_revenue orr
    ON co.order_key = orr.order_key
