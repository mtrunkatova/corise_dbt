
SELECT order_id,
       user_id,
       promo_id,
       address_id,
       TRY_TO_TIMESTAMP(created_at) AS created_at,
       TRY_TO_DOUBLE(order_cost) AS order_cost,
       TRY_TO_DOUBLE(shipping_cost) AS shipping_cost,
       tracking_id,
       shipping_service,
       TRY_TO_TIMESTAMP(estimated_delivery_at) AS estimated_delivery_at,
       TRY_TO_TIMESTAMP(delivered_at) AS delivered_at,
       status

FROM {{ source('postgres', 'orders') }}

/*with src_orders as (
    select * from {{ source('postgres', 'orders ') }}
    ),

    renamed_recast as (
select 
order_id as order_guid
, user_id as user_guid
, promo_id as promo_desc
, address_id as address_guid
, created_at::timestampntz as created_at_utc
, order_cost
, shipping_cost
, order_total
, tracking_id as tracking_guid
, shipping_service
, estimated_delivery_at::timestampntz as estimated_delivery_at_utc
, delivered_at::timestampntz as delivered_at_utc
, status 
from src_orders
    )

select * from renamed_recast
*/

