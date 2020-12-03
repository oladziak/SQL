
CLEAR SCREEN;
PROMPT ;
PROMPT logowanie jako STUDENT;
PROMPT ;
--
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
primary key (ADRk_1_Id)
USING INDEX
PCTFREE 0
TABLESPACE STUDENT_INDEX;
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
primary key (PACk_1_Id)
USING INDEX
PCTFREE 0
TABLESPACE STUDENT_INDEX;

PROMPT ;
PROMPT----------------------------------------;
PROMPT Unique Key;
PROMPT----------------------------------------;
PROMPT ;
alter table PACJENT
add constraint UNQ_PAC_PESEL
unique (PAC_Pesel)
USING INDEX
PCTFREE 0
TABLESPACE STUDENT_INDEX;
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
primary key (PIEk_1_Id)
USING INDEX
PCTFREE 0
TABLESPACE STUDENT_INDEX;

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
primary key (SALk_1_Id)
USING INDEX
PCTFREE 0
TABLESPACE STUDENT_INDEX;


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
primary key (GRUk_1_Id)
USING INDEX
PCTFREE 0
TABLESPACE STUDENT_INDEX;

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
primary key (LEKk_1_Id)
USING INDEX
PCTFREE 0
TABLESPACE STUDENT_INDEX;

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
primary key (ODDk_1_Id)
USING INDEX
PCTFREE 0
TABLESPACE STUDENT_INDEX;
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
primary key (BADk_1_Id)
USING INDEX
PCTFREE 0
TABLESPACE STUDENT_INDEX;

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
primary key (PRZk_1_Id)
USING INDEX
PCTFREE 0
TABLESPACE STUDENT_INDEX;

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
primary key (KARk_1_ID)
USING INDEX
PCTFREE 0
TABLESPACE STUDENT_INDEX;

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
PROMPT PROCEDURE;
PROMPT----------------------------------------;
PROMPT ;
--

set serveroutput on;

CREATE or REPLACE PROCEDURE wstawP(gdzie IN number, ile IN number)
IS
	licznik number(2);
BEGIN
	licznik := 1;
	LOOP
		IF gdzie = 1 THEN 
			--WPISZ DO ADRES
			INSERT INTO ADRES (ADR_Kraj, ADR_Miejscowosc, ADR_Ulica, ADR_Nr_domu, ADR_Kod_pocztowy)
				VALUES ('Polska', 'Miejscowosc'|| licznik, 'Ulica'|| licznik, 2|| licznik, '33-33'|| licznik);
		ELSIF gdzie = 2 THEN
			--WPISZ DO LEKARZ
			INSERT INTO LEKARZ (LEK_Imie, LEK_Nazwisko, LEK_Specjalnosc)
				VALUES ('Imie'|| licznik, 'Nazwisko'|| licznik, 'Specjalnosc'|| licznik);
		ELSE
			--WPISZ DO PIELEGNIARKA
			INSERT INTO PIELEGNIARKA (PIE_Imie, PIE_Nazwisko)
				VALUES ('Imie'|| licznik, 'Nazwisko'|| licznik);
		END IF;
		licznik := licznik + 1;
		EXIT WHEN licznik > ile;
	END LOOP;
END;
/

BEGIN
	wstawP(1, 3);
END;
/

COLUMN ADR_Kraj Heading 'Kraj' format A8
COLUMN ADR_Miejscowosc Heading 'Miejscowosc' format A15
COLUMN ADR_Ulica Heading 'Ulica' format A15
COLUMN ADR_Nr_domu Heading 'Nr domu' format 99999999
COLUMN ADR_Kod_pocztowy Heading 'Kod_pocztowy' format A15

SELECT * FROM ADRES;

--
PROMPT ;
PROMPT----------------------------------------;
PROMPT FUNCTION;
PROMPT----------------------------------------;
PROMPT ;
--

CREATE or REPLACE FUNCTION wstawF(co IN number)
RETURN varchar2
IS
	badN BADANIE.BAD_Nazwa%TYPE;
	badW BADANIE.BAD_Wynik%TYPE;
	licz number(2);
BEGIN
	FOR l IN 1 .. 4
	LOOP
		IF co = 1 THEN
			badN := 'Cholesterol calkowity mg/dL';
			badW := l;
		ELSIF co = 2 THEN
			badN := 'Poziom cukru na czczo mg/dL';
			badW := l;
		ELSE
			badN := 'Wapn calkowity mmol/l';
			badW := l;
		END IF;
	
		INSERT INTO BADANIE (BAD_Nazwa, BAD_Wynik)
			VALUES (badN, badW);
		licz := l;
	END LOOP;
	RETURN 'Utworzono wierszy: '|| licz;
END;
/

BEGIN
	DBMS_OUTPUT.PUT_LINE(wstawF(2));
END;
/
	
PROMPT ;
PROMPT END of SCRIPT;
--
-- zatwierdzenie wszystkich transakcji
--
commit work;