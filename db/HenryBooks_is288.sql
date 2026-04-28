DROP DATABASE IF EXISTS HENRYBOOKS_IS288;
CREATE DATABASE HENRYBOOKS_IS288;
USE HENRYBOOKS_IS288;

CREATE TABLE users
( userID      decimal(4,0) Primary Key,
  userName    char(50),
  userPassword decimal(3,0),
  storeID     decimal(1,0),
  adminLevel  char(4) );

INSERT INTO users VALUES (1234, 'John Smith', 111, 2, 'Admn');
INSERT INTO users VALUES (3454, 'Mary Jones', 222, 1, 'Admn');
INSERT INTO users VALUES (6789, 'Brad Squires', 205, 2, 'View');
INSERT INTO users VALUES (6352, 'Mark Viola', 238, 3, 'Admn');
INSERT INTO users VALUES (5543, 'Rich Huber', 269, 4, 'View');

CREATE TABLE stores
( storeID 		decimal(1,0) Primary Key,
  storeName		char(40),
  storeAddr		char(40),
  storeEmp		decimal(2,0) );

INSERT INTO stores VALUES (1, 'Henry Downtown','16 Riverview',10);
INSERT INTO stores VALUES (2, 'Henry On The Hill','1289 Bedford',6);
INSERT INTO stores VALUES (3, 'Henry Brentwood','Brentwood Mall',15);
INSERT INTO stores VALUES (4, 'Henry Eastshore','Eastshore Mall',9);

CREATE TABLE publisher
( Publisher_Code	char(2) Primary Key,
 Publisher_Name		char(20),
 Publisher_City		char(20),
 Publisher_State	char(2) );

INSERT INTO publisher VALUES ('AH','Arkham House Publ.','Sauk City','WI');
INSERT INTO publisher VALUES ('AP','Arcade Publishing','New York','NY');
INSERT INTO publisher VALUES ('AW','Addison Wesley','Reading','MA');
INSERT INTO publisher VALUES ('BB','Bantam Books','New York','NY');
INSERT INTO publisher VALUES ('BF','Best and Furrow','Boston','MA');
INSERT INTO publisher VALUES ('JT','Jeremy P. Tarcher','Los Angeles','CA');
INSERT INTO publisher VALUES ('MP','McPherson and Co.','Kingston','NY');
INSERT INTO publisher VALUES ('PB','Pocket Books','New York','NY');
INSERT INTO publisher VALUES ('RH','Random House','New York','NY');
INSERT INTO publisher VALUES ('RZ','Rizzoli','New York','NY');
INSERT INTO publisher VALUES ('SB','Schoken Books','New York','NY');
INSERT INTO publisher VALUES ('SI','Signet','New York','NY');
INSERT INTO publisher VALUES ('TH','Thames and Hudson','New York','NY');
INSERT INTO publisher VALUES ('WN','W.W. Norton and Co.','New York','NY');

CREATE TABLE booklist
(bookID		char(4) Not Null,
 title		char(30),
 author		char(50),
 publisher_Code	char(2),
 booktype	char(3),
 price		decimal(4,2), 
 
 Primary Key(bookID) );

