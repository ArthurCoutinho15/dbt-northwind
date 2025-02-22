with source as (
        select * from {{ source('northwind', 'customers') }}
  ),
  renamed as (
      select
          {{ adapter.quote("customer_id") }},
        {{ adapter.quote("company_name") }},
        {{ adapter.quote("contact_name") }},
        {{ adapter.quote("contact_title") }},
        {{ adapter.quote("address") }},
        {{ adapter.quote("city") }},
        {{ adapter.quote("region") }},
        {{ adapter.quote("postal_code") }},
        {{ adapter.quote("country") }},
        {{ adapter.quote("phone") }},
        {{ adapter.quote("fax") }}

      from source
  )
  select * from renamed
    