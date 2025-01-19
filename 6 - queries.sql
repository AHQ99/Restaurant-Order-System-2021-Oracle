/*
-- Data  Retrieval Queries
/*

/*
1. Use of the BETWEEN logical operator
see all orders with order value between 200 and 250
*/

select 
    orderid, orderdate, firstname || ' ' || lastname customer_name, ordertotal 
from 
    saleorder join customer using (customerid)
where 
    ordertotal between 200 and 250
;
 
/* 
2. example of DISTINCT
list all customers who bought ‘Classic Cheeseburger’ during February, 2021
*/

select distinct
    customerid,
    firstname || ' ' || lastname customer_name
from 
    saleorder 
    join customer using (customerid)
    join orderitem using (orderid)
    join menuitem using (itemid)
where 	
    itemname = 'Classic Cheeseburger'
    and extract( year from orderdate ) = 2021
    and extract( month from orderdate ) = 2
order by customer_name
;
 
/* 
3. TO_CHAR function
display number of orders and sales during each month
*/

select to_char(orderdate, 'MON') Month, COUNT(orderid) number_of_orders, SUM(ordertotal) sales
from saleorder
group by extract(month from orderdate), to_char(orderdate, 'MON')
order by extract(month from orderdate)
 
/*
4. aggregate function in select list
display total sales per customer
*/

select customerid, firstname || ' ' || lastname customer_name, sum(ordertotal) sales
from customer left join saleorder using (customerid)
group by customerid, firstname, lastname
order by sales desc
 
/*
5. GROUP BY command
display total sales per item
*/

select itemid, itemname, sum(price * quantity) sales
from menuitem left outer join orderitem using (itemid)
group by itemid, itemname
order by sales desc
 
/*
6. SUBUERY
select top 5 selling items
*/

select * from
(
select itemid, itemname, count(*) num_orders
from menuitem left join orderitem using (itemid)
group by itemid, itemname
order by num_orders desc
) where rownum <= 5
order by num_orders, itemname
;

/*
7. Join and aggregate multiple tables
Most selling category
*/
select  categoryname,
        round(avg(price),2) average_price, 
        round(sum(quantity),2) total_units_sold,
        round(sum(price*quantity),2) total_sales
from category join menuitem using (categoryid)
join orderitem using (itemid)
group by categoryname
order by total_sales desc
;

/*
8. Join with Subquery, and apply limit
Most ordered single item by a customer
*/

select firstname || ' ' || lastname customername, itemname, most_ordered 
from 
(
select  customerid, itemname, sum(quantity) most_ordered
from    orderitem join saleorder using (orderid) 
        join menuitem using (itemid)
group by customerid, itemname
order by most_ordered desc
) sales join customer using (Customerid)
where rownum = 1
