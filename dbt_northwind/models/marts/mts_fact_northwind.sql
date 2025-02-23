with prod as (
    select ct.category_name, pd.product_name, sp.company_name as suppliers, 
    pd.unit_price, pd.product_id
    from {{ref("stg_products")}} as pd
    left join {{ref("stg_suppliers")}} as sp on pd.supplier_id = sp.supplier_id	
    left join {{ref("stg_categories")}} as ct on pd.category_id = ct.category_id
),

order_detail as (
    select pd.*, od.order_id, od.quantity, od.final_price
    from {{ref("int_order_details")}} as od
    left join prod as pd on od.product_id = pd.product_id
),

orders as (
    select ord.order_date, ord.order_id, cs.company_name as customer, emp.name as employee, emp.age, emp.years_of_service
    from {{ref("orders")}} as ord
    left join {{ref("int_customer_unique")}} as cs on ord.customer_id = cs.customer_id
    left join {{ref("int_employees")}} as emp on ord.employee_id = emp.employee_id
    left join {{ref("stg_shippers")}} sh on ord.ship_via = sh.shipper_id
),

final_join as (
    select od.*, ord.order_date, ord.customer, ord.employee, ord.age, ord.years_of_service
    from order_detail as od 
    inner join orders as ord on od.order_id = ord.order_id
)

select *
from final_join