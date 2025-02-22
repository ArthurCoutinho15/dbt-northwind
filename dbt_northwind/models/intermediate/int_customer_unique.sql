WITH source AS (
    SELECT 
        *,
        FIRST_VALUE(customer_id) OVER (
            PARTITION BY company_name, contact_name
            ORDER BY company_name
        ) AS result
    FROM {{ref("stg_customers")}}
),

removed as (
    SELECT DISTINCT result
    FROM source
),

final as (
    SELECT *
    from {{ref("stg_customers")}}
    where customer_id in (
        select *
        from removed
    )
)

SELECT *
FROM final