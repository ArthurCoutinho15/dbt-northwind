with source as (
        select * from {{ source('northwind', 'products') }}
  ),
  renamed as (
      select
          *

      from source
  )
  select * from renamed
    