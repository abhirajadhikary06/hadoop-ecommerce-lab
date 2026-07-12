"""
Master Dataset Generator

Runs all dataset generators sequentially.

Output
------
dataset/
    customers.csv
    products.csv
    orders.csv
    clickstream.json
    application_logs.log
"""

from pathlib import Path
import time

import customers
import products
import orders
import clickstream
import application_logs


OUTPUT_DIR = Path("dataset")


def banner(title):
    print("\n" + "=" * 60)
    print(title)
    print("=" * 60)


def generate_all():

    start = time.time()

    OUTPUT_DIR.mkdir(exist_ok=True)

    banner("1. Generating Customers Dataset")
    customers.generate()

    banner("2. Generating Products Dataset")
    products.generate()

    banner("3. Generating Orders Dataset")
    orders.generate()

    banner("4. Generating Clickstream Dataset")
    clickstream.generate()

    banner("5. Generating Application Logs")
    application_logs.generate()

    end = time.time()

    print("\n" + "=" * 60)
    print("ALL DATASETS GENERATED SUCCESSFULLY")
    print("=" * 60)

    print(f"\nOutput Directory : {OUTPUT_DIR.resolve()}")

    print(f"\nTotal Time : {end-start:.2f} seconds\n")


if __name__ == "__main__":

    generate_all()