
{{
    config(
        materialized='view'
    )
}}

WITH part_costs AS (
    SELECT
        ps.part_key,
        AVG(ps.supply_cost) AS avg_supply_cost
    FROM
        {{ ref('stg_tpch_partsupp') }} ps
    GROUP BY
        ps.part_key
)
,

part_details AS (
    SELECT
        p.part_key,
        p.part_name,
        p.brand,
        p.part_type,
        p.retail_price
    FROM
        {{ ref('stg_tpch_part') }} p
)

SELECT
    pd.part_key,
    pd.part_name,
    pd.brand,
    pd.part_type,
    pd.retail_price,
    pc.avg_supply_cost AS supply_cost,
    pd.retail_price - pc.avg_supply_cost AS markup
FROM
    part_details pd
    LEFT JOIN part_costs pc
    ON pd.part_key = pc.part_key
