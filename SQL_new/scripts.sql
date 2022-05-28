/*markdown
### Create database
*/

DROP DATABASE IF EXISTS airlines;
CREATE DATABASE IF NOT EXISTS airlines;
USE airlines;

/*markdown
### Create tables (with relations)
*/

DROP TABLE IF EXISTS trip, company, passenger, pass_in_trip;
CREATE TABLE passenger(
  ID_psg INT PRIMARY KEY,
  name CHAR(20) NOT NULL
);
CREATE TABLE company(
  id_comp INT PRIMARY KEY,
  name CHAR(10) NOT NULL
);
CREATE TABLE trip(
  trip_no INT PRIMARY KEY,
  id_comp INT NOT NULL,
  plane CHAR(10) NOT NULL,
  town_from CHAR(25) NOT NULL,
  town_to CHAR(25) NOT NULL,
  time_out DATETIME NOT NULL,
  time_in DATETIME NOT NULL,
  CONSTRAINT FK_id_comp FOREIGN KEY(id_comp) REFERENCES company(id_comp)
);
CREATE table pass_in_trip(
  trip_no INT NOT NULL,
  date DATETIME NOT NULL,
  ID_psg INT NOT NULL,
  place CHAR(10) NOT NULL,
  PRIMARY KEY (trip_no, date, ID_psg),
  CONSTRAINT FK_trip_no FOREIGN KEY (trip_no) REFERENCES Trip (trip_no),
  CONSTRAINT FK_ID_psg FOREIGN KEY (ID_psg) REFERENCES Passenger (ID_psg)
);

/*markdown
### Fill tables with data
*/

insert into company values(1, 'Don_avia  ');
insert into company values(2, 'Aeroflot  ');
insert into company values(3, 'Dale_avia ');
insert into company values(4, 'air_France');
insert into company values(5, 'British_AW');

insert into passenger values(1, 'Bruce Willis         ');
insert into passenger values(2, 'George Clooney       ');
insert into passenger values(3, 'Kevin Costner        ');
insert into passenger values(4, 'Donald Sutherland    ');
insert into passenger values(5, 'Jennifer Lopez       ');
insert into passenger values(6, 'Ray Liotta           ');
insert into passenger values(7, 'Samuel L. Jackson    ');
insert into passenger values(8, 'Nikole Kidman        ');
insert into passenger values(9, 'Alan Rickman         ');
insert into passenger values(10,'Kurt Russell         ');
insert into passenger values(11,'Harrison Ford        ');
insert into passenger values(12,'Russell Crowe        ');
insert into passenger values(13,'Steve Martin         ');
insert into passenger values(14,'Michael Caine        ');
insert into passenger values(15,'Angelina Jolie       ');
insert into passenger values(16,'Mel Gibson           ');
insert into passenger values(17,'Michael Douglas      ');
insert into passenger values(18,'John Travolta        ');
insert into passenger values(19,'Sylvester Stallone   ');
insert into passenger values(20,'Tommy Lee Jones      ');
insert into passenger values(21,'Catherine Zeta-Jones ');
insert into passenger values(22,'Antonio Banderas     ');
insert into passenger values(23,'Kim Basinger         ');
insert into passenger values(24,'Sam Neill            ');
insert into passenger values(25,'Gary Oldman          ');
insert into passenger values(26,'Clint Eastwood       ');
insert into passenger values(27,'Brad Pitt            ');
insert into passenger values(28,'Johnny Depp          ');
insert into passenger values(29,'Pierce Brosnan       ');
insert into passenger values(30,'Sean Connery         ');
insert into passenger values(31,'Bruce Willis         ');
insert into passenger values(37,'Mullah Omar          ');

insert into trip values(1100, 4, 'Boeing    ','Rostov                   ','Paris                    ','1900-01-01 14:30:00','1900-01-01 17:50:00');
insert into trip values(1101, 4, 'Boeing    ','Paris                    ','Rostov                   ','1900-01-01 08:12:00','1900-01-01 11:45:00');
insert into trip values(1123, 3, 'TU-154    ','Rostov                   ','Vladivostok              ','1900-01-01 16:20:00','1900-01-01 03:40:00');
insert into trip values(1124, 3, 'TU-154    ','Vladivostok              ','Rostov                   ','1900-01-01 09:00:00','1900-01-01 19:50:00');
insert into trip values(1145, 2, 'IL-86     ','Moscow                   ','Rostov                   ','1900-01-01 09:35:00','1900-01-01 11:23:00');
insert into trip values(1146, 2, 'IL-86     ','Rostov                   ','Moscow                   ','1900-01-01 17:55:00','1900-01-01 20:01:00');
insert into trip values(1181, 1, 'TU-134    ','Rostov                   ','Moscow                   ','1900-01-01 06:12:00','1900-01-01 08:01:00');
insert into trip values(1182, 1, 'TU-134    ','Moscow                   ','Rostov                   ','1900-01-01 12:35:00','1900-01-01 14:30:00');
insert into trip values(1187, 1, 'TU-134    ','Rostov                   ','Moscow                   ','1900-01-01 15:42:00','1900-01-01 17:39:00');
insert into trip values(1188, 1, 'TU-134    ','Moscow                   ','Rostov                   ','1900-01-01 22:50:00','1900-01-01 00:48:00');
insert into trip values(1195, 1, 'TU-154    ','Rostov                   ','Moscow                   ','1900-01-01 23:30:00','1900-01-01 01:11:00');
insert into trip values(1196, 1, 'TU-154    ','Moscow                   ','Rostov                   ','1900-01-01 04:00:00','1900-01-01 05:45:00');
insert into trip values(7771, 5, 'Boeing    ','London                   ','Singapore                ','1900-01-01 01:00:00','1900-01-01 11:00:00');
insert into trip values(7772, 5, 'Boeing    ','Singapore                ','London                   ','1900-01-01 12:00:00','1900-01-01 02:00:00');
insert into trip values(7773, 5, 'Boeing    ','London                   ','Singapore                ','1900-01-01 03:00:00','1900-01-01 13:00:00');
insert into trip values(7774, 5, 'Boeing    ','Singapore                ','London                   ','1900-01-01 14:00:00','1900-01-01 06:00:00');
insert into trip values(7775, 5, 'Boeing    ','London                   ','Singapore                ','1900-01-01 09:00:00','1900-01-01 20:00:00');
insert into trip values(7776, 5, 'Boeing    ','Singapore                ','London                   ','1900-01-01 18:00:00','1900-01-01 08:00:00');
insert into trip values(7777, 5, 'Boeing    ','London                   ','Singapore                ','1900-01-01 18:00:00','1900-01-01 06:00:00');
insert into trip values(7778, 5, 'Boeing    ','Singapore                ','London                   ','1900-01-01 22:00:00','1900-01-01 12:00:00');
insert into trip values(8881, 5, 'Boeing    ','London                   ','Paris                    ','1900-01-01 03:00:00','1900-01-01 04:00:00');
insert into trip values(8882, 5, 'Boeing    ','Paris                    ','London                   ','1900-01-01 22:00:00','1900-01-01 23:00:00');

