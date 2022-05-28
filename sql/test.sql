/*markdown
## Create tables (with relations)
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
CREATE table Pass_in_trip(
  trip_no INT NOT NULL,
  date DATETIME NOT NULL,
  ID_psg INT NOT NULL,
  place CHAR(10) NOT NULL,
  PRIMARY KEY (trip_no, date, ID_psg),
  CONSTRAINT FK_trip_no FOREIGN KEY (trip_no) REFERENCES Trip (trip_no),
  CONSTRAINT FK_ID_psg FOREIGN KEY (ID_psg) REFERENCES Passenger (ID_psg)
);

/*markdown
## Create tables and relations separatly
*/

/*markdown
### Create tables (without relations)
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
  time_in DATETIME NOT NULL
);
CREATE table Pass_in_trip(
  trip_no INT NOT NULL,
  date DATETIME NOT NULL,
  ID_psg INT NOT NULL,
  place CHAR(10) NOT NULL,
  PRIMARY KEY (trip_no, date, ID_psg)
);

/*markdown
### Create relations
*/

ALTER TABLE trip ADD CONSTRAINT FK_id_comp FOREIGN KEY(id_comp) REFERENCES company(id_comp);
ALTER TABLE pass_in_trip ADD CONSTRAINT FK_trip_no FOREIGN KEY (trip_no) REFERENCES trip(trip_no);
ALTER TABLE pass_in_trip ADD CONSTRAINT FK_ID_psg FOREIGN KEY (ID_psg) REFERENCES passenger (ID_psg);




/*markdown
### Remove relations
*/


ALTER TABLE trip DROP CONSTRAINT FK_id_comp;
ALTER TABLE pass_in_trip DROP CONSTRAINT FK_trip_no;
ALTER TABLE pass_in_trip DROP CONSTRAINT FK_ID_psg;

DROP TABLE IF EXISTS trip, company, passenger, pass_in_trip;

USE airlines;
SELECT * FROM company;