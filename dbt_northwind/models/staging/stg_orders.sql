with source as (
        select * from {{ source('northwind', 'orders') }}
  ),
  renamed as (
      select
          {{ adapter.quote("order_id") }},
        {{ adapter.quote("customer_id") }},
        {{ adapter.quote("employee_id") }},
        {{ adapter.quote("order_date") }},
        {{ adapter.quote("required_date") }},
        {{ adapter.quote("shipped_date") }},
        {{ adapter.quote("ship_via") }},
        {{ adapter.quote("freight") }},
        {{ adapter.quote("ship_name") }},
        {{ adapter.quote("ship_address") }},
        {{ adapter.quote("ship_city") }},
        {{ adapter.quote("ship_region") }},
        {{ adapter.quote("ship_postal_code") }},
        {{ adapter.quote("ship_country") }}

      from source
  )
  select * from renamed
    