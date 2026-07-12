"""
Generate orders.csv

Columns
-------
order_id
customer_id
product_id
order_date
quantity
unit_price
discount
tax
shipping_charge
total_amount
payment_method
order_status
"""

import random

import pandas as pd
from tqdm import tqdm

from config import (
    NUM_ORDERS,
    ORDERS_FILE,
    PAYMENT_METHODS,
    ORDER_STATUS,
)

from config import (
    CUSTOMERS_FILE,
    PRODUCTS_FILE,
)

from utils import (
    order_id,
    timestamp_str,
    Timer,
)

# ==========================================================
# LOAD MASTER DATA
# ==========================================================

customers = pd.read_csv(str(CUSTOMERS_FILE))
products = pd.read_csv(str(PRODUCTS_FILE))

customer_ids = customers["customer_id"].tolist()

product_ids = products["product_id"].tolist()

price_lookup = dict(
    zip(products["product_id"], products["price"])
)

# ==========================================================
# ORDER GENERATOR
# ==========================================================

def generate_order(index):

    product = random.choice(product_ids)

    quantity = random.randint(1, 5)

    unit_price = round(price_lookup[product], 2)

    subtotal = quantity * unit_price

    discount = round(
        subtotal * random.choice([0, 0.05, 0.10, 0.15]),
        2,
    )

    taxable = subtotal - discount

    tax = round(taxable * 0.18, 2)

    shipping = random.choice([0, 40, 60, 80, 120])

    total = round(
        taxable + tax + shipping,
        2,
    )

    return {

        "order_id": order_id(index),

        "customer_id": random.choice(customer_ids),

        "product_id": product,

        "order_date": timestamp_str(),

        "quantity": quantity,

        "unit_price": unit_price,

        "discount": discount,

        "tax": tax,

        "shipping_charge": shipping,

        "total_amount": total,

        "payment_method": random.choice(PAYMENT_METHODS),

        "order_status": random.choice(ORDER_STATUS),
    }


# ==========================================================
# MAIN
# ==========================================================

def generate():

    timer = Timer()

    print(f"\nGenerating {NUM_ORDERS:,} orders...\n")

    rows = []

    for i in tqdm(range(1, NUM_ORDERS + 1)):

        rows.append(
            generate_order(i)
        )

    df = pd.DataFrame(rows)

    df.to_csv(
        ORDERS_FILE,
        index=False,
    )

    print(f"\nSaved -> {ORDERS_FILE}")

    print(df.head())

    print("\nDataset Summary")

    print("-----------------------------")

    print(f"Customers : {len(customer_ids):,}")

    print(f"Products  : {len(product_ids):,}")

    print(f"Orders    : {len(df):,}")

    print("\nOrder Status Distribution")

    print(df["order_status"].value_counts())

    print("\nPayment Method Distribution")

    print(df["payment_method"].value_counts())

    print("\nTop 10 Products")

    print(
        df["product_id"]
        .value_counts()
        .head(10)
    )

    timer.stop()


if __name__ == "__main__":

    generate()