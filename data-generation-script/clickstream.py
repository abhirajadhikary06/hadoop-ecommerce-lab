"""
Generate clickstream.json

One JSON object per line (JSONL)

Fields
------
event_id
session_id
customer_id
product_id
event_type
device
browser
timestamp
"""

import json
import random

import pandas as pd
from tqdm import tqdm

from config import (
    NUM_CLICKSTREAM_EVENTS,
    CLICKSTREAM_FILE,
    DEVICE_TYPES,
    BROWSERS,
)

from config import (
    CUSTOMERS_FILE,
    PRODUCTS_FILE,
)

from utils import (
    customer_id,
    product_id,
    session_id,
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

EVENT_TYPES = [
    "page_view",
    "search",
    "product_view",
    "add_to_cart",
    "remove_from_cart",
    "wishlist",
    "checkout",
    "purchase",
]

# ==========================================================
# GENERATOR
# ==========================================================

def generate_event(index):

    return {

        "event_id": f"EVT{index:09d}",

        "session_id": session_id(),

        "customer_id": random.choice(customer_ids),

        "product_id": random.choice(product_ids),

        "event_type": random.choice(EVENT_TYPES),

        "device": random.choice(DEVICE_TYPES),

        "browser": random.choice(BROWSERS),

        "timestamp": timestamp_str(),
    }


# ==========================================================
# MAIN
# ==========================================================

def generate():

    timer = Timer()

    print(f"\nGenerating {NUM_CLICKSTREAM_EVENTS:,} events...\n")

    with open(CLICKSTREAM_FILE, "w", encoding="utf-8") as f:

        for i in tqdm(range(1, NUM_CLICKSTREAM_EVENTS + 1)):

            json.dump(generate_event(i), f)

            f.write("\n")

    print(f"\nSaved -> {CLICKSTREAM_FILE}")

    timer.stop()


if __name__ == "__main__":

    generate()