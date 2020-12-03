
CLEAR SCREEN;
PROMPT ;
PROMPT logowanie jako STUDENT;
PROMPT ;
--
-- zmiana formatu daty
alter session set 
	nls_date_format = 'YYYY-MM-DD HH24:MI';
PROMPT ;
PROMPT Kasowanie tabel;
PROMPT ; 

--
DELETE FROM KARTA;
DROP TABLE KARTA;
--
DELETE FROM PRZYJECIA;
DROP TABLE PRZYJECIA;
--
DELETE FROM BADANIE;
DROP TABLE BADANIE;
--
DELETE FROM ODDZIAL;
DROP TABLE ODDZIAL;
--
DELETE FROM LEKARZ;
DROP TABLE LEKARZ;
--
DELETE FROM GRUPA;
DROP TABLE GRUPA;
--
DELETE FROM SALA;
DROP TABLE SALA;
--
DELETE FROM PIELEGNIARKA;
DROP TABLE PIELEGNIARKA;
--
DELETE FROM PACJENT;
DROP TABLE PACJENT;
--
DELETE FROM ADRES;
DROP TABLE ADRES;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE ADRES;
PROMPT----------------------------------------;
PROMPT ;
-- 
create table ADRES
(
ADRk_1_Id number(4) NOT NULL,
ADR_Kraj varchar2(80) NOT NULL,
ADR_Miejscowosc varchar2(80) NOT NULL,
ADR_Ulica varchar2(100) NOT NULL,
ADR_Nr_domu varchar2(5) NOT NULL,
ADR_Nr_lokalu varchar2(5),
ADR_Kod_pocztowy varchar2(10) NOT NULL
); 
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table ADRES
add constraint PK_ADRES
primary key (ADRk_1_Id);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE PACJENT;
PROMPT----------------------------------------;
PROMPT ;
--
create table PACJENT
(
PACk_1_Id number(6) NOT NULL,
PAC_Imie1 varchar2(20) NOT NULL,
PAC_Imie2 varchar2(20),
PAC_Nazwisko varchar2(20) NOT NULL,
PAC_Pesel number(11) NOT NULL,
PAC_Data_urodzenia DATE NOT NULL,
PAC_Miejsce_urodzenia varchar2(80) NOT NULL,
ADR_Id number(4) NOT NULL
); 
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table PACJENT
add constraint PK_PACJENT
primary key (PACk_1_Id);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Unique Key;
PROMPT----------------------------------------;
PROMPT ;
alter table PACJENT
add constraint UNQ_PAC_PESEL
unique (PAC_Pesel);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table PACJENT add constraint FK_PAC_ADR
foreign key (ADR_Id)
references ADRES (ADRk_1_Id);

PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE PIELEGNIARKA;
PROMPT----------------------------------------;
PROMPT ;
--
create table PIELEGNIARKA
(
PIEk_1_Id number(3) NOT NULL,
PIE_Imie varchar2(20) NOT NULL,
PIE_Nazwisko varchar2(20) NOT NULL
); 
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table PIELEGNIARKA
add constraint PK_PIELEGNIARKA
primary key (PIEk_1_Id);

PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE SALA;
PROMPT----------------------------------------;
PROMPT ;
--
create table SALA
(
SALk_1_Id number(3) NOT NULL,
SAL_Nr_sali number(3) NOT NULL,
SAL_Nr_lozka number(3) NOT NULL
); 
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table SALA
add constraint PK_SALA
primary key (SALk_1_Id);


PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE GRUPA;
PROMPT----------------------------------------;
PROMPT ;
--
create table GRUPA
(
GRUk_1_Id number(3) NOT NULL,
SAL_Id number(3) NOT NULL,
PIE_Id number(3) NOT NULL,
GRU_Uwagi varchar2(100)
); 
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table GRUPA
add constraint PK_GRUPA
primary key (GRUk_1_Id);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table GRUPA add constraint FK_GRU_SAL
foreign key (SAL_Id)
references SALA (SALk_1_Id);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table GRUPA add constraint FK_GRU_PIE
foreign key (PIE_Id)
references PIELEGNIARKA (PIEk_1_Id);
--


PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE LEKARZ;
PROMPT----------------------------------------;
PROMPT ;
--
create table LEKARZ
(
LEKk_1_Id number(4) NOT NULL,
LEK_Imie varchar2(20) NOT NULL,
LEK_Nazwisko varchar2(20) NOT NULL,
LEK_Specjalnosc varchar2(50) NOT NULL
); 
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table LEKARZ
add constraint PK_LEKARZ
primary key (LEKk_1_Id);

PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE ODDZIAL;
PROMPT----------------------------------------;
PROMPT ;
--
create table ODDZIAL
(
ODDk_1_Id number(3) NOT NULL,
ODD_Nazwa varchar2(20) NOT NULL,
LEK_Id number(4) NOT NULL,
SAL_Id number(3) NOT NULL
); 
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table ODDZIAL
add constraint PK_ODDZIAL
primary key (ODDk_1_Id);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table ODDZIAL add constraint FK_ODD_LEK
foreign key (LEK_Id)
references LEKARZ (LEKk_1_Id);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table ODDZIAL add constraint FK_ODD_SAL
foreign key (SAL_Id)
references SALA (SALk_1_Id);

PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE BADANIE;
PROMPT----------------------------------------;
PROMPT ;
--
create table BADANIE
(
BADk_1_Id number(10) NOT NULL,
BAD_Nazwa varchar2(70) NOT NULL,
BAD_Wynik number(5) NOT NULL
); 
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table BADANIE
add constraint PK_BADANIE
primary key (BADk_1_Id);

PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE PRZYJECIA;
PROMPT----------------------------------------;
PROMPT ;
--
create table PRZYJECIA
(
PRZk_1_Id number(10) NOT NULL,
PRZ_Data date NOT NULL,
PAC_Id number(6) NOT NULL,
ODD_Id number(3) NOT NULL
); 

PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table PRZYJECIA
add constraint PK_PRZYJECIA
primary key (PRZk_1_Id);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table PRZYJECIA add constraint FK_PRZ_PAC
foreign key (PAC_Id)
references PACJENT (PACk_1_Id);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table PRZYJECIA add constraint FK_PRZ_ODD
foreign key (ODD_Id)
references ODDZIAL (ODDk_1_Id);

PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE KARTA;
PROMPT----------------------------------------;
PROMPT ;
--
create table KARTA
(
KARk_1_ID number(5) NOT NULL,
PRZ_Id number(10) NOT NULL,
BAD_Id number(10) NOT NULL,
KAR_Uwagi varchar2(100) 
); 

PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table KARTA
add constraint PK_KARTA
primary key (KARk_1_ID);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table KARTA add constraint FK_KAR_PRZ
foreign key (PRZ_Id)
references PRZYJECIA (PRZk_1_Id);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table KARTA add constraint FK_KAR_BAD
foreign key (BAD_Id)
references BADANIE (BADk_1_Id);


/*PROMPT----------------------------------------;
PROMPT DESCRIBE;
PROMPT----------------------------------------;
--
PROMPT Sprawdzamy czy prawidlowo utworzono tabele;
PROMPT ;
--
describe ADRES;
describe PACJENT;
describe PIELEGNIARKA;
describe SALA;
describe GRUPA;
describe LEKARZ;
describe ODDZIAL;
describe BADANIE;
describe PRZYJECIA;
describe KARTA;*/
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT Sequence;
PROMPT----------------------------------------;
PROMPT ;
drop sequence SEQ_ADRES;
--
create sequence SEQ_ADRES increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
-- 
drop sequence SEQ_PACJENT;
--
create sequence SEQ_PACJENT increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
-- 
drop sequence SEQ_PIELEGNIARKA;
--
create sequence SEQ_PIELEGNIARKA increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_SALA;
--
create sequence SEQ_SALA increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_GRUPA;
--
create sequence SEQ_GRUPA increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_LEKARZ;
--
create sequence SEQ_LEKARZ increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_ODDZIAL;
--
create sequence SEQ_ODDZIAL increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_BADANIE;
--
create sequence SEQ_BADANIE increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_PRZYJECIA;
--
create sequence SEQ_PRZYJECIA increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_KARTA;
--
create sequence SEQ_KARTA increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT Trigger;
PROMPT----------------------------------------; 
PROMPT ;
create or replace trigger T_BI_ADRES
before insert on ADRES
for each row
begin
 if :new.ADRk_1_Id is NULL then
 SELECT SEQ_ADRES.nextval INTO :new.ADRk_1_Id FROM dual;
 end if;
