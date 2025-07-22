
{{
    config(
        materialized='view'
    )
}}

WITH shipping_raw AS (
    SELECT
        order_key,
        line_number,
        ship_mode,
        ship_date,
        commit_date,
        receipt_date
    FROM
        {{ ref('stg_tpch_lineitem') }}
)
,

shipping_metrics AS (
    SELECT
        order_key,
        line_number,
        ship_mode,
        ship_date,
        commit_date,
        receipt_date,
        DATEDIFF('day', ship_date, receipt_date) AS delivery_days,
        DATEDIFF('day', commit_date, receipt_date) AS days_late,
        CASE WHEN receipt_date > commit_date THEN 1 ELSE 0 END AS is_late
    FROM
        shipping_raw
)

SELECT
    *
FROM
    shipping_metrics
