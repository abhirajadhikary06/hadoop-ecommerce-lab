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

grp = GROUP orders_fact BY payment_method;

payment_analysis = FOREACH grp GENERATE
    group AS payment_method,
    COUNT(orders_fact) AS total_orders,
    SUM(orders_fact.item_total) AS total_revenue;

STORE payment_analysis
INTO '/gold/orders/payment_analysis'
USING PigStorage(',');