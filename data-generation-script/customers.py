"""
Generate customers.csv

Columns
-------
customer_id
full_name
email
phone
gender
age
city
state
address
registration_date
loyalty_points
"""

import random

import pandas as pd
from tqdm import tqdm

from config import (
    NUM_CUSTOMERS,
    CUSTOMERS_FILE,
    CITIES,
    STATES,
)
from utils import (
    fake,
    full_name,
    email,
    phone,
    address,
    customer_id,
    timestamp_str,
    Timer,
)

GENDERS = ["Male", "Female", "Other"]


def generate_customer(index: int) -> dict:

    name = full_name()

    return {
        "customer_id": customer_id(index),
        "full_name": name,
        "email": email(name),
        "phone": phone(),
        "gender": random.choice(GENDERS),
        "age": random.randint(18, 75),
        "city": random.choice(CITIES),
        "state": random.choice(STATES),
        "address": address(),
        "registration_date": timestamp_str(),
        "loyalty_points": random.randint(0, 10000),
    }


def generate():

    timer = Timer()

    print(f"\nGenerating {NUM_CUSTOMERS:,} customers...\n")

    customers = []

    for i in tqdm(range(1, NUM_CUSTOMERS + 1)):

        customers.append(generate_customer(i))

    df = pd.DataFrame(customers)

    df.to_csv(CUSTOMERS_FILE, index=False)

    print(f"\nSaved -> {CUSTOMERS_FILE}")

    print(df.head())

    timer.stop()


if __name__ == "__main__":
    generate()