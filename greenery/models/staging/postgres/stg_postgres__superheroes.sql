{{ config(materialized='table') }}

with src_heroes as (
    select * from {{ source('postgres', 'superheroes')}}
    ),

    renamed_recast as (

select 
id
, name
, gender
, eye_color
, race
, hair_color
, height
, publisher
, skin_color
, alignment
, weight
, created_at::timestampntz as created_at_utc
, updated_at::timestampntz as updated_at_utc

from src_heroes
    )

select * from renamed_recast


