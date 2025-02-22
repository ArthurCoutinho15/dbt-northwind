with source as (
        select * from {{ source('northwind', 'order_details') }}
  ),
  renamed as (
      select
          {{ adapter.quote("order_id") }},
        {{ adapter.quote("product_id") }},
        {{ adapter.quote("unit_price") }},
        {{ adapter.quote("quantity") }},
        {{ adapter.quote("discount") }}

      from source
  )
  select * from renamed
    