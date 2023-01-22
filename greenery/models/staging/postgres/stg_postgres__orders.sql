{{ config(materialized='table') }}

with src_orders as (
    select * from {{ source('postgres', 'orders')}}
    ),

    renamed_recast as (
select order_id as order_id
, user_id as user_id
, promo_id as promo_id
, address_id as address_id
, TRY_TO_TIMESTAMP(created_at) AS created_at
, order_cost
, shipping_cost
, order_total
, tracking_id
, shipping_service
, TRY_TO_TIMESTAMP(estimated_delivery_at) AS estimated_delivery_at
, TRY_TO_TIMESTAMP(delivered_at) AS delivered_at
, status 
from src_orders
    )

select * from renamed_recast
