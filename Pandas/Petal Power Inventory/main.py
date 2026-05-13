import pandas as pd
from pathlib import Path

combine_lambda = lambda row: \
    '{} - {}'.format(row.product_type,
                     row.product_description)


csv_path = Path('Pandas/Petal Power Inventory/inventory.csv')

inventory = pd.read_csv(csv_path)

staten_island = inventory.head(10)

product_request = staten_island.product_description

seed_request = inventory[(inventory.product_type == "seeds") & (inventory.location == "Brooklyn")]

inventory['in_stock'] = inventory.quantity > 0

inventory['total_value'] = inventory.price * inventory.quantity

inventory['full_desctiption'] = inventory.apply(combine_lambda, axis=1)

print(inventory)