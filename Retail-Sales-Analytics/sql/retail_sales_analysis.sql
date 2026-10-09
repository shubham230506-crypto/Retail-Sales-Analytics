select count(*) as sales_rows
from factsales;

select count(distinct OrderID) as unique_orders 
from factsales;

select count(*) as customers 
from DimCustomers;

select count(*) as products 
from DimProducts;

select count(*) as stores 
from DimStores;


select 
sum(Quantity * UnitPrice * (1-DiscountPct)) as Gross_Revenue,
sum(Quantity * UnitPrice * (1-DiscountPct) - (Quantity * UnitCost)) as Gross_Profit,
count(distinct OrderID) as Unique_orders,
count(distinct CustomerID) as Unique_customers,
sum(Quantity * UnitPrice * (1-DiscountPct)) / count(distinct OrderID)  as Average_Order_Value
from factsales;


select 
p.category,
SUM(f.Quantity* f.UnitPrice*(1- f.DiscountPct)) as Gross_Revenue,
sum((f.Quantity* f.UnitPrice*(1- f.DiscountPct)) - (f.Quantity* f.UnitCost)) as Gross_Profit,
count(distinct f.OrderID) as Unique_order
from factsales as f
inner join dimproducts as p
   on f.ProductID = p.ProductID
group by p.category
order by Gross_Revenue desc;

select 
p.ProductName, p.category,
SUM(f.Quantity* f.UnitPrice*(1- f.DiscountPct)) as Gross_Revenue,
sum((f.Quantity* f.UnitPrice*(1- f.DiscountPct)) - (f.Quantity* f.UnitCost)) as Gross_Profit,
count(distinct f.OrderID) as Unique_order
from factsales as f
inner join dimproducts as p
   on f.ProductID = p.ProductID
group by p.ProductName, p.category
order by Gross_Revenue desc
limit 5;

select 
s.city, 
SUM(f.Quantity* f.UnitPrice*(1- f.DiscountPct)) as Gross_Revenue,
sum((f.Quantity* f.UnitPrice*(1- f.DiscountPct)) - (f.Quantity* f.UnitCost)) as Gross_Profit,
count(distinct f.OrderID) as Unique_order
from factsales as f
inner join dimstores as s
   on s.StoreID = f.StoreID
group by s.City
order by Gross_Revenue desc;

select 
c.Segment, 
SUM(f.Quantity* f.UnitPrice*(1- f.DiscountPct)) as Gross_Revenue,
sum((f.Quantity* f.UnitPrice*(1- f.DiscountPct)) - (f.Quantity* f.UnitCost)) as Gross_Profit,
count(distinct f.OrderID) as Unique_order,
count(distinct f.CustomerID) as Unique_customer
from factsales as f
inner join dimcustomers as c
   on c.CustomerID = f.CustomerID
group by c.Segment
order by Gross_Revenue desc;

select 
date_format(orderDate, '%y-%m') as month, 
SUM(Quantity* UnitPrice*(1-DiscountPct)) as Gross_Revenue,
sum((Quantity* UnitPrice*(1- DiscountPct)) - (Quantity* UnitCost)) as Gross_Profit,
count(distinct OrderID) as Unique_order
from factsales 
group by month
order by Gross_Revenue desc;

select 
Returned, 
SUM(Quantity* UnitPrice*(1-DiscountPct)) as Gross_Revenue,
sum((Quantity* UnitPrice*(1- DiscountPct)) - (Quantity* UnitCost)) as Gross_Profit,
count(*) as line_count,
count(distinct OrderID) as Unique_order
from factsales 
group by Returned;

select 
DiscountPct, 
SUM(Quantity* UnitPrice*(1-DiscountPct)) as Gross_Revenue,
sum((Quantity* UnitPrice*(1- DiscountPct)) - (Quantity* UnitCost)) as Gross_Profit,
count(*) as line_count,
count(distinct OrderID) as Unique_order
from factsales 
group by DiscountPct
order by DiscountPct;

select 
Channel, 
SUM(Quantity* UnitPrice*(1-DiscountPct)) as Gross_Revenue,
sum((Quantity* UnitPrice*(1- DiscountPct)) - (Quantity* UnitCost)) as Gross_Profit,
count(distinct OrderID) as Unique_orders,
count(distinct CustomerID) as Unique_customers
from factsales 
group by Channel
order by Gross_Revenue desc;