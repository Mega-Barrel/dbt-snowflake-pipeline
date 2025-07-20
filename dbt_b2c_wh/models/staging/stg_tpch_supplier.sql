
{{
  config(
    materialized = 'view',
    )
}}

WITH tpch_supplier AS (
    SELECT *
    FROM {{ source('tpch', 'supplier') }}
)

SELECT
    S_SUPPKEY AS supplier_sk,
    S_SUPPKEY AS supplier_key,
    S_NAME AS supplier_name,
    S_ADDRESS AS supplier_address,
    S_NATIONKEY AS nation_key,
    S_PHONE AS supplier_phone,
    S_ACCTBAL AS account_balance,
    S_COMMENT AS supplier_comment
FROM tpch_supplier
