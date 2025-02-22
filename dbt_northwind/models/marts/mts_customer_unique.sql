WITH source as (
    select *
    from {{ref("int_customer_unique")}}
)

select *
from source