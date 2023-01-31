SELECT  val
FROM {{ ref('user_cnt')}}
WHERE val <= 0