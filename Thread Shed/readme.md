You’ve recently been hired as a cashier at the local sewing hobby shop, Thread Shed. Some of your daily responsibilities involve tallying the number of sales during the day, calculating the total amount of money made, and keeping track of the names of the customers.

Unfortunately, the Thread Shed has an extremely outdated register system and stores all of the transaction information in one huge unwieldy string called daily_sales.

All day, for each transaction, the name of the customer, amount spent, types of thread purchased, and the date of sale is all recorded in this same string. Your task is to use your Python skills to iterate through this string and clean up each transaction and store all the information in easier-to-access lists.

# AI FEEDBACK

### Purpose
Does the code do what it's supposed to do?
The code correctly parses the daily_sales string into transactions, extracts customers, sales, and thread_sold, and computes total sales. It also counts colors sold and prints color tallies, matching key tasks of the project.
Good implementation of replacing the artifact and splitting by comma to form daily_transactions, then further splitting and trimming data to clean transactions.
Overall, the script runs through the intended tasks and produces per-color sale counts. Consider edge-case handling if data formats shift slightly.
Readability
### Is the code easy to understand?
Variable names are generally descriptive (daily_sales, daily_transactions, transactions_clean, etc.).
Code blocks are straightforward, but some lines are long and could be broken into smaller helpers for readability.
Commenting is minimal; adding short comments per task step would aid comprehension.
Performance
### Does the code run efficiently?
The data processing is linear and clear; no obvious performance bottlenecks for this dataset.
Color counting function is simple and correct; consider using a Counter from collections if expanding counting in the future.
Minor improvement: reuse the color_count function signature to accept the color_list as an argument (already done); ensure function is used consistently for future extensions.