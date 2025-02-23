with source as (
    select *
    from {{ref("int_order_details")}}
)

select *
from source