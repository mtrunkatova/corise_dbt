{{
    config(
        target_schema = 'snapshots',
        unique_key = 'id'

        stragety = 'timestamp',
        updated_at='updated_at'
    )
}}

select * from {{ source('postgres', 'orders') }}