end;
/ 

create or replace trigger T_BI_PACJENT
before insert on PACJENT
for each row
begin
 if :new.PACk_1_Id is NULL then
 SELECT SEQ_PACJENT.nextval INTO :new.PACk_1_Id FROM dual;
 end if;
end;
/ 

create or replace trigger T_BI_PIELEGNIARKA
before insert on PIELEGNIARKA
for each row
begin
 if :new.PIEk_1_Id is NULL then
 SELECT SEQ_PIELEGNIARKA.nextval INTO :new.PIEk_1_Id FROM dual;
 end if;
end;
/ 

 create or replace trigger T_BI_SALA
before insert on SALA
for each row
begin
 if :new.SALk_1_Id is NULL then
 SELECT SEQ_SALA.nextval INTO :new.SALk_1_Id FROM dual;
 end if;
end;
/ 

 create or replace trigger T_BI_GRUPA
before insert on GRUPA
for each row
begin
 if :new.GRUk_1_Id is NULL then
 SELECT SEQ_GRUPA.nextval INTO :new.GRUk_1_Id FROM dual;
 end if;
end;
/ 

 create or replace trigger T_BI_LEKARZ
before insert on LEKARZ
for each row
begin
 if :new.LEKk_1_Id is NULL then
 SELECT SEQ_LEKARZ.nextval INTO :new.LEKk_1_Id FROM dual;
 end if;
end;
/ 

 create or replace trigger T_BI_ODDZIAL
before insert on ODDZIAL
for each row
begin
 if :new.ODDk_1_Id is NULL then
 SELECT SEQ_ODDZIAL.nextval INTO :new.ODDk_1_Id FROM dual;
 end if;
end;
/ 

 create or replace trigger T_BI_BADANIE
before insert on BADANIE
for each row
begin
 if :new.BADk_1_Id is NULL then
 SELECT SEQ_BADANIE.nextval INTO :new.BADk_1_Id FROM dual;
 end if;
end;
/ 

 create or replace trigger T_BI_PRZYJECIA
before insert on PRZYJECIA
for each row
begin
 if :new.PRZk_1_Id is NULL then
 SELECT SEQ_PRZYJECIA.nextval INTO :new.PRZk_1_Id FROM dual;
 end if;
end;
/ 

 create or replace trigger T_BI_KARTA
before insert on KARTA
for each row
begin
 if :new.KARk_1_ID is NULL then
 SELECT SEQ_KARTA.nextval INTO :new.KARk_1_ID FROM dual;
 end if;
end;
/ 
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT INSERT;
PROMPT----------------------------------------;
PROMPT ;
--
INSERT INTO ADRES (ADR_Kraj, ADR_Miejscowosc, ADR_Ulica, ADR_Nr_domu, ADR_Nr_lokalu, ADR_Kod_pocztowy)
	VALUES ('Polska','Krakow','Mogilska', 23, 5, '31-542');
INSERT INTO ADRES (ADR_Kraj, ADR_Miejscowosc, ADR_Ulica, ADR_Nr_domu, ADR_Nr_lokalu, ADR_Kod_pocztowy)
	VALUES ('Polska', 'Nowy Sacz', 'Lwowska', 11, 3, '33-302');
INSERT INTO ADRES (ADR_Kraj, ADR_Miejscowosc, ADR_Ulica, ADR_Nr_domu, ADR_Kod_pocztowy)
	VALUES ('Polska', 'Warszawa', 'Marszalkowska', 5,'00-624');
