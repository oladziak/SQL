
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
LEK_Specjalnosc varchar2(50)
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
CREATE OR REPLACE 
TYPE Tvar_ID IS VARRAY(2) OF number(8);
/
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT FUNCTION WSTAW_ADR_PAC;
PROMPT----------------------------------------;
PROMPT ;
--

CREATE or REPLACE FUNCTION WSTAW_ADR_PAC(
inADR_KRAJ in ADRES.ADR_Kraj%TYPE,
inADR_MIEJ in ADRES.ADR_Miejscowosc%TYPE,
inADR_ULICA in ADRES.ADR_Ulica%TYPE,
inADR_NRDOMU in ADRES.ADR_Nr_domu%TYPE,
inADR_KOD in ADRES.ADR_Kod_pocztowy%TYPE,
inPAC_IMIE in PACJENT.PAC_Imie1%TYPE,
inPAC_NAZW in PACJENT.PAC_Nazwisko%TYPE,
inPAC_PESEL in PACJENT.PAC_Pesel%TYPE,
inPAC_DATAURO in PACJENT.PAC_Data_urodzenia%TYPE,
inPAC_MIEJSCEURO in PACJENT.PAC_Miejsce_urodzenia%TYPE
)
RETURN Tvar_ID
IS
	PRAGMA AUTONOMOUS_TRANSACTION;
	--
	ADR_ID_curr ADRES.ADRk_1_Id%TYPE;
	PAC_ID_curr PACJENT.PACk_1_Id%TYPE;
	--
	wyjatek EXCEPTION;
	PRAGMA EXCEPTION_INIT(wyjatek, -20002);
	--
	--rekord na return
	PAC_ID_ADR_ID Tvar_ID;

BEGIN
	--
	PAC_ID_ADR_ID := Tvar_ID(0, 0);
	--
	--kursor niejawny RETURNING
	INSERT INTO ADRES (ADR_Kraj, ADR_Miejscowosc, ADR_Ulica, ADR_Nr_domu, ADR_Kod_pocztowy)
	VALUES (inADR_KRAJ, inADR_MIEJ, inADR_ULICA, inADR_NRDOMU, inADR_KOD)
	RETURNING ADRk_1_Id
	INTO ADR_ID_curr;
	--
	IF SQL%FOUND THEN
		--kursor niejawny RETURNING
		INSERT INTO PACJENT (PAC_Imie1, PAC_Nazwisko, PAC_Pesel, PAC_Data_urodzenia, PAC_Miejsce_urodzenia, ADR_Id)
		VALUES (inPAC_IMIE, inPAC_NAZW, inPAC_PESEL, inPAC_DATAURO, inPAC_MIEJSCEURO, ADR_ID_curr)
		RETURNING PACk_1_Id
		INTO PAC_ID_curr;
		--
		IF SQL%FOUND THEN 
			COMMIT;
			--
			PAC_ID_ADR_ID(1) := ADR_ID_curr;
			PAC_ID_ADR_ID(2) := PAC_ID_curr;
			--
			RETURN PAC_ID_ADR_ID;
		ELSE
			ROLLBACK;
			--
			RAISE_APPLICATION_ERROR(-20002, 'Nie wykonal sie update i insert!');
		END IF;
		--
	ELSE
		ROLLBACK;
		--
		RETURN PAC_ID_ADR_ID;
	END IF;
	--
	EXCEPTION
				WHEN wyjatek THEN
					DBMS_OUTPUT.PUT_LINE('INSERT2_ADR_PAC - Wykryto błąd: '||SQLERRM);
				WHEN OTHERS THEN
					DBMS_OUTPUT.PUT_LINE('Nieokreslony błąd w INSERT2_ADR_PAC:'||SQLERRM);
END;
/

