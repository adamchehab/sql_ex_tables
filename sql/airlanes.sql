-- # ? Ошибка в ТЗ: data в pass_in_trip не ключ тк она не унискальна
-- # ? Почему 3 ключа?

-- Создаём базы данных

CREATE DATABASE IF NOT EXISTS airlines;
USE airlines;


-- Создаем таблицы

-- trip
CREATE TABLE IF NOT EXISTS trip(
    trip_no INT PRIMARY KEY,
    ID_comp INT NOT NULL,
    plane CHAR(10) NOT NULL,
    town_from CHAR(25) NOT NULL,
    town_to CHAR(25) NOT NULL,
    time_out DATETIME NOT NULL,
    time_in DATETIME NOT NULL
);

-- pass_in_trip
CREATE TABLE IF NOT EXISTS pass_in_trip(
    trip_no INT NOT NULL,
    date DATETIME NOT NULL,
    ID_psg INT NOT NULL, 
    place CHAR(10) NOT NULL
);

-- company
CREATE TABLE IF NOT EXISTS company(
    ID_comp INT PRIMARY KEY,
    name CHAR(10) NOT NULL
);

-- passenger
CREATE TABLE IF NOT EXISTS passenger(
    ID_psg INT PRIMARY KEY,
    name CHAR(20) NOT NULL
);


-- notes

DROP TABLE IF EXISTS trip, company, passenger, pass_in_trip;
SHOW TABLES;


DESC trip;
DESC company;
DESC passenger;
DESC pass_in_trip;


-- Создаем связи между таблицами

-- TRIP -> COMPANY
ALTER TABLE trip ADD FOREIGN KEY (ID_comp) REFERENCES company(ID_comp);

-- PASS_IN_TRIP -> TRIP
ALTER TABLE pass_in_trip ADD FOREIGN KEY (trip_no) REFERENCES trip(trip_no);

-- PASS_IN_TRIP -> PASSENGER
ALTER TABLE pass_in_trip ADD FOREIGN KEY (ID_psg) REFERENCES passenger(ID_psg);


-- Заполняем таблицу данными





-- notes
SELECT * FROM company;
SELECT * FROM passenger;