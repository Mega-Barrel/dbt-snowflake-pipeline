
{{
    config(
        materialized='view'
    )
}}

WITH lineitems AS (
    SELECT
        supplier_key,
        part_key,
        extended_price,
        discount
    FROM
        {{ ref('stg_tpch_lineitem') }}
),

supplier_sales AS (
    SELECT
        supplier_key,
        part_key,
        COUNT(*) AS lineitem_count,
        SUM(extended_price * (1 - discount)) AS net_revenue
    FROM
        lineitems
    GROUP BY
        supplier_key, part_key
)

SELECT
    supplier_key,
    COUNT(DISTINCT part_key) AS parts_supplied,
    SUM(net_revenue) AS total_supplier_revenue
FROM
    supplier_sales
GROUP BY
    supplier_key
