-- Create restaurant table
CREATE TABLE restaurant (
    id integer PRIMARY KEY,
    name varchar(20),
    description varchar(100),
    rating decimal,
    telephone char(10),
    hours varchar(100)
);

-- Create address table
CREATE TABLE address (
    id integer PRIMARY KEY,
    street_number varchar(10),
    street_name varchar(20),
    city varchar(20),
    state varchar(15),
    google_map_link varchar(50),
    restaurant_id integer REFERENCES restaurant(id) UNIQUE
);

-- Create category table
CREATE TABLE category (
    id varchar(2) PRIMARY KEY,
    name varchar(20),
    description varchar(200)
);

-- Create dish table
CREATE TABLE dish (
    id integer PRIMARY KEY,
    name varchar(50),
    description varchar(200),
    hot_and_spicy boolean
);

-- Create review table
CREATE TABLE review (
    id integer PRIMARY KEY,
    rating decimal,
    description varchar(100),
    date date,
    restaurant_id integer REFERENCES restaurant(id)
);

-- Create cross reference table
CREATE TABLE categories_dishes (
    category_id varchar(2) REFERENCES category(id),
    dish_id integer REFERENCES dish(id),
    price money,
    PRIMARY KEY (category_id, dish_id)
);

-- DROP TABLES
DROP TABLE address;
DROP TABLE restaurant;
DROP TABLE category;
DROP TABLE dish;
DROP TABLE review;
DROP TABLE categories_dishes;

