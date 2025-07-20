
{{
  config(
    materialized = 'view',
    )
}}

WITH tpch_lineitem AS (
    SELECT *
    FROM {{ source('tpch', 'lineitem') }}
)

SELECT
    md5(concat(order_key, '-', line_number)) AS lineitem_sk,
    L_ORDERKEY AS order_key,
    L_PARTKEY AS part_key,
    L_SUPPKEY AS supplier_key,
    L_LINENUMBER AS line_number,
    L_QUANTITY AS quantity,
    L_EXTENDEDPRICE AS extended_price,
    L_DISCOUNT AS discount,
    L_TAX AS tax,
    L_RETURNFLAG AS return_flag,
    L_LINESTATUS AS line_status,
    L_SHIPDATE AS ship_date,
    L_COMMITDATE AS commit_date,
    L_RECEIPTDATE AS receipt_date,
    L_SHIPINSTRUCT AS ship_instructions,
    L_SHIPMODE AS ship_mode,
    L_COMMENT AS line_comment
FROM tpch_lineitem
