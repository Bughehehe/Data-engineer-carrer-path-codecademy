import datetime as dt

class Menu:
    def __init__(self, name, items, start_time, end_time):
        self.name = name
        self.items = items
        self.start_time = start_time
        self.end_time = end_time

    def is_available(self, at_time=None):
        if at_time is None:
            at_time = dt.datetime.now().time()
        return self.start_time <= at_time <= self.end_time

    def __repr__(self):
        menu_status = "available" if self.is_available() else "unavailable"
        return f"Menu name is {self.name}. This menu is currently {menu_status}. Open from {self.start_time} to {self.end_time}"
    
    def calculate_bill(self, purchased_items):
        bill = 0
        for item in purchased_items:
            try:
                bill += self.items[item]
            except:
                print(f"No item {item} in menu.")
        return bill

brunch = Menu(
    name = "Brunch",
    items = {'pancakes': 7.50, 'waffles': 9.00, 'burger': 11.00, 'home fries': 4.50, 'coffee': 1.50, 'espresso': 3.00, 'tea': 1.00, 'mimosa': 10.50, 'orange juice': 3.50},
    start_time = dt.time(11),
    end_time = dt.time(16)
)

early_bird = Menu(
    name = "Early Bird",
    items = {'salumeria plate': 8.00, 'salad and breadsticks (serves 2, no refills)': 14.00, 'pizza with quattro formaggi': 9.00, 'duck ragu': 17.50, 'mushroom ravioli (vegan)': 13.50, 'coffee': 1.50, 'espresso': 3.00},
    start_time = dt.time(15),
    end_time = dt.time(18)
)

dinner = Menu(
    name = "Dinner",
    items = {'crostini with eggplant caponata': 13.00, 'caesar salad': 16.00, 'pizza with quattro formaggi': 11.00, 'duck ragu': 19.50, 'mushroom ravioli (vegan)': 13.50, 'coffee': 2.00, 'espresso': 3.00},
    start_time = dt.time(17),
    end_time = dt.time(23)
)

kids = Menu(
    name = "Kids",
    items = {'chicken nuggets': 6.50, 'fusilli with wild mushrooms': 12.00, 'apple juice': 3.00},
    start_time = dt.time(11),
    end_time = dt.time(21)
)

class Franchise:
    def __init__(self, address, menu):
        self.address = address
        self.menu = menu

    def __repr__(self):
        return f"Restaurant is at {self.address}"
    
    def available_menus(self, time = None):
        ava_menus = []
        for item in self.menu:
            if item.is_available(time):
                ava_menus.append(item)
        print(f"Available menus for time {time if time else dt.datetime.now().time()}")
        [print(menu.name) for menu in ava_menus]
        return ava_menus

flagship_store = Franchise(
    address= "1232 West End Road",
    menu= [brunch, early_bird, dinner, kids]
)

new_installment = Franchise(
    address= "12 East Mulberry Street",
    menu= [brunch, early_bird, dinner, kids]
)

class Business:
    def __init__(self, name, franchise):
        self.name = name
        self.franchise = franchise

flagship_store = Business(
    name = "Basta Fazoolin' with my Heart",
    franchise= [flagship_store, new_installment]
)

arepa = Menu(
    name = "Take a’ Arepa",
    items = {'arepa pabellon': 7.00, 'pernil arepa': 8.50, 'guayanes arepa': 8.00, 'jamon arepa': 7.50},
    start_time = dt.time(10),
    end_time = dt.time(22)
)

arepas_place = Franchise(
    address= "189 Fitzgerald Avenue",
    menu= [arepa]
)

flagship_business = Business(
    name = "Take a' Arepa",
    franchise= [arepas_place]
)