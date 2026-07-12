"""
Common utility functions used by all dataset generators.
"""

from __future__ import annotations

import json
import random
import string
from datetime import datetime, timedelta

import numpy as np
from faker import Faker

from config import SEED

# ==========================================================
# RANDOM INITIALIZATION
# ==========================================================

fake = Faker("en_IN")
Faker.seed(SEED)
random.seed(SEED)
np.random.seed(SEED)

# ==========================================================
# DATE UTILITIES
# ==========================================================

START_DATE = datetime(2023, 1, 1)
END_DATE = datetime(2025, 12, 31)


def random_datetime(start=START_DATE, end=END_DATE) -> datetime:
    """
    Return a random datetime between start and end.
    """
    delta = end - start
    seconds = random.randint(0, int(delta.total_seconds()))
    return start + timedelta(seconds=seconds)


def timestamp_str() -> str:
    """
    ISO timestamp.
    """
    return random_datetime().strftime("%Y-%m-%d %H:%M:%S")


# ==========================================================
# ID GENERATORS
# ==========================================================

def customer_id(index: int) -> str:
    return f"CUST{index:07d}"


def product_id(index: int) -> str:
    return f"PROD{index:06d}"


def order_id(index: int) -> str:
    return f"ORD{index:09d}"


def session_id(length: int = 16) -> str:
    return ''.join(
        random.choices(string.ascii_uppercase + string.digits, k=length)
    )


# ==========================================================
# RANDOM HELPERS
# ==========================================================

def random_price(min_price=50, max_price=100000) -> float:
    return round(random.uniform(min_price, max_price), 2)


def random_quantity(min_qty=1, max_qty=5) -> int:
    return random.randint(min_qty, max_qty)


def random_rating() -> int:
    return random.randint(1, 5)


def random_probability(probability: float) -> bool:
    """
    Example:
        random_probability(0.15)
        -> True 15% of the time
    """
    return random.random() < probability


# ==========================================================
# CUSTOMER HELPERS
# ==========================================================

def full_name() -> str:
    return fake.name()


def email(name: str) -> str:
    username = (
        name.lower()
        .replace(" ", ".")
        .replace("'", "")
    )
    number = random.randint(10, 9999)
    return f"{username}{number}@example.com"


def phone() -> str:
    return fake.phone_number()


def address() -> str:
    return fake.address().replace("\n", ", ")


# ==========================================================
# JSON WRITER
# ==========================================================

def write_json_line(file, data: dict):
    """
    Write one JSON object per line.
    """
    file.write(json.dumps(data))
    file.write("\n")


# ==========================================================
# FILE SIZE
# ==========================================================

def human_size(num_bytes: int) -> str:

    units = ["B", "KB", "MB", "GB", "TB"]

    size = float(num_bytes)

    for unit in units:

        if size < 1024:
            return f"{size:.2f} {unit}"

        size /= 1024

    return f"{size:.2f} PB"


# ==========================================================
# TIMER
# ==========================================================

class Timer:

    def __init__(self):
        self.start = datetime.now()

    def stop(self):

        elapsed = datetime.now() - self.start

        print(f"\nCompleted in {elapsed}\n")