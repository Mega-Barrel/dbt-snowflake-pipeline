
{{
  config(
    materialized = 'view',
    )
}}

WITH tpch_part AS (
    SELECT *
    FROM {{ source('tpch', 'part') }}
)

SELECT
    P_PARTKEY AS part_sk,
    P_PARTKEY AS part_key,
    P_NAME AS part_name,
    P_MFGR AS manufacturer,
    P_BRAND AS brand,
    P_TYPE AS part_type,
    P_SIZE AS part_size,
    P_CONTAINER AS container,
    P_RETAILPRICE AS retail_price,
    P_COMMENT AS part_comment
FROM tpch_part
