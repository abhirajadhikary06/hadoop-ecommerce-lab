order_details = LOAD '/bronze/orders/order_details_bronze'
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

-- Remove null IDs
order_details = FILTER order_details BY
    order_id IS NOT NULL AND
    customer_id IS NOT NULL;

-- Remove invalid amounts
order_details = FILTER order_details BY
    total_amount >= 0.0 AND
    shipping_cost >= 0.0;

-- Standardize text
order_details = FOREACH order_details GENERATE
    TRIM(order_id) AS order_id,
    TRIM(customer_id) AS customer_id,
    TRIM(customer_name) AS customer_name,
    TRIM(customer_email) AS customer_email,
    order_date,
    total_amount,
    LOWER(TRIM(status)) AS status,
    TRIM(shipping_address) AS shipping_address,
    TRIM(payment_method) AS payment_method,
    shipping_cost;

-- Remove duplicates
order_details = DISTINCT order_details;

STORE order_details
INTO '/silver/orders/order_details_clean'
USING PigStorage(',');


