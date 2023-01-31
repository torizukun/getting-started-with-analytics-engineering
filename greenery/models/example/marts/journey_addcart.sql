with t as (
  select count(distinct user_id || session_id) as total_session
    , count(distinct case event_type when 'add_to_cart' then user_id || session_id else null end) as cntd_addcart
    , count(distinct case event_type when 'checkout' then user_id || session_id else null end) as cntd_checkout
  from {{ ref('stg_greenery__events') }}
)

select total_session
    , cntd_addcart
    , cntd_checkout
    , cntd_addcart/cast(total_session as float) as pct_addcart
    , cntd_checkout/cast(total_session as float) as pct_checkout
from t