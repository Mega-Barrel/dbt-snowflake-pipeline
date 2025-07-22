
{{
  config(
    materialized = 'view',
    )
}}

WITH shipping_metrics AS (
    SELECT
        order_key,
        ship_date,
        commit_date,
        receipt_date,
        ship_mode,
        DATEDIFF('day', commit_date, receipt_date) AS days_late,
        DATEDIFF('day', ship_date, receipt_date) AS delivery_days,
        CASE WHEN receipt_date > commit_date THEN 1 ELSE 0 END AS is_late
    FROM
        {{ ref('stg_tpch_lineitem') }}
)

SELECT
    ship_mode,
    COUNT(*) AS total_shipments,
    AVG(days_late) AS avg_days_late,
    SUM(is_late) * 1.0 / COUNT(*) AS pct_late_shipments
FROM
    shipping_metrics
GROUP BY
    ship_mode

