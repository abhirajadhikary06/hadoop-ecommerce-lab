order_items_raw = LOAD '/bronze/orders/order_items.csv'
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

order_items = FILTER order_items_raw BY order_item_id != 'order_item_id';

STORE order_items
INTO '/bronze/orders/order_items_bronze'
USING PigStorage(',');