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
)

,

region AS (
    SELECT
        *
    FROM {{ ref('stg_tpch_sf1__region') }}
)

SELECT
    customer.cust_key,
    customer.cust_name,
    customer.cust_address,
    nation.nation_name,
    customer.cust_phone,
    region.region_name
FROM customer
LEFT JOIN nation
    ON (customer.nation_key = nation.nation_key)
LEFT JOIN region
    ON (nation.nation_region_key = region.region_key)