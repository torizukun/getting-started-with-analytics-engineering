-- select count(distinct user_id) from public.users

select count(distinct user_id) as val
-- from {{ source('greenery', 'users')}}
from {{ ref('stg_greenery__users') }}