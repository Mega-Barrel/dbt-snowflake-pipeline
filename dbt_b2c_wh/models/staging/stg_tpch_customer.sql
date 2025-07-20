
{{
  config(
    materialized = 'view',
    )
}}

WITH tpch_customer AS (
    SELECT *
    FROM {{ source('tpch', 'customer') }}
)

SELECT
    C_CUSTKEY AS customer_sk,
    C_CUSTKEY AS customer_key,
    C_NAME AS customer_name,
    C_ADDRESS AS customer_address,
    C_NATIONKEY AS nation_key,
    C_PHONE AS customer_phone,
    C_ACCTBAL AS account_balance,
    C_MKTSEGMENT AS market_segment,
    C_COMMENT AS customer_comment
FROM tpch_customer
