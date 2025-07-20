
{{
  config(
    materialized = 'view',
    )
}}

WITH tpch_nation AS (
    SELECT *
    FROM {{ source('tpch', 'nation') }}
)

SELECT
    N_NATIONKEY AS nation_sk,
    N_NATIONKEY AS nation_key,
    N_NAME AS nation_name,
    N_REGIONKEY AS region_key,
    N_COMMENT AS nation_comment
FROM tpch_nation
