with order_details as (
    select *
    from {{ref("stg_order_details")}}
),

products as (
    select *
    from {{ref("stg_products")}}
),

new_columns as (
    select od.order_id, od.product_id, od.unit_price, od.quantity, pr.product_name, pr.supplier_id, pr.category_id, 
    round(od.unit_price * od.quantity) as total_price,
    round((od.unit_price * od.quantity) *  (1 - od.discount)) as final_price
    from order_details as od
    left join products as pr on od.product_id = pr.product_id
)

select *
from new_columns