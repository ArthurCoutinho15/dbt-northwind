with source as (
        select * from {{ source('northwind', 'categories') }}
  ),
  renamed as (
      select
          {{ adapter.quote("category_id") }},
        {{ adapter.quote("category_name") }},
        {{ adapter.quote("description") }},
        {{ adapter.quote("picture") }}

      from source
  )
  select * from renamed
    