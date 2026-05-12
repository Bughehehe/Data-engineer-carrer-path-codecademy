-- Get best review
SELECT MAX(rating) FROM review;

-- Display a dish name, its price and category sorted by the dish name
SELECT
    dish.name AS dish_name, 
    categories_dishes.price, 
    category.id AS category
FROM
    categories_dishes, dish, category
WHERE
    categories_dishes.category_id = category.id
AND
    categories_dishes.dish_id = dish.id
ORDER BY
    dish_name ASC;

-- Unique dish
SELECT
    id AS dish_id,
    COUNT(id) AS dish_count
FROM dish
GROUP BY
    id
