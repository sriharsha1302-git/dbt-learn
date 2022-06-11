with 
orders as (
      select * from {{ ref('raw_orders') }}
)

select 
      orderid,
      sum(ordersellingprice) as total_sellprice
from orders
group by orderid
having total_sellprice < 0      