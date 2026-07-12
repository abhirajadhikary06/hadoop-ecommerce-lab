from pathlib import Path

# =====================================================
# PATHS
# =====================================================

BASE_DIR = Path(__file__).parent.parent

OUTPUT_DIR = BASE_DIR / "dataset"
OUTPUT_DIR.mkdir(exist_ok=True)

CUSTOMERS_FILE = OUTPUT_DIR / "customers.csv"
PRODUCTS_FILE = OUTPUT_DIR / "products.csv"
ORDERS_FILE = OUTPUT_DIR / "orders.csv"
CLICKSTREAM_FILE = OUTPUT_DIR / "clickstream.json"
LOG_FILE = OUTPUT_DIR / "application_logs.log"

# =====================================================
# DATASET SIZES
# =====================================================

NUM_CUSTOMERS = 100_000
NUM_PRODUCTS = 5_000
NUM_ORDERS = 1_000_000
NUM_CLICKSTREAM_EVENTS = 2_000_000
NUM_LOG_LINES = 1_500_000

# =====================================================
# RANDOM SEED
# =====================================================

SEED = 42

# =====================================================
# BUSINESS DATA
# =====================================================

CITIES = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Hyderabad",
    "Chennai",
    "Pune",
    "Kolkata",
    "Ahmedabad",
    "Jaipur",
    "Lucknow"
]

STATES = [
    "Maharashtra",
    "Delhi",
    "Karnataka",
    "Telangana",
    "Tamil Nadu",
    "West Bengal",
    "Gujarat",
    "Rajasthan",
    "Uttar Pradesh"
]

PAYMENT_METHODS = [
    "UPI",
    "Credit Card",
    "Debit Card",
    "Net Banking",
    "Wallet",
    "Cash On Delivery"
]

ORDER_STATUS = [
    "PLACED",
    "SHIPPED",
    "DELIVERED",
    "CANCELLED",
    "RETURNED"
]

PRODUCT_CATEGORIES = [
    "Electronics",
    "Fashion",
    "Books",
    "Home",
    "Sports",
    "Beauty",
    "Toys",
    "Groceries"
]

DEVICE_TYPES = [
    "Mobile",
    "Desktop",
    "Tablet"
]

BROWSERS = [
    "Chrome",
    "Firefox",
    "Edge",
    "Safari"
]

LOG_LEVELS = [
    "INFO",
    "WARN",
    "ERROR",
    "DEBUG"
]