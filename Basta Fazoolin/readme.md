You’ve started a position as the lead programmer for the family-style Italian restaurant Basta Fazoolin’ with My Heart. The restaurant has been doing fantastically and seen a lot of growth lately. You’ve been hired to keep things organized.

### AI feedback:

## Purpose
Does the code do what it's supposed to do?
Your code defines Menu, Franchise, and Business classes and creates several menus and franchises, aligning with the project tasks for Basta Fazoolin'. It demonstrates object creation and basic methods like __repr__ and calculate_bill, which matches the intended functionality.
The code attempts to model menus and availability, which is central to the project. It also includes a calculate_bill method to total purchases, addressing Task 9 and Task 11.

## Readability
Is the code easy to understand?
Nice use of descriptive menu names (Brunch, Early Bird, Dinner, Kids) and clear attribute names. The __repr__ for Franchise helps identify instances.
Some naming consistency and spacing could improve readability (e.g., consistent parameter order in constructors, and uniform indentation). Consider aligning to the project examples for camelCase vs snake_case consistently and adding simple comments for sections.

## Performance
Does the code run efficiently?
The code uses straightforward loops to check availability and calculate bills, which is fine for this project size.
Minor improvement: cache or simplify available_menus by directly filtering with a list comprehension, and avoid printing inside the method unless needed for debugging.