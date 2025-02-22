with source as (
        select * from {{ source('northwind', 'employees') }}
  ),
  renamed as (
      select
          {{ adapter.quote("employee_id") }},
        {{ adapter.quote("last_name") }},
        {{ adapter.quote("first_name") }},
        {{ adapter.quote("title") }},
        {{ adapter.quote("title_of_courtesy") }},
        {{ adapter.quote("birth_date") }},
        {{ adapter.quote("hire_date") }},
        {{ adapter.quote("address") }},
        {{ adapter.quote("city") }},
        {{ adapter.quote("region") }},
        {{ adapter.quote("postal_code") }},
        {{ adapter.quote("country") }},
        {{ adapter.quote("home_phone") }},
        {{ adapter.quote("extension") }},
        {{ adapter.quote("photo") }},
        {{ adapter.quote("notes") }},
        {{ adapter.quote("reports_to") }},
        {{ adapter.quote("photo_path") }}

      from source
  )
  select * from renamed
    