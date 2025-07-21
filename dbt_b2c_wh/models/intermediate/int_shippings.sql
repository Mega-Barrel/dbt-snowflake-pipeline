
{{
  config(
    materialized = 'view',
    )
}}

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