INSERT INTO ADRES (ADR_Kraj, ADR_Miejscowosc, ADR_Ulica, ADR_Nr_domu, ADR_Kod_pocztowy)
	VALUES ('Polska', 'Warszawa', 'Krakowska', 83,'02-180');
--
INSERT INTO PACJENT (PAC_Imie1, PAC_Imie2, PAC_Nazwisko, PAC_Pesel, PAC_Data_urodzenia, PAC_Miejsce_urodzenia, ADR_Id)
	VALUES ('Katarzyna', 'Anna', 'Kowalska', 95111274352, '1995-11-12', 'Krakow', 1);
INSERT INTO PACJENT (PAC_Imie1, PAC_Nazwisko, PAC_Pesel, PAC_Data_urodzenia, PAC_Miejsce_urodzenia, ADR_Id)
	VALUES ('Ewa', 'Nowak', 98012235462, '1998-01-22', 'Nowy Sacz', 2);
INSERT INTO PACJENT (PAC_Imie1, PAC_Imie2, PAC_Nazwisko, PAC_Pesel, PAC_Data_urodzenia, PAC_Miejsce_urodzenia, ADR_Id)
	VALUES ('Dominik', 'Szymon', 'Stach', 90030776479, '1990-03-07', 'Krynica-Zdroj', 3);
INSERT INTO PACJENT (PAC_Imie1, PAC_Nazwisko, PAC_Pesel, PAC_Data_urodzenia, PAC_Miejsce_urodzenia, ADR_Id)
	VALUES ('Tomasz', 'Krolikowski', 75121198433, '1975-12-11', 'Warszawa', 4);
--
INSERT INTO PIELEGNIARKA (PIE_Imie, PIE_Nazwisko)
	VALUES ('Marta', 'Gruca');
INSERT INTO PIELEGNIARKA (PIE_Imie, PIE_Nazwisko)
	VALUES ('Agata', 'Krawczyk');
INSERT INTO PIELEGNIARKA (PIE_Imie, PIE_Nazwisko)
	VALUES ('Anna', 'Gil');
INSERT INTO PIELEGNIARKA (PIE_Imie, PIE_Nazwisko)
	VALUES ('Magdalena', 'Zalewska');
--
INSERT INTO SALA (SAL_Nr_sali, SAL_Nr_lozka)
	VALUES (3, 1);
INSERT INTO SALA (SAL_Nr_sali, SAL_Nr_lozka)
	VALUES (3, 2);
INSERT INTO SALA (SAL_Nr_sali, SAL_Nr_lozka)
	VALUES (1, 1);
INSERT INTO SALA (SAL_Nr_sali, SAL_Nr_lozka)
	VALUES (1, 2);
--
INSERT INTO GRUPA (SAL_Id, PIE_Id, GRU_Uwagi)
	VALUES (1, 1, 'Pobyt 3 dni ');
INSERT INTO GRUPA (SAL_Id, PIE_Id, GRU_Uwagi)
	VALUES (2, 2, 'Pobyt 4 dni ');
INSERT INTO GRUPA (SAL_Id, PIE_Id, GRU_Uwagi)
	VALUES (3, 3, 'Pobyt 10 dni ');
INSERT INTO GRUPA (SAL_Id, PIE_Id)
	VALUES (4, 2);	
--
INSERT INTO LEKARZ (LEK_Imie, LEK_Nazwisko, LEK_Specjalnosc)
	VALUES ('Jan', 'Piotrowski', 'onkolog');
INSERT INTO LEKARZ (LEK_Imie, LEK_Nazwisko, LEK_Specjalnosc)
	VALUES ('Piotr', 'Nowak', 'diabetolog');
INSERT INTO LEKARZ (LEK_Imie, LEK_Nazwisko, LEK_Specjalnosc)
	VALUES ('Karolina', 'Kaminska', 'kardiolog');
INSERT INTO LEKARZ (LEK_Imie, LEK_Nazwisko, LEK_Specjalnosc)
	VALUES ('Justyna', 'Zawadzka', 'kardiolog');
--
INSERT INTO ODDZIAL (ODD_Nazwa, LEK_Id, SAL_Id)
	VALUES ('Neurologiczny', 1, 1);
