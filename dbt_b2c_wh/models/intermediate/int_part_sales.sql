
{{
  config(
    materialized = 'view',
    )
}}

WITH lineitems AS (
    SELECT
        *
    FROM
        {{ ref('stg_tpch_lineitem') }}
)
,
parts AS (
    SELECT
        *
    FROM
        {{ ref('stg_tpch_part') }}
)
,
partsupp AS (
    SELECT
        *
    FROM
        {{ ref('stg_tpch_partsupp') }}
)

SELECT
    li.part_key,
    p.part_name,
    p.brand,
    p.part_type,
    ps.supply_cost,
    li.extended_price,
    li.discount,
    (li.extended_price * (1 - li.discount)) AS net_revenue
FROM
    lineitems li
    JOIN parts p ON li.part_key = p.part_key
    LEFT JOIN partsupp ps 
    ON li.part_key = ps.part_key AND li.supplier_key = ps.supplier_key
