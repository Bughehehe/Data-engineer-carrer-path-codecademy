import pandas as pd

visits = pd.read_csv('Pandas/Page Visits Funnel/visits.csv', parse_dates=[1])
cart = pd.read_csv('Pandas/Page Visits Funnel/cart.csv', parse_dates=[1])
checkout = pd.read_csv('Pandas/Page Visits Funnel/checkout.csv', parse_dates=[1])
purchase = pd.read_csv('Pandas/Page Visits Funnel/purchase.csv', parse_dates=[1])

# print(visits.head())
# print(cart.head())
# print(checkout.head())
# print(purchase.head())

visit_cart = visits.merge(cart, how='left')

# How many null
visit_cart_nulls = visit_cart.isna().sum()
# print(visit_cart_nulls)
# print(visit_cart_nulls / visit_cart.shape[0] * 100)

checkout_purchase = checkout.merge(purchase, how='left')
checkout_purchase_null = checkout_purchase.isna().sum()
# print(checkout_purchase_null)
# print(checkout_purchase_null / checkout_purchase.shape[0] * 100)

all_data = visit_cart.merge(checkout_purchase, how='left')

# print(all_data.head())

users_checkout_no_purchase = all_data[(~all_data.checkout_time.isna()) & all_data.purchase_time.isna()]

# Percentage of users checkout and not purchase

# print(users_checkout_no_purchase.shape[0] / all_data.shape[0] * 100)

all_data['time_diff'] = all_data.purchase_time - all_data.visit_time

print(all_data.head())

mean_time = all_data.time_diff.mean()

print(mean_time)

