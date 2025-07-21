
{{
  config(
    materialized = 'view',
    )
}}

WITH tpch_partsupp AS (
    SELECT *
    FROM {{ source('tpch', 'partsupp') }}
)

SELECT
    md5(concat(PS_PARTKEY, '-', PS_SUPPKEY)) AS partsupp_sk,
    PS_PARTKEY AS part_key,
    PS_SUPPKEY AS supplier_key,
    PS_AVAILQTY AS available_quantity,
    PS_SUPPLYCOST AS supply_cost,
    PS_COMMENT AS partsupp_comment
FROM
    tpch_partsupp
