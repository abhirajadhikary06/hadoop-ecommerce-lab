orders_fact = LOAD '/gold/orders/orders_fact'
USING PigStorage(',')
AS (
    order_id:chararray,
    customer_id:chararray,
    customer_name:chararray,
    customer_email:chararray,
    order_date:chararray,
    status:chararray,
    payment_method:chararray,
    shipping_cost:double,
    total_amount:double,
    product_id:chararray,
    product_name:chararray,
    product_category:chararray,
    quantity:int,
    price_per_unit:double,
    item_total:double
);

sales = FOREACH orders_fact GENERATE
    SUBSTRING(order_date,0,7) AS month,
    item_total;

grp = GROUP sales BY month;

monthly_sales = FOREACH grp GENERATE
    group AS month,
    SUM(sales.item_total) AS revenue;

STORE monthly_sales
INTO '/gold/orders/monthly_sales'
USING PigStorage(',');