"""
Generate products.csv

Columns
-------
product_id
product_name
category
brand
price
cost_price
stock_quantity
supplier
rating
launch_date
"""

import random

import pandas as pd
from tqdm import tqdm

from config import (
    NUM_PRODUCTS,
    PRODUCTS_FILE,
    PRODUCT_CATEGORIES,
)
from utils import (
    product_id,
    random_price,
    random_rating,
    timestamp_str,
    Timer,
)

# ==========================================================
# MASTER DATA
# ==========================================================

BRANDS = [
    "Apple",
    "Samsung",
    "Sony",
    "LG",
    "Nike",
    "Adidas",
    "Puma",
    "Dell",
    "HP",
    "Lenovo",
    "Boat",
    "OnePlus",
    "Philips",
    "Canon",
    "Logitech",
]

PRODUCTS = {
    "Electronics": [
        "Laptop",
        "Smartphone",
        "Headphones",
        "Smart Watch",
        "Keyboard",
        "Mouse",
        "Monitor",
        "Tablet",
        "Camera",
        "Power Bank",
    ],
    "Fashion": [
        "T-Shirt",
        "Jeans",
        "Sneakers",
        "Jacket",
        "Shirt",
        "Watch",
        "Cap",
        "Socks",
    ],
    "Books": [
        "Python Programming",
        "Data Engineering",
        "Machine Learning",
        "Operating Systems",
        "Algorithms",
        "Cloud Computing",
        "Kafka Guide",
    ],
    "Home": [
        "Mixer",
        "Vacuum Cleaner",
        "Microwave",
        "Dining Set",
        "Chair",
        "Table",
        "Curtains",
    ],
    "Sports": [
        "Football",
        "Cricket Bat",
        "Yoga Mat",
        "Dumbbell",
        "Skipping Rope",
    ],
    "Beauty": [
        "Face Wash",
        "Perfume",
        "Shampoo",
        "Hair Oil",
        "Body Lotion",
    ],
    "Toys": [
        "Lego Set",
        "Toy Car",
        "Puzzle",
        "Chess Board",
        "Robot",
    ],
    "Groceries": [
        "Rice",
        "Sugar",
        "Tea",
        "Coffee",
        "Milk Powder",
    ],
}

SUPPLIERS = [
    "ABC Traders",
    "Global Imports",
    "Retail Hub",
    "National Suppliers",
    "Tech Wholesale",
    "Prime Distribution",
    "Metro Supply",
]


# ==========================================================
# GENERATOR
# ==========================================================

def generate_product(index: int):

    category = random.choice(PRODUCT_CATEGORIES)

    item = random.choice(PRODUCTS[category])

    brand = random.choice(BRANDS)

    price = random_price(100, 50000)

    cost = round(price * random.uniform(0.55, 0.85), 2)

    return {

        "product_id": product_id(index),

        "product_name": f"{brand} {item}",

        "category": category,

        "brand": brand,

        "price": price,

        "cost_price": cost,

        "stock_quantity": random.randint(10, 5000),

        "supplier": random.choice(SUPPLIERS),

        "rating": random_rating(),

        "launch_date": timestamp_str(),
    }


# ==========================================================
# MAIN
# ==========================================================

def generate():

    timer = Timer()

    print(f"\nGenerating {NUM_PRODUCTS:,} products...\n")

    rows = []

    for i in tqdm(range(1, NUM_PRODUCTS + 1)):

        rows.append(generate_product(i))

    df = pd.DataFrame(rows)

    df.to_csv(PRODUCTS_FILE, index=False)

    print(f"\nSaved -> {PRODUCTS_FILE}")

    print(df.head())

    timer.stop()


if __name__ == "__main__":
    generate()