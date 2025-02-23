with source as (
    select *
    from {{ref("stg_employees")}}
),

new_columns as (
    select a.*, (year(now()) - year(a.birth_date)) AS age,
    (year(now()) -  year(a.hire_date)) years_of_service,
    concat(a.first_name, " ", a.last_name) as name
    from source as a
)

select *
from new_columns