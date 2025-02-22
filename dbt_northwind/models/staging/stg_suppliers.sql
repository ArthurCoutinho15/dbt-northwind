with source as (
        select * from {{ source('northwind', 'suppliers') }}
  ),
  renamed as (
      select
          {{ adapter.quote("supplier_id") }},
        {{ adapter.quote("company_name") }},
        {{ adapter.quote("contact_name") }},
        {{ adapter.quote("contact_title") }},
        {{ adapter.quote("address") }},
        {{ adapter.quote("city") }},
        {{ adapter.quote("region") }},
        {{ adapter.quote("postal_code") }},
        {{ adapter.quote("country") }},
        {{ adapter.quote("phone") }},
        {{ adapter.quote("fax") }},
        {{ adapter.quote("homepage") }}

      from source
  )
  select * from renamed
    