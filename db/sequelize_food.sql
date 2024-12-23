-- BUOI 3 - BAI TAP CHINH
-- create database app_food

create database if not exists app_food_XVT;

-- let system know we are using database app_food;
use app_food_XVT;

-- create users table
CREATE TABLE users (
    users_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    passwords VARCHAR(255) NOT NULL
);

-- create food-type table
create table food_type(
	type_id int primary key auto_increment,
    type_name varchar(255)
);

-- create food table
create table food(
	food_id int auto_increment primary key,
    food_name varchar(255),
    image varchar(255),
    price float,
    des varchar(255),
    type_id int,
    foreign key (type_id) references food_type(type_id)
);


-- create sub-food table
create table sub_food(
	sub_id int primary key auto_increment,
    sub_name varchar(255),
    sub_price float,
    food_id int,
    foreign key (food_id) references food(food_id)

);


-- create orders table
create table orders(
	orders_id int primary key auto_increment,
    users_id int,
    food_id int,
	foreign key (users_id) references users(users_id),
    foreign key (food_id) references food(food_id),
    amount int,
    orders_code varchar(255),
    arr_sub_id varchar(255)
);


-- create restaurant table
create table restaurant(
	res_id int primary key auto_increment,
    res_name varchar(255),
    image varchar(255),
    desription varchar(255)
);


-- create like-res table
create table like_res(
	users_id int,
    res_id int,
	foreign key (users_id) references users(users_id),
    foreign key ( res_id) references restaurant(res_id),
    date_like datetime
);

-- create rate_res table
create table rate_res(
	users_id int,
    foreign key (users_id) references users(users_id),
    res_id int,
    foreign key (res_id) references restaurant(res_id),
    amount int,
    date_rate datetime

);

-- insert data into users table
insert into users(full_name, email, passwords) values 
("Donald Trump", "trump@gmail.com", "12345678"),
("Tony Blair", "tony@gmail.com", "12345678"),	
("Elon Musk", "elon@gmail.com", "12345678"),
("Phan Tu", "tu@gmail.com", "12345678"),
("Tran Hung Dao", "dao@gmail.com", "12345678"),
("George Bush", "george@gmail.com", "12345678"),
("Tong Khanh Linh", "linh@gmail.com", "12345678"),
("Nguyen Trai", "ntrai@gmail.com", "12345678"),
("David Beckham", "beckham@gmail.com", "12345678"),
("Nadald Jr", "nadal@gmail.com", "12345678"),
("Ronaldo Jr", "r9@gmail.com", "12345678"),
("David Becker", "becker@gmail.com", "12345678"),
("Vladimir Putin", "putin@gmail.com", "12345678"),
("Garry George", "garry@gmail.com", "12345678"),
("Kate George", "kate@gmail.com", "12345678")
;

insert into users(full_name, email, passwords) values 
("Tam Can Binh", "trump@gmail.com", "12345678"),
("Truong My Hoa", "tony@gmail.com", "12345678"),	
("Nguyen Tan Dung", "elon@gmail.com", "12345678"),
("Ho Hao Hon", "tu@gmail.com", "12345678")
;


-- insert data into food_type table

insert into food_type(type_name) values
("Thai"),("Italian"),("Chinese"),("Mexican"),("Japanese"),("French"),("Vietnamese")
;

-- insert data into food table
insert into food(food_name, image, price, des, type_id) values
("Pho", "pho.jpg", 20, "A Vietnamese classic with rich, spiced broth, silky rice noodles, and your choice of beef, chicken, or tofu.", 7),
("Hue Beef Noodle", "bun-bo-hue.jpg", 15, "A bold and flavorful Vietnamese soup with a spicy, lemongrass-infused broth, thick rice noodles, and tender beef slices. ", 7),
("Banh Mi","banh-mi.jpg", 35, "A delicious fusion of French and Vietnamese cuisine, Bánh Mì features a crisp baguette filled with savory meats, fresh cucumbers, pickled vegetables, cilantro, and a touch of chili and mayo. ", 7),
("Com Suon", "com-suon.jpg", 45, "A classic Vietnamese dish featuring tender, flavorful grilled pork chops served over steamed jasmine rice. Accompanied by fresh cucumbers, pickled vegetables, and a side of savory fish sauce",7)

;

-- insert data into sub_food table

insert into sub_food(sub_name, sub_price, food_id) values
("Silver 1", 100, 1),
("Silver 2", 200, 1),
("Silver 3", 300, 1),
("Gold 1", 400, 2),
("Gold 2", 500, 2),
("Gold 3", 600, 3),
("Diamond", 700, 4)

;

-- insert data into orders table

insert into orders(users_id, food_id, amount, orders_code, arr_sub_id) values
(1, 1, 3, "153", "box1"),
(1, 2, 4, "164", "box1"),
(1, 3, 5, "175", "box1"),
(1, 4, 6, "186", "box1"),

(2, 1, 1, "153", "box1"),
(2, 2, 2, "262", "box1"),
(2, 2, 1, "271", "box1"),
(2, 3, 1, "281", "box1"),

