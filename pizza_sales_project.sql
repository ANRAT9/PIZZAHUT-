--Calculate the total revenue generated from pizza sales.

select round(sum(order_details.quantity * pizzas.price)::numeric,2) AS total_revenue
from order_details join pizzas
on order_details.pizza_id = pizzas.pizza_id


---Identify the highest-priced pizza.
select pizza_type.pizza_name, pizzas.price
from pizza_type join pizzas
on pizza_type.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc







--Join the necessary tables to find the total quantity of each pizza category ordered.

Select category, sum(quantity) 
from pizza_type
join pizzas 
on pizzas.pizza_type_id = pizza_type.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id 
group by category

--Determine the distribution of orders by hour of the day.

Select extract(hour from order_time)as orde, count(orders.order_id)
from orders
join order_details
on order_details.order_id =orders.order_id
group by orde

--Join relevant tables to find the category-wise distribution of pizzas.
select category, count(pizza_type_id)
from pizza_type
group by category

--Determine the top 3 most ordered pizza types based on revenue.

select pizza_name, sum(order_details.quantity*pizzas.price) as total_revenue
from pizza_type join pizzas
on pizza_type.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_name
order by total_revenue desc
limit 3