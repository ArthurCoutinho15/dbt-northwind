with source as(
    select *
    from {{ref("int_employees")}}
)

select *
from source