INSERT INTO ODDZIAL (ODD_Nazwa, LEK_Id, SAL_Id)
	VALUES ('Ratunkowy', 2, 2);
--
INSERT INTO BADANIE (BAD_Nazwa, BAD_Wynik)
	VALUES ('Poziom cukru na czczo mg/dL', 82);
INSERT INTO BADANIE (BAD_Nazwa, BAD_Wynik)
	VALUES ('Cholesterol calkowity mg/dL', 154);
INSERT INTO BADANIE (BAD_Nazwa, BAD_Wynik)
	VALUES ('Poziom cukru na czczo mg/dL', 54);
INSERT INTO BADANIE (BAD_Nazwa, BAD_Wynik)
	VALUES ('Cholesterol calkowity mg/dL', 188);
INSERT INTO BADANIE (BAD_Nazwa, BAD_Wynik)
	VALUES ('Poziom cukru na czczo mg/dL', 109);
INSERT INTO BADANIE (BAD_Nazwa, BAD_Wynik)
	VALUES ('Cholesterol calkowity mg/dL', 130);
INSERT INTO BADANIE (BAD_Nazwa, BAD_Wynik)
	VALUES ('Poziom cukru na czczo mg/dL', 77);
INSERT INTO BADANIE (BAD_Nazwa, BAD_Wynik)
	VALUES ('Cholesterol calkowity mg/dL', 199);
--
INSERT INTO PRZYJECIA (PRZ_Data, PAC_Id, ODD_Id)
	VALUES ('2020-04-22', 1, 1);
INSERT INTO PRZYJECIA (PRZ_Data, PAC_Id, ODD_Id)
	VALUES ('2020-04-17', 2, 1);
INSERT INTO PRZYJECIA (PRZ_Data, PAC_Id, ODD_Id)
	VALUES ('2020-03-28', 3, 2);
INSERT INTO PRZYJECIA (PRZ_Data, PAC_Id, ODD_Id)
	VALUES ('2020-03-01', 4, 2);
INSERT INTO PRZYJECIA (PRZ_Data, PAC_Id, ODD_Id)
	VALUES ('2020-04-30', 1, 2);
INSERT INTO PRZYJECIA (PRZ_Data, PAC_Id, ODD_Id)
	VALUES ('2020-05-01', 2, 2);
INSERT INTO PRZYJECIA (PRZ_Data, PAC_Id, ODD_Id)
	VALUES ('2020-05-05', 1, 2);	
--
INSERT INTO KARTA (PRZ_Id, BAD_Id)
	VALUES (1, 1);
INSERT INTO KARTA (PRZ_Id, BAD_Id)
	VALUES (2, 2);
INSERT INTO KARTA (PRZ_Id, BAD_Id)
	VALUES (3, 3);
INSERT INTO KARTA (PRZ_Id, BAD_Id)
	VALUES (4, 4);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT Select;
PROMPT----------------------------------------;
PROMPT ;
COLUMN PAC_Imie1 Heading 'Imie' format A15
COLUMN PAC_Nazwisko Heading 'Nazwisko' format A15
COLUMN ADR_Miejscowosc Heading 'Miejscowosc' format A18
COLUMN ADR_Ulica Heading 'Ulica' format A18
COLUMN ADR_Nr_domu Heading 'Nr_domu' format 9999999

SELECT PAC_Imie1, 
PAC_Nazwisko, 
ADR_Miejscowosc, 
ADR_Ulica, 
ADR_Nr_domu 
FROM ADRES, PACJENT
WHERE (PAC_Imie1, PAC_Nazwisko) IN (SELECT PAC_Imie1, PAC_Nazwisko FROM PACJENT WHERE PAC_Nazwisko LIKE 'K%');
--
COLUMN PRZ_Data Heading 'Data przyjecia' format A18;
COLUMN PAC_Imie1 Heading 'Imie' format A15;
COLUMN PAC_Nazwisko Heading 'Nazwisko' format A18;
COLUMN PAC_Pesel Heading 'Pesel' format 999999999999;
COLUMN ODD_Nazwa Heading 'Nazwa oddzialu' format A18;

