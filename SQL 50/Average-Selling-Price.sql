# Write your MySQL query statement below
select P.product_id, coalesce(round(sum(P.price*U.units) * 1.0 /sum(U.units), 2), 0) as average_price
from Prices P
left join UnitsSold U
on P.product_id = U.product_id
AND U.purchase_date BETWEEN P.start_date AND P.end_date
group by P.product_id