insert into pass_in_trip values(1100, '2003-04-29 00:00:00',1,'1a        ');
insert into pass_in_trip values(1123, '2003-04-05 00:00:00',3,'2a        ');
insert into pass_in_trip values(1123, '2003-04-08 00:00:00',1,'4c        ');
insert into pass_in_trip values(1123, '2003-04-08 00:00:00',6,'4b        ');
insert into pass_in_trip values(1124, '2003-04-02 00:00:00',2,'2d        ');
insert into pass_in_trip values(1145, '2003-04-05 00:00:00',3,'2c        ');
insert into pass_in_trip values(1181, '2003-04-01 00:00:00',1,'1a        ');
insert into pass_in_trip values(1181, '2003-04-01 00:00:00',6,'1b        ');
insert into pass_in_trip values(1181, '2003-04-01 00:00:00',8,'3c        ');
insert into pass_in_trip values(1181, '2003-04-13 00:00:00',5,'1b        ');
insert into pass_in_trip values(1182, '2003-04-13 00:00:00',5,'4b        ');
insert into pass_in_trip values(1187, '2003-04-14 00:00:00',8,'3a        ');
insert into pass_in_trip values(1188, '2003-04-01 00:00:00',8,'3a        ');
insert into pass_in_trip values(1182, '2003-04-13 00:00:00',9,'6d        ');
insert into pass_in_trip values(1145, '2003-04-25 00:00:00',5,'1d        ');
insert into pass_in_trip values(1187, '2003-04-14 00:00:00',10,'3d       ');
insert into pass_in_trip values(8882, '2005-11-06 00:00:00',37,'1a       '); 
insert into pass_in_trip values(7771, '2005-11-07 00:00:00',37,'1c       '); 
insert into pass_in_trip values(7772, '2005-11-07 00:00:00',37,'1a       '); 
insert into pass_in_trip values(8881, '2005-11-08 00:00:00',37,'1d       '); 
insert into pass_in_trip values(7778, '2005-11-05 00:00:00',10,'2a       '); 
insert into pass_in_trip values(7772, '2005-11-29 00:00:00',10,'3a       ');
insert into pass_in_trip values(7771, '2005-11-04 00:00:00',11,'4a       ');
insert into pass_in_trip values(7771, '2005-11-07 00:00:00',11,'1b       ');
insert into pass_in_trip values(7771, '2005-11-09 00:00:00',11,'5a       ');
insert into pass_in_trip values(7772, '2005-11-07 00:00:00',12,'1d       ');
insert into pass_in_trip values(7773, '2005-11-07 00:00:00',13,'2d       ');
insert into pass_in_trip values(7772, '2005-11-29 00:00:00',13,'1b       ');
insert into pass_in_trip values(8882, '2005-11-13 00:00:00',14,'3d       ');
insert into pass_in_trip values(7771, '2005-11-14 00:00:00',14,'4d       ');
insert into pass_in_trip values(7771, '2005-11-16 00:00:00',14,'5d       ');
insert into pass_in_trip values(7772, '2005-11-29 00:00:00',14,'1c       ');

/*markdown
копии - like - foregin key отдельно
каскадное удаление

Сначала сказала сделать копии полные всех таблиц из моей схемы, добавить каскадное удаление в фк и показать что оно работает
Потом сказала создать новый столбец, перенести туда фк, значения из старого, старый столбец забить нулями и удалить потом

1 транзакция которая копирует таблицы
Все ограничения целостности
2Показать каскадное удаление (меньше всего продукции)
3с внешним ключом копия (по условию цены)
,На исходной убрать ключи
На скопированной копия столбца с внешним ключом, оригинальный обнуляю ИНН


- создал табл
- создал новые ключи
- ...


![alt text](https://sun9-32.userapi.com/s/v1/ig2/XnjkXP-GS5TkyY4Xe73qKHXoplKcDF1GuhMOOru7pgN5cQe1n_fM3PqjedZw6E1sGyDvl77V_pLk-8U8Hz5N2us3.jpg?size=790x486&quality=96&type=album)
*/


*/