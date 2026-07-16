orders_details_raw = LOAD '/bronze/orders/order_details.csv'
USING PigStorage(',')
AS (
    order_id:chararray,
    customer_id:chararray,
    customer_name:chararray,
    customer_email:chararray,
    order_date:chararray,
    total_amount:double,
    status:chararray,
    shipping_address:chararray,
    payment_method:chararray,
    shipping_cost:double
);

orders_details = FILTER orders_details_raw BY order_id != 'order_id';

STORE orders_details
INTO '/bronze/orders/order_details_bronze'
USING PigStorage(',');