(3, 3, 2, "312", "box1"),
(3, 4, 2, "3122", "box1"),

(4, 2, 1, "451", "box1"),
(4, 3, 1, "4511", "box1"),

(5, 4, 4, "554", "box1"),
(5, 3, 4, "5541", "box1"),

(6, 2, 5, "6151", "box1"),
(6, 3, 5, "655", "box1"),
(6, 4, 5, "6551", "box1"),

(7, 3, 1, "7311", "box1"),
(7, 4, 1, "7211", "box1"),
(7, 4, 1, "7411", "box1"),

(8, 3, 3, "823", "box1"),
(8, 2, 3, "853", "box1"),
(8, 2, 3, "863", "box1"),

(9, 1, 7, "917", "box1"),
(9, 3, 7, "937", "box1"),
(9, 4, 7, "977", "box1"),

(10, 3, 5, "1015", "box1"),
(10, 3, 5, "1025", "box1"),
(10, 4, 5, "1045", "box1"),

(11, 1, 3, "1153", "box1"),
(12, 2, 67, "12667", "box1"),
(12, 1, 3, "1283", "box1")
;

-- insert data into restaurant table
insert into restaurant(res_name, image, desription) values
("Song Que", "songque-jpg", " Song que is the best restaurant in New Town"),
(" Lac Hong  ", "lachong-jpg", " Lac Hong is the best restaurant in New Town"),
("Tan Hai Van", "tanhaivan-jpg", " Tan Hai Van is the best restaurant in New Town"),
("Hoa Hong", "hoahong-jpg", " Hoa Hong is the best restaurant in New Town"),
("Lac Que", "lacque-jpg", " Lac Que is the best restaurant in New Town"),
("Ha Noi Quan", "hanoiquan-jpg", " Ha Noi Quan is the best restaurant in New Town"),
("Suong Mai", "suongmai-jpg", " Suong Mai is the best restaurant in New Town"),
("Ben Song Que", "bensongque-jpg", " Ben Song que is the best restaurant in New Town"),
("Ha Noi Pho", "hanoipho-jpg", " Ha Noi PHo is the best restaurant in New Town"),
("Song", "song-jpg", " Song  is the best restaurant in New Town")

;

-- insert data into like_res table
insert into like_res(users_id, res_id, date_like) values
(1, 1, '2024-02-22'),
(1, 2, '2024-02-22'),
(1, 4, '2024-02-22'),

(2, 1, '2024-02-22'),
(2, 2, '2024-02-22'),

(3, 2, '2024-02-22'),
(3, 3, '2024-02-22'),
(3, 1, '2024-02-22'),

(4, 1, '2024-02-22'),
(5, 2, '2024-02-22'),
(6, 3, '2024-02-22'),
(6, 4, '2024-02-22'),
(6, 6, '2024-02-22'),
(6, 5, '2024-02-22'),
(7, 7, '2024-02-22'),
(8, 8, '2024-02-22'),
(9, 9, '2024-02-22'),
(10, 10, '2024-02-22'),
(10, 1, '2024-02-22'),
(11, 2, '2024-02-22'),
(11, 3, '2024-02-22'),
(11, 4, '2024-02-22'),
(12, 5, '2024-02-22'),
(12, 6, '2024-02-22'),
(13, 7, '2024-02-22'),
(15, 8, '2024-02-22'),
(14, 9, '2024-02-22'),
(14, 9, '2024-02-22'),
(11, 10,'2024-02-22'),
(11, 1, '2024-02-22'),
(12, 2, '2024-02-22'),
(13, 2, '2024-02-22'),
(14, 3, '2024-02-22'),
(15, 4, '2024-02-22'),
(15, 5, '2024-02-22')
;

-- insert data into rate_res table

insert into rate_res(users_id, res_id, amount, date_rate)values
(1, 1, 5, '2024-02-22'),
(2, 2, 5, '2024-02-22'),
(3, 2, 4, '2024-02-22'),
(1, 1, 3, '2024-02-22'),
(4, 3, 4, '2024-02-22'),
(5, 4, 5, '2024-02-22'),

(6, 5, 5, '2024-02-22'),
(1, 6, 4, '2024-02-22'),
(2, 7, 5, '2024-02-22'),
(3, 9, 4, '2024-02-22'),
(4, 1, 4, '2024-02-22'),
(5, 2, 4, '2024-02-22'),
(6, 3, 3, '2024-02-22'),
(7, 4, 4, '2024-02-22'),
(8, 5, 5, '2024-02-22'),
(9, 6, 3, '2024-02-22'),
(10,7, 5, '2024-02-22'),
(11,8, 4, '2024-02-22'),
(1, 1, 5, '2024-02-22'),
(2, 2, 3, '2024-02-22'),
(3, 3, 4, '2024-02-22'),
(4, 4, 4, '2024-02-22'),
(5, 5, 5, '2024-02-22'),
(6, 6, 5, '2024-02-22')

;
