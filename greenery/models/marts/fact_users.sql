{{
  config(
    materialized = 'table',
    )
}}

with user as (

    select * from {{ ref('int_users') }}
),

    orders_per_user as (
        select USER_ID, count(*) as orders_per_user from {{ ref('int_orders') }} group by USER_ID
    )

select user.USER_ID,
       FIRST_NAME,
       LAST_NAME,
       orders_per_user.orders_per_user

from user
left join orders_per_user on user.USER_ID = orders_per_user.USER_ID