SELECT pr.PRZ_Data, 
p.PAC_Imie1, 
p.PAC_Nazwisko, 
p.PAC_Pesel,
o.ODD_Nazwa
FROM PRZYJECIA pr, PACJENT p, ODDZIAL o
WHERE pr.PAC_Id= p.PACk_1_Id AND pr.ODD_Id= o.ODDk_1_Id;
--
COLUMN LEK_Imie Heading 'Imie' format A15
COLUMN LEK_Nazwisko Heading 'Nazwisko' format A15
COLUMN ODD_Nazwa Heading 'Nazwa_oddzialu' format A28

SELECT LEK_Imie,
LEK_Nazwisko,
ODD_Nazwa
FROM LEKARZ, ODDZIAL
WHERE ODD_Nazwa IN (SELECT ODD_Nazwa FROM ODDZIAL WHERE ODD_Nazwa LIKE 'R%' OR ODD_Nazwa LIKE 'N%');

PROMPT ;
PROMPT----------------------------------------;
PROMPT Perspektywy;
PROMPT----------------------------------------;
PROMPT ;
COLUMN PAC_Imie1 Heading 'Imie' format A15
COLUMN PAC_Nazwisko Heading 'Nazwisko' format A15
COLUMN ADR_Miejscowosc Heading 'Miejscowosc' format A18
COLUMN ADR_Ulica Heading 'Ulica' format A18
COLUMN ADR_Nr_domu Heading 'Nr_domu' format 9999999

create or replace view V_PAC_ADR
(Imie, Nazwisko, Miejscowosc, Ulica, Nr_domu)
as
select p.PAC_Imie1, p.PAC_Nazwisko, a.ADR_Miejscowosc, a.ADR_Ulica, a.ADR_Nr_domu
FROM PACJENT p, ADRES a
WHERE p.ADR_Id = a.ADRk_1_Id AND p.PAC_Nazwisko = (SELECT PAC_Nazwisko FROM PACJENT WHERE PAC_Nazwisko LIKE 'K%');

COLUMN LEK_Imie Heading 'Imie' format A15
COLUMN LEK_Nazwisko Heading 'Nazwisko' format A15
COLUMN ODD_Nazwa Heading 'Nazwa_oddzialu' format A28

create or replace view V_LEK_ODD
(Imie, Nazwisko, Nazwa_oddzialu)
as
select l.LEK_Imie, l.LEK_Nazwisko, od.ODD_Nazwa
FROM LEKARZ l, ODDZIAL od
WHERE l.LEKk_1_Id=od.LEK_Id AND od.ODD_Nazwa = (SELECT ODD_Nazwa FROM ODDZIAL WHERE ODD_Nazwa LIKE 'R%' OR ODD_Nazwa LIKE 'N%');

alter table PACJENT disable constraint FK_PAC_ADR;
alter table ODDZIAL disable constraint FK_ODD_LEK;
alter table PRZYJECIA disable constraint FK_PRZ_PAC;

INSERT INTO V_PAC_ADR(Imie, Nazwisko, Miejscowosc, Ulica, Nr_domu)
VALUES('Karina', 'Krzak', 'Lublin', 'Slowackiego', 4);

INSERT INTO V_LEK_ODD(Imie, Nazwisko, Nazwa_oddzialu)
VALUES('Jan', 'Frycz', 'Zakazny');

UPDATE V_PAC_ADR
SET Imie= 'Karolina'
WHERE Imie='Karina';

UPDATE V_LEK_ODD
SET Nazwa_oddzialu='Kliniczny'
WHERE Nazwa_oddzialu='Zakazny';

DELETE FROM V_PAC_ADR
WHERE Imie='Karolina';

DELETE FROM V_LEK_ODD
WHERE Nazwa_oddzialu='Kliniczny';


alter table PACJENT enable constraint FK_PAC_ADR;
alter table ODDZIAL enable constraint FK_ODD_LEK;
alter table PRZYJECIA enable constraint FK_PRZ_PAC;


PROMPT ;
PROMPT END of SCRIPT;
--
-- zatwierdzenie wszystkich transakcji
--
commit work;