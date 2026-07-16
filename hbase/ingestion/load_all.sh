#!/bin/bash

set -e

./load_top_customers.sh
./load_monthly_sales.sh
./load_payment_analysis.sh
./load_revenue_by_category.sh

echo
echo "=============================="
echo " HBase ingestion completed"
echo "=============================="