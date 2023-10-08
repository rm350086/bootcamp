{{ config(
    materialized = 'table'
) }}


WITH
customer AS (
    SELECT
        *
    FROM {{ ref('stg_tpch_sf1__customer') }}
),

nation AS (
    SELECT
        *
    FROM {{ ref('stg_tpch_sf1__nation') }}
),

region AS (
    SELECT
        *
    FROM {{ ref('stg_tpch_sf1__region') }}
)

SELECT
    customer.cust_key,
    customer.cust_name,
    customer.cust_address,
    customer.cust_phone,
    nation.nation_name,
    region.region_name
FROM customer
LEFT JOIN nation
    ON (customer.nation_key = nation.nation_key)
LEFT JOIN region
    ON (nation.region_key = region.region_key)
