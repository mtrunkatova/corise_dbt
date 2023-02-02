

select *
from {{ ref('stg_postgres__superheroes') }}
where height < 0

