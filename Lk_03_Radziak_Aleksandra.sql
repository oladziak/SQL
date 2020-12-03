
CLEAR SCREEN;
PROMPT ;
PROMPT logowanie jako STUDENT;
PROMPT ;
--

--
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
BAD_Nazwa varchar2(20) NOT NULL,
BAD_Wynik varchar2(100) NOT NULL
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


PROMPT----------------------------------------;
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
describe KARTA;
--
--
PROMPT ;
PROMPT END of SCRIPT;
--
-- zatwierdzenie wszystkich transakcji
--
commit work;