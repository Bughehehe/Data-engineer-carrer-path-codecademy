# Example: modularize main steps
from datetime import datetime as dt, time as dtime
from decimal import Decimal
from random import randint, choice
from custom_module import generate_time_travel_message
from dataclasses import dataclass

BASE_COST = Decimal('1000.00')
DESTINATIONS = ["Poland", "Russia", "USA", "Japan", "China"]

@dataclass(init=False)
class TimeObject:
    date: dt.date
    time: dtime

    def __init__(self) -> None:
        current_time = dt.now()
        self.date = current_time.date()
        self.time = current_time.time()


def compute_target_year(base_year: int) -> tuple[int, int]:
    target = randint(base_year - 300, base_year + 300)
    diff = abs(base_year - target)
    return target, diff


def compute_final_cost(base: Decimal, year_diff: int) -> Decimal:
    multiplier = Decimal("1.05") ** year_diff
    return base * multiplier


def main():
    time_class = TimeObject()
    random_target_year, year_diff = compute_target_year(time_class.date.year)
    
    final_cost = compute_final_cost(BASE_COST, year_diff)

    destination = choice(DESTINATIONS)

    message = generate_time_travel_message(random_target_year, destination, final_cost)
    print(message)


if __name__ == '__main__':
    main()