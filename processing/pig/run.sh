#!/bin/bash

set -e

echo "======================================"
echo "Running Bronze Layer"
echo "======================================"

pig /workspace/processing/pig/bronze/load_order_details.pig
pig /workspace/processing/pig/bronze/load_order_items.pig

echo ""
echo "======================================"
echo "Running Silver Layer"
echo "======================================"

pig /workspace/processing/pig/silver/clean_order_details.pig
pig /workspace/processing/pig/silver/clean_order_items.pig

echo ""
echo "======================================"
echo "Running Gold Layer"
echo "======================================"

pig /workspace/processing/pig/gold/orders_fact.pig
pig /workspace/processing/pig/gold/top_customers.pig
pig /workspace/processing/pig/gold/revenue_by_category.pig
pig /workspace/processing/pig/gold/payment_analysis.pig
pig /workspace/processing/pig/gold/monthly_sales.pig

echo ""
echo "======================================"
echo "Pig ETL Pipeline Completed Successfully"
echo "======================================"