--
PROMPT ;
PROMPT----------------------------------------;
PROMPT PROCEDURE PAC_ADR_GENERATOR;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE or REPLACE PROCEDURE PAC_ADR_GENERATOR(ile_miejsc IN number)
IS
	type TMiejscowosc is VARRAY(128) of VARCHAR2(255);
	type TUlice is VARRAY(256) of VARCHAR2(255);
	--
	type TImiona is VARRAY(256) of VARCHAR2(60);
	type TNazwiska is VARRAY(256) of VARCHAR2(60);
	type TDniWMiesiacu is varray(256) of number(2);
	--
	--
	lista_miejscowosci TMiejscowosc := TMiejscowosc(
	'Babice', 'Balice', 'Barcice Górne', 'Biadoliny Szlacheckie', 'Białka Tatrzańska',
	'Biały Dunajec', 'Biecz', 'Bielcza', 'Bobowa', 'Bobrek', 'Gdów', 'Gnojnik', 
	'Gorenice', 'Gorlice', 'Gołcza', 'Gołkowice Dolne', 'Raba Wyżna', 'Rabka-Zdrój', 
	'Raciechowice', 'Racławice', 'Radgoszcz', 'Radziemice', 'Radziszów', 'Radłów', 'Ropa');
		
	lista_ulic TUlice := TUlice(
	'Kopernika', 'Piłsudskiego', 'Armii Krajowej', 'Daleka', 'Dmowskiego', 'Dworska', 
	'Jeziorna', 'Kostromska', 'Kujawska', 'Logistyczna', 'Łódzka', '3-go Maja', 
	'Próchnika', 'Przedborska', 'Przemysłowa', 'Rolnicza', 'Roosevelta', 'Sadowa', 
	'Sienkiewicza', 'Sikorskiego', 'Wysoka', 'Wyzwolenia', 'Zalesicka', 'Żelazna', 'Żeromskiego', 
	'Stare Miasto', 'Starowarszawska', 'Stodolniana', 'Świerczowska', 'Targowa', 'Zamenhofa', 
	'Zjazdowa', 'Batorego', 'Broniewskiego', 'Częstochowska', 'Daniłowskiego');

	lista_imion TImiona := TImiona(
	'Ada', 'Adela', 'Adelajda', 'Adrianna', 'Agata', 'Agnieszka', 'Aldona', 'Aleksandra', 
	'Adam', 'Adolf', 'Adrian', 'Albert', 'Aleksander', 'Aleksy', 'Blanka', 'Bogusława', 'Bożena', 
	'Fabian', 'Feliks', 'Ferdynand', 'Filip', 'Franciszek', 'Fryderyk', 'Hanna', 'Helena', 
	'Kazimierz', 'Klaudiusz', 'Konrad', 'Krystian', 'Krzysztof', 'Magdalena', 'Maja', 'Malwina', 
	'Małgorzata', 'Patryk', 'Paweł', 'Piotr', 'Przemysław', ' Roksana', 'Róża', 'Rozalia', 
	'Weronika', 'Wiesława', 'Wiktoria', 'Wioletta', 'Zbigniew', 'Zdzisław', 'Zenon', 'Zygmunt');

	list_nazwisk TNazwiska := TNazwiska(
	'Bąk', 'Jakubowski', 'Sadowski', 'Duda', 'Włodarczyk', 'Wilk', 'Chmielewski', 'Borkowski', 
	'Sokołowski', 'Szczepański', 'Sawicki', 'Kucharski', 'Lis', 'Maciejewski', 'Kubiak', 
	'Kalinowski', 'Mazurek', 'Wysocki', 'Kołodziej', 'Kaźmierczak', 'Czarnecki', 'Sobczak', 
	'Konieczny', 'Urbański', 'Głowacki', 'Wasilewski', 'Sikorski', 'Zakrzewski', 'Krajewski', 
	'Krupa', 'Laskowski', 'Ziółkowski', 'Gajewski', 'Mróz', 'Brzeziński', 'Szulc', 'Szymczak', 
	'Makowski', 'Baranowski', 'Przybylski', 'Kaczmarczyk', 'Borowski', 'Błaszyk', 'Adamski', 
	'Górecki', 'Chojnacki', 'Kania', 'Leszczyński', 'Janik', 'Szczepaniak', 'Czerwiński', 
	'Kozioł', 'Mucha', 'Lipiński', 'Wesołowski', 'Kozak', 'Cieślak', 'Kowalewski', 'Kowalik');

	lista_dni_w_miesiacu TDniWMiesiacu := TDniWMiesiacu (
    1, 25, 3, 14, 5, 26, 7, 18, 19, 10, 11, 12);
	--
	vADR_MIEJSCOWOSC ADRES.ADR_Miejscowosc%TYPE;
	vADR_ULICA ADRES.ADR_Ulica%TYPE;
	vADR_NRDOMU ADRES.ADR_Nr_domu%TYPE;
	vADR_KOD ADRES.ADR_Kod_pocztowy%TYPE;
	--
	index_miejscowosc number;
	index_ulica number;
	--
	--
	vPAC_IMIE PACJENT.PAC_Imie1%TYPE;
	vPAC_NAZWISKO PACJENT.PAC_Nazwisko%TYPE;
	vPAC_PESEL PACJENT.PAC_Pesel%TYPE;
	vPAC_DATAURO PACJENT.PAC_Data_urodzenia%TYPE;
	vPAC_MIEJSCEURO PACJENT.PAC_Miejsce_urodzenia%TYPE;
	--
	index_imie number;
	index_nazwisko number;
	index_miejsceuro number;
	index_dzien number;
	rok number;
	miesiac number;
	dzien number;
	--
	PRAGMA AUTONOMOUS_TRANSACTION; 
	-- REKORD NA RETURN
	newPAC_ID_ADR_ID Tvar_ID := Tvar_ID();
	--
	EX_INSERT_PACJENT EXCEPTION;
			PRAGMA EXCEPTION_INIT(EX_INSERT_PACJENT,-20011);
	EX_INSERT_ADRES EXCEPTION;
			PRAGMA EXCEPTION_INIT(EX_INSERT_ADRES,-20012);
	EX_OTHER EXCEPTION;
			PRAGMA EXCEPTION_INIT(EX_OTHER,-20013);
