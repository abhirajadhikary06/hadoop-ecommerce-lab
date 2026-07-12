"""
Generate application_logs.log
"""

import random

from tqdm import tqdm

from config import (
    NUM_LOG_LINES,
    LOG_FILE,
    LOG_LEVELS,
)

from utils import (
    timestamp_str,
    Timer,
)

SERVICES = [
    "auth-service",
    "order-service",
    "payment-service",
    "inventory-service",
    "shipping-service",
    "notification-service",
]

MESSAGES = [
    "User login successful",
    "Order created",
    "Payment completed",
    "Inventory updated",
    "Shipment dispatched",
    "Product viewed",
    "Database connection established",
    "Cache refreshed",
    "Authentication failed",
    "Payment gateway timeout",
    "Kafka message published",
    "Kafka message consumed",
    "Request completed",
]

# ==========================================================
# GENERATOR
# ==========================================================

def generate_log():

    return (
        f"{timestamp_str()} "
        f"[{random.choice(LOG_LEVELS)}] "
        f"{random.choice(SERVICES)} - "
        f"{random.choice(MESSAGES)}"
    )


# ==========================================================
# MAIN
# ==========================================================

def generate():

    timer = Timer()

    print(f"\nGenerating {NUM_LOG_LINES:,} log lines...\n")

    with open(LOG_FILE, "w", encoding="utf-8") as f:

        for _ in tqdm(range(NUM_LOG_LINES)):

            f.write(generate_log())

            f.write("\n")

    print(f"\nSaved -> {LOG_FILE}")

    timer.stop()


if __name__ == "__main__":

    generate()