INSERT INTO booklist VALUES ('0180','Shyness','Zinbardo, Philip','BB','PSY',7.65);
INSERT INTO booklist VALUES ('0189','Kane and Able','Archer, Jeffrey','PB','PSY',5.55);
INSERT INTO booklist VALUES ('0200','Stranger','Camus, Albert','BB','FIC',8.75);
INSERT INTO booklist VALUES ('0378','Dunwich Horror and Others','Lovecraft, H.P.','PB','HOR',19.75);
INSERT INTO booklist VALUES ('079X','Smokescreen','Francis, Dick','PB','MYS',4.55);
INSERT INTO booklist VALUES ('0808','Knockdown','Francis, Dick','PB','MYS',4.75);
INSERT INTO booklist VALUES ('1351','Cujo','King, Stephen','SI','HOR',6.65);
INSERT INTO booklist VALUES ('1382','Marcel Duchamp','Paz, Octavio','AH','ART',11.25);
INSERT INTO booklist VALUES ('138X','Death on the Nile','Christie, Agatha','MP','MYS',3.95);
INSERT INTO booklist VALUES ('2226','Ghost from the Grand Banks','Clarke, Arthur C.','AP','SFI',19.95);
INSERT INTO booklist VALUES ('2281','Prints of the 20h Century','Castleman, Riva','SB','ART',13.25);
INSERT INTO booklist VALUES ('2766','Prodigal Daughter','Archer, Jeffrey','RZ','FIC',5.45);
INSERT INTO booklist VALUES ('2908','Hymns to the Night','Novalis','RZ','POE',6.75);
INSERT INTO booklist VALUES ('3350','Higher Creativity','Harmon, Willis','TH','PSY',9.75);
INSERT INTO booklist VALUES ('3743','First Among Equals','Archer, Jeffrey','WN','FIC',3.95);
INSERT INTO booklist VALUES ('3906','Vortex','Cussler, Clive','WN','SUS',5.45);
INSERT INTO booklist VALUES ('5163','Organ','Williams, Peter','SI','MUS',16.95);
INSERT INTO booklist VALUES ('5790','Database Systems','Pratt, Philip','BF','CS',54.95);
INSERT INTO booklist VALUES ('6128','Evil Under the Sun','Christie, Agatha','JT','MYS',4.45);
INSERT INTO booklist VALUES ('6328','Vixen 07','Cussler, Clive','BB','SUS',5.55);
INSERT INTO booklist VALUES ('669X','A Guide to SQL','Pratt, Philip','BF','CS',23.95);
INSERT INTO booklist VALUES ('6908','Windows Essentials','Southworth, Rod','JT','CS',20.50);
INSERT INTO booklist VALUES ('7405','Night Probe','Cussler, Clive','BB','SUS',5.65);
INSERT INTO booklist VALUES ('7443','Carrie','King, Stephen','SI','HOR',6.75);
INSERT INTO booklist VALUES ('7559','Risk','Francis, Dick','PB','MYS',3.95);
INSERT INTO booklist VALUES ('7947','Database Programming','Pratt, Philip','AW','CS',39.90);
INSERT INTO booklist VALUES ('8092','Magritte','Gimferrer, Pere','SI','ART',21.95);
INSERT INTO booklist VALUES ('8720','Castle','Kafka, Franz','BB','FIC',12.15);
INSERT INTO booklist VALUES ('9611','Amerika','Kafka, Franz','AW','FIC',10.95);

CREATE TABLE bookinv 
(ID             BIGINT NOT NULL AUTO_INCREMENT,
 bookID		char(4),
 storeID	decimal(1,0),
 OnHand		decimal(2,0),
 
 Primary Key (ID), 
 Foreign Key storekey (storeID) REFERENCES stores (storeID) );

INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0180',1,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0189',1,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0200',1,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0378',1,3);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('079X',1,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0808',1,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('1351',1,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('1382',1,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('138X',1,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2226',1,3);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2281',1,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2766',1,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2908',1,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3350',1,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3743',1,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3906',1,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('5163',1,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('5790',1,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6128',1,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6328',1,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('669X',1,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6908',1,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7405',1,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7443',1,4);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7559',1,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7947',1,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('8092',1,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('8720',1,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('9611',1,1);

INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0180',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0189',2,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0200',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0378',2,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('079X',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0808',2,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('1351',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('1382',2,3);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('138X',2,3);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2226',2,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2281',2,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2766',2,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2908',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3350',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3743',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3906',2,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('5163',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('5790',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6128',2,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6328',2,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('669X',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6908',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7405',2,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7443',2,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7559',2,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7947',2,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('8092',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('8720',2,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('9611',2,0);

INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0180',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0189',3,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0200',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0378',3,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('079X',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0808',3,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('1351',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('1382',3,3);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('138X',3,3);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2226',3,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2281',3,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2766',3,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2908',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3350',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3743',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3906',3,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('5163',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('5790',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6128',3,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6328',3,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('669X',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6908',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7405',3,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7443',3,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7559',3,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7947',3,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('8092',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('8720',3,0);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('9611',3,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0180',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0189',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0200',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0378',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('079X',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('0808',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('1351',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('1382',4,3);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('138X',4,3);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2226',4,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2281',4,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2766',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('2908',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3350',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3743',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('3906',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('5163',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('5790',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6128',4,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6328',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('669X',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('6908',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7405',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7443',4,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7559',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('7947',4,2);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('8092',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('8720',4,1);
INSERT INTO bookinv (bookID, storeID, OnHand) VALUES ('9611',4,1);
