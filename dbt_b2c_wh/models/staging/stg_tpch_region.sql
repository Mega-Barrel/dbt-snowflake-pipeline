
{{
  config(
    materialized = 'view',
    )
}}

WITH tpch_region AS (
    SELECT *
    FROM {{ source('tpch', 'region') }}
)

SELECT
    R_REGIONKEY AS region_sk,
    R_REGIONKEY AS region_key,
    R_NAME AS region_name,
    R_COMMENT AS region_comment
FROM tpch_region