begin
	DBMS_RANDOM.INITIALIZE(123456);
	--
	for var_i in 1 .. ile_miejsc
	loop
	--
		index_miejscowosc := floor(DBMS_RANDOM.VALUE(1, lista_miejscowosci.COUNT+0.9));
		index_ulica := floor(DBMS_RANDOM.VALUE(1, lista_ulic.COUNT+0.9));
		--
		vADR_MIEJSCOWOSC := lista_miejscowosci(index_miejscowosc);
		vADR_ULICA := lista_ulic(index_ulica);
		--
		vADR_KOD := LPAD(floor(DBMS_RANDOM.VALUE(0, 99)), 2, '0')||'-'||LPAD(floor(DBMS_RANDOM.VALUE(0, 999)), 3, '0');
		--
		vADR_NRDOMU := ceil(DBMS_RANDOM.VALUE(0,99));
		--
		index_imie := floor(DBMS_RANDOM.VALUE(1,lista_imion.COUNT+0.9));
		index_nazwisko := floor(DBMS_RANDOM.VALUE(1,list_nazwisk.COUNT+0.9));
		--
		vPAC_IMIE := lista_imion(index_imie);
		vPAC_NAZWISKO := list_nazwisk(index_nazwisko);
		--
		index_miejsceuro := floor(DBMS_RANDOM.VALUE(1, lista_miejscowosci.COUNT+0.9));
		vPAC_MIEJSCEURO := lista_miejscowosci(index_miejsceuro);
		--
		index_dzien := floor(dbms_random.value(1, lista_dni_w_miesiacu.count + 0.9));
		rok := floor(dbms_random.value(1920, 2020));
		miesiac := lpad(index_dzien, 2, '0');
		dzien := floor(dbms_random.value(1, lista_dni_w_miesiacu(index_dzien) + 0.9));
		vPAC_DATAURO := rok||'-'||miesiac||'-'||dzien;
		--
		vPAC_PESEL := lpad(rok, 2)||miesiac||dzien||lpad(floor(DBMS_RANDOM.VALUE(0, 99999)), 5, '0');

		-----------------------
		-- funkcja do wstawiania danych
		------------------------
		newPAC_ID_ADR_ID := WSTAW_ADR_PAC('Polska', vADR_MIEJSCOWOSC, vADR_ULICA, vADR_NRDOMU, 
		vADR_KOD, vPAC_IMIE, vPAC_NAZWISKO, vPAC_PESEL, vPAC_DATAURO, vPAC_MIEJSCEURO);
		---
		if  newPAC_ID_ADR_ID(1) = 0 then
				--
				ROLLBACK;
				RAISE_APPLICATION_ERROR(-20011,'ADR_ID == NULL');
				--
			elsif newPAC_ID_ADR_ID(2) = 0 then
				--
				ROLLBACK;
				RAISE_APPLICATION_ERROR(-20012,'PAC_ID == NULL');
				--				
			elsif newPAC_ID_ADR_ID(1) > 0 and newPAC_ID_ADR_ID(2) > 0 then	
				COMMIT;
			else
				--
				ROLLBACK;
				RAISE_APPLICATION_ERROR(-20013,'err - INSERT2_ADR_PAC');
				--
			end if;
		--
	end loop;
	--
	commit work;
EXCEPTION
	WHEN EX_INSERT_PACJENT THEN
		dbms_output.put_line(chr(10)||'bd1_pGENERATOR_MIE_OSO: EXCEPTION EX_INSERT_MIEJSCE');	
		ROLLBACK; 
	WHEN EX_INSERT_ADRES THEN
		dbms_output.put_line(chr(10)||'bd1_pGENERATOR_MIE_OSO: EXCEPTION EX_INSERT_OSOBA');	
		ROLLBACK;
	WHEN EX_OTHER THEN
		dbms_output.put_line(chr(10)||'bd1_pGENERATOR_MIE_OSO: EXCEPTION EX_OTHER');	
		ROLLBACK; 		
	WHEN VALUE_ERROR THEN
		dbms_output.put_line(chr(10)||'bd1_pGENERATOR_MIE_OSO: EXCEPTION VALUE_ERROR');		
		ROLLBACK; 
	WHEN INVALID_NUMBER THEN
		dbms_output.put_line(chr(10)||'bd1_pGENERATOR_MIE_OSO: EXCEPTION INVALID_NUMBER');		
		ROLLBACK; 
	WHEN OTHERS THEN
		dbms_output.put_line(chr(10)||'bd1_pGENERATOR_MIE_OSO: '||SQLERRM);	
		ROLLBACK; 	
END;
/

--SELECT
SELECT COUNT(ADRk_1_Id) from ADRES;
--
SELECT COUNT(PACk_1_Id) from PACJENT;
--
begin
  PAC_ADR_GENERATOR(100);
end;
/
--
SELECT COUNT(ADRk_1_Id) from ADRES;
--
SELECT COUNT(PACk_1_Id) from PACJENT;
--
PROMPT ;
PROMPT END of SCRIPT;
--
-- zatwierdzenie wszystkich transakcji
--
commit work;
	