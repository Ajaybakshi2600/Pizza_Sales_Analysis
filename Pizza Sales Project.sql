
select * from pizza_sales
use  [Pizza DB]
---Total Revenue---
select sum(total_price) as Total_Revenue from pizza_sales

--Average order value--- Average amount spent per order
select sum(total_price)/count(distinct order_id) as Average_order_value from pizza_sales

---Total pizzas sold--
select sum(quantity) as Total_pizza_sold from pizza_sales

---Total orders---
select count(distinct order_id) as Total_orders from pizza_sales

---Average pizzas per order---
select cast(cast(sum(quantity) as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as average_pizza_per_order from pizza_sales

---Daily trend for total orders---
select datename(weekday,order_date) as order_day, count(distinct order_id) as total_orders
from pizza_sales
group by  datename(weekday,order_date)

--Monthly trend for total_orders---
select datename(month, order_date) as order_month, 
count( distinct order_id ) as Total_orders from pizza_sales
group by datename(month, order_date)
order by Total_orders desc

---percentage of sales by pizza category--
select pizza_category, sum(total_price) *100/ (select sum(total_price) from pizza_sales) as PCT_Total_sales
from pizza_sales 
group by pizza_category


---percentage of sales by pizza size---
select pizza_size, sum(total_price) as Total_sales, cast(sum(total_price)*100/ (select sum(total_price) from pizza_sales)as decimal(10,2)) as PCT_sales
from pizza_sales
group by  pizza_size
order by PCT_sales desc


---top 5 best sellers by revenue---
select top 5 pizza_name, sum(total_price) as total_sales
from pizza_sales
group by pizza_name
order by total_sales desc

---Top 5 best sellers by total quantity----
select top 5 pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by  pizza_name
order by total_quantity desc

---Top 5 best sellers by total orders---
select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc

---bottom 5 worst sellers by revenue---
select top 5 pizza_name, sum(total_price) as total_sales
from pizza_sales
group by pizza_name
order by total_sales 

--bottom 5 worst sellers by total quantity---
select top 5 pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by  pizza_name
order by total_quantity 

--bottom 5 worst sellers by total orders---
select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders 
























