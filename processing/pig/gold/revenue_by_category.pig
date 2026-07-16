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

grp = GROUP orders_fact BY product_category;

category_sales = FOREACH grp GENERATE
    group AS product_category,
    SUM(orders_fact.item_total) AS revenue,
    SUM(orders_fact.quantity) AS total_quantity,
    COUNT(orders_fact) AS total_orders;

STORE category_sales
INTO '/gold/orders/revenue_by_category'
USING PigStorage(',');