
{{
  config(
    materialized = 'view',
    )
}}

WITH orders AS (
    SELECT
        *
    FROM
        {{ ref('stg_tpch_orders') }}
),
lineitems AS (
    SELECT
        *
    FROM
        {{ ref('stg_tpch_lineitem') }}
)

SELECT
    o.order_key,
    o.customer_key,
    o.order_date,
    l.part_key,
    l.supplier_key,
    l.quantity,
    l.extended_price,
    l.discount,
    l.tax,
    (l.extended_price * (1 - l.discount)) AS net_revenue
FROM
    orders o
    JOIN lineitems l
    ON o.order_key = l.order_key
