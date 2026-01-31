hairstyles = ["bouffant", "pixie", "dreadlocks", "crew", "bowl", "bob", "mohawk", "flattop"]

prices = [30, 25, 40, 20, 20, 35, 50, 35]

last_week = [2, 3, 5, 8, 4, 4, 6, 2]

######################################

total_price = sum(price for price in prices)

average_price = total_price / len(prices)

print(f"Average Haircut Price: {average_price}")

new_prices = list(price - 5 for price in prices)

print("New prices:", new_prices)

#######################################

total_revenue = 0

for i in range(len(hairstyles)):
    total_revenue += prices[i] * last_week[i]

print(f"Total Revenue: {total_revenue}")

average_daily_revenue = total_revenue / 7 # 7 days of week

cuts_under_30 = list(hairstyles[i] for i in range(len(new_prices)) if new_prices[i] < 30)

print(f"List of hairstyles under 30:", cuts_under_30)