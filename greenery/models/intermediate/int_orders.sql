{{
  config(
    materialized = 'table',
    )
}}

with orders as (
    select * from {{ ref('stg_postgres__orders') }}
), promo as (
    select * from {{ ref('stg_postgres__promos') }}
)

select ORDER_ID,
       USER_ID,
       orders.PROMO_ID,
       ADDRESS_ID,
       CREATED_AT,
       ORDER_COST,
       SHIPPING_COST,
       ORDER_TOTAL,
       TRACKING_ID,
       SHIPPING_SERVICE,
       ESTIMATED_DELIVERY_AT,
       DELIVERED_AT,
       IFF(promo.PROMO_ID is null, 'NO','YES') PROMO_USED,
       orders.STATUS as order_status,
       DISCOUNT,
       promo.STATUS as promo_status
from orders
left join promo on orders.PROMO_ID = promo.PROMO_ID