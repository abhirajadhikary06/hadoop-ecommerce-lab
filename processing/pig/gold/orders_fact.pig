order_details = LOAD '/silver/orders/order_details_clean'
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

order_items = LOAD '/silver/orders/order_items_clean'
USING PigStorage(',')
AS (
    order_item_id:chararray,
    order_id:chararray,
    product_id:chararray,
    product_name:chararray,
    product_category:chararray,
    quantity:int,
    price_per_unit:double,
    item_total:double
);

joined = JOIN order_details BY order_id,
              order_items BY order_id;

orders_fact = FOREACH joined GENERATE
    order_details::order_id,
    customer_id,
    customer_name,
    customer_email,
    order_date,
    status,
    payment_method,
    shipping_cost,
    total_amount,
    product_id,
    product_name,
    product_category,
    quantity,
    price_per_unit,
    item_total;

STORE orders_fact
INTO '/gold/orders/orders_fact'
USING PigStorage(',');