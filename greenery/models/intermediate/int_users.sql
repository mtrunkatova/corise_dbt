{{
  config(
    materialized = 'table',
    )
}}

with user as ( 
    
    select * from {{ ref('stg_postgres__users') }}
),

addressy as (
    select * from {{ ref('stg_postgres__addresses') }}
)

select USER_ID,
       FIRST_NAME,
       LAST_NAME,
       EMAIL,
       PHONE_NUMBER,
       CREATED_AT_UTC,
       UPDATED_AT_UTC,
       user.ADDRESS_ID,
       ADDRESS,
       ZIPCODE,
       STATE,
       COUNTRY
from user
left join addressy
on user.ADDRESS_ID = addressy.ADDRESS_ID