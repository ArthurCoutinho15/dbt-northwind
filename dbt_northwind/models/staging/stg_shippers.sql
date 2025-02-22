with source as (
        select * from {{ source('northwind', 'shippers') }}
  ),
  renamed as (
      select
          {{ adapter.quote("shipper_id") }},
        {{ adapter.quote("company_name") }},
        {{ adapter.quote("phone") }}

      from source
  )
  select * from renamed
    