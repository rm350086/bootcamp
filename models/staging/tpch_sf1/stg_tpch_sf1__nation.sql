WITH
source AS (
    SELECT
        *
    FROM {{ source('src_tpch_sf1', 'nation') }}
)

SELECT
    n_nationkey AS nation_key,
    n_name AS nation_name,
    n_regionkey AS region_key
FROM source
