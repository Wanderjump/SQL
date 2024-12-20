CREATE TABLE client(
    id integer primary key,
	name varchar(64),
	lastname varchar(64),
	locator_id integer,
	city varchar(64));

CREATE TABLE locators(
    locator_id integer primary key,
	phone varchar(20),
	email varchar(64));

CREATE TABLE transactions(
	id integer primary key,
	client_id integer,
	money_amount number(*, 2),
	currency_id integer);

CREATE TABLE currency_types(
	id integer primary key,
	title varchar(16));

CREATE TABLE currency_exchange(
    id integer,
	to_currency_id integer,
	coef number(*, 3));


INSERT ALL
    INTO client (id, name, lastname, locator_id, city) VALUES (1, 'Александр', 'Иванов', 1, 'Уфа')
	INTO client (id, name, lastname, locator_id, city) VALUES (2, 'Борис', 'Калинин', 7, 'Ереван')
	INTO client (id, name, lastname, locator_id, city) VALUES (3, 'Петр', 'Суворов', 2, 'Казань')
	INTO client (id, name, lastname, locator_id, city) VALUES (4, 'Юрий', 'Сахаров', 6, 'Владимир')
	INTO client (id, name, lastname, locator_id, city) VALUES (5, 'Всеволод', 'Долгих', 4, 'Екатеринбург')
	INTO client (id, name, lastname, locator_id, city) VALUES (6, 'Александр', 'Виноградов', 5, 'Москва')
	INTO client (id, name, lastname, locator_id, city) VALUES (7, 'Николай', 'Николаев', 2, 'Нижний Новгород')
	INTO client (id, name, lastname, locator_id, city) VALUES (8, 'Ольга', 'Печуркина', 1, 'Санкт-Петербург')
	INTO client (id, name, lastname, locator_id, city) VALUES (9, 'Екатерина', 'Александрова', 8, 'Чебоксары')
	INTO client (id, name, lastname, locator_id, city) VALUES (10, 'Юлия', 'Абрикосова', 3, 'Москва')
SELECT * FROM dual;

INSERT ALL
    INTO locators (locator_id, phone, email) VALUES (1, '+7(495)563-83-79', 'ivan.92@mail.ru')
    INTO locators (locator_id, phone, email) VALUES (2, '+374(905)750-44-13', 'Nik.nik@mail.ru')
    INTO locators (locator_id, phone, email) VALUES (3, '+7(916)258-30-30', 'Apricot.Yla@mail.ru')
    INTO locators (locator_id, phone, email) VALUES (4, '+7(909)546-77-76', 'Dolg.Seva@mail.ru')
    INTO locators (locator_id, phone, email) VALUES (5, '+374(903)391-77-01', 'Vino.Sasha@mail.ru')
    INTO locators (locator_id, phone, email) VALUES (6, '+7(495)620-04-40', 'Sacharov.Yuri_13@mail.ru')
    INTO locators (locator_id, phone, email) VALUES (7, '+374(905)980-02-08', 'Bor.Kalin@mail.ru')
    INTO locators (locator_id, phone, email) VALUES (8, '+7(916)444-22-04', 'Katusha.93@mail.ru')
SELECT * FROM dual;

INSERT ALL
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (1, 4, 16600, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (2, 5, 5, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (3, 7, 15000, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (4, 7, 14700, 3)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (5, 10, 50000, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (6, 7, 11000, 1)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (7, 2, 10900, 3)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (8, 6, 15400, 3)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (9, 5, 10800, 1)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (10, 7, 15100, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (11, 8, 7, 1)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (12, 5, 10400, 1)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (13, 5, 17700, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (14, 8, 15600, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (15, 3, 14600, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (16, 6, 13900, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (17, 4, 700000, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (18, 8, 13100, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (19, 6, 17000, 1)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (20, 10, 16700, 3)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (21, 3, 1000000, 3)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (22, 7, 17300, 1)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (23, 2, 15100, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (24, 7, 18600, 3)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (25, 3, 4, 1)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (26, 2, 18900, 2)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (27, 5, 13900, 1)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (28, 5, 14800, 3)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (29, 5, 17100, 1)
    INTO transactions (id, client_id, money_amount, currency_id) VALUES (30, 4, 16700, 3)
SELECT * FROM dual;

INSERT ALL
    INTO currency_types (id, title) VALUES (1, 'Рубль')
    INTO currency_types (id, title) VALUES (2, 'Доллар')
    INTO currency_types (id, title) VALUES (3, 'Евро')
SELECT * FROM dual;

INSERT ALL
    INTO currency_exchange (id, to_currency_id, coef) VALUES (1, 2, 0.013)
    INTO currency_exchange (id, to_currency_id, coef) VALUES (1, 3, 0.011)
    INTO currency_exchange (id, to_currency_id, coef) VALUES (2, 1, 76.01)
    INTO currency_exchange (id, to_currency_id, coef) VALUES (2, 3, 0.85)
    INTO currency_exchange (id, to_currency_id, coef) VALUES (3, 1, 89.88)
    INTO currency_exchange (id, to_currency_id, coef) VALUES (3, 2, 1.18)
SELECT * FROM dual;

SELECT * FROM client WHERE city = 'Москва';
SELECT * FROM client WHERE name LIKE '%А%';
SELECT * FROM locators WHERE phone NOT LIKE '+7%';
SELECT t.* FROM transactions t JOIN currency_types c ON t.currency_id = c.id WHERE c.title IN ('Рубль', 'Доллар');
SELECT t.* FROM transactions t JOIN currency_types c ON t.currency_id = c.id
    WHERE c.title = 'Рубль' AND t.money_amount NOT BETWEEN 10 AND 200000;
SELECT COUNT(*) Не_проводили_транзакции FROM client WHERE id NOT IN (SELECT client_id FROM transactions);
SELECT c.city, COUNT(t.client_id) FROM client c INNER JOIN transactions t ON c.id = t.client_id GROUP BY c.city;


