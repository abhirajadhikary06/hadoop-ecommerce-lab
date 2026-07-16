order_items = LOAD '/bronze/orders/order_items_bronze'
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

-- Remove null IDs
order_items = FILTER order_items BY
    order_item_id IS NOT NULL AND
    order_id IS NOT NULL AND
    product_id IS NOT NULL;

-- Remove invalid numeric values
order_items = FILTER order_items BY
    quantity > 0 AND
    price_per_unit > 0.0 AND
    item_total > 0.0;

-- Standardize text
order_items = FOREACH order_items GENERATE
    TRIM(order_item_id) AS order_item_id,
    TRIM(order_id) AS order_id,
    TRIM(product_id) AS product_id,
    TRIM(product_name) AS product_name,
    TRIM(product_category) AS product_category,
    quantity,
    price_per_unit,
    item_total;

-- Remove duplicates
order_items = DISTINCT order_items;

STORE order_items
INTO '/silver/orders/order_items_clean'
USING PigStorage(',');