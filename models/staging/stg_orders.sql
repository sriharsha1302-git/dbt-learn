{{
    config(
        materialized='table'
    )
}}

SELECT 
-- from raw_orders
Ordr.orderid,
Ordr.orderdate,
Ordr.shipdate,
Ordr.shipmode,
Ordr.ordercostprice,
Ordr.ordersellingprice,
(Ordr.ordersellingprice - Ordr.ordercostprice) as orderprofit,
--from raw_customer
Cust.customerid,
Cust.customername,
Cust.segment,
Cust.country,
--from raw_product
Prod.category,
Prod.productid,
Prod.productname,
Prod.subcategory
FROM
{{ ref('raw_orders') }} as Ordr
LEFT JOIN
{{ ref('raw_customer') }} as Cust
on Ordr.customerid = Cust.customerid
LEFT JOIN
{{ ref('raw_product') }} as Prod
on Ordr.productid = Prod.productid