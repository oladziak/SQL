
CLEAR SCREEN;
PROMPT ;
PROMPT logowanie jako STUDENT;
PROMPT ;
--
-- 
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
DELETE FROM V_BADANIE;
DROP TABLE V_BADANIE;
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

---------------------------
PROMPT   typy 												###LAB14###
---------------------------
-- TYP GLOBALNY w schemacie użtkownika - VARRAY
CREATE or REPLACE TYPE badanie_t_v_nazwa IS VARRAY(50) OF varchar2(80);
/

-- TYP GLOBALNY w schemacie użtkownika - TABLE
CREATE or REPLACE TYPE badanie_t_t_nazwa IS TABLE OF varchar2(80);
/


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
PROMPT CREATE TABLE BADANIE											###LAB14###;
PROMPT----------------------------------------;
PROMPT ;
--
create table BADANIE
(
BADk_1_Id number(10) NOT NULL,
BAD_Nazwa badanie_t_t_nazwa,
BAD_Wynik number(5) NOT NULL
)NESTED TABLE BAD_Nazwa STORE AS TAB_NESTED_BADANIE
PCTFREE 5
TABLESPACE STUDENT_DATA; 

PROMPT ;
PROMPT----------------------------------------;
PROMPT NOLOGGING;
PROMPT----------------------------------------;
PROMPT ;

ALTER TABLE BADANIE NOLOGGING;

PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table BADANIE
add constraint PK_BADANIE
primary key (BADk_1_Id)
USING INDEX
PCTFREE 1
TABLESPACE STUDENT_INDEX
NOLOGGING;

------------------------
-- SEQUENCE
------------------------

drop sequence SEQ_BADANIE;
--
create sequence SEQ_BADANIE increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--

------------------------
-- TRIGGER
------------------------

 create or replace trigger T_BI_BADANIE
before insert on BADANIE
for each row
begin
 if :new.BADk_1_Id is NULL then
 SELECT SEQ_BADANIE.nextval INTO :new.BADk_1_Id FROM dual;
 end if;
end;
/ 

PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE V_BADANIE											###LAB14###;
PROMPT----------------------------------------;
PROMPT ;
--
create table V_BADANIE
(
V_BADk_1_Id number(10) NOT NULL,
V_BAD_Nazwa badanie_t_v_nazwa,
V_BAD_Wynik number(5) NOT NULL
)
PCTFREE 5
TABLESPACE STUDENT_DATA;

PROMPT ;
PROMPT----------------------------------------;
PROMPT NOLOGGING;
PROMPT----------------------------------------;
PROMPT ;

ALTER TABLE V_BADANIE NOLOGGING;

PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ; 

alter table V_BADANIE
add constraint PK_V_BADANIE
primary key (V_BADk_1_Id)
USING INDEX
PCTFREE 1
TABLESPACE STUDENT_INDEX
NOLOGGING;

------------------------
-- SEQUENCE
------------------------

drop sequence SEQ_V_BADANIE;
--
create sequence SEQ_V_BADANIE increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--

------------------------
-- TRIGGER
------------------------

 create or replace trigger T_BI_V_BADANIE
before insert on V_BADANIE
for each row
begin
 if :new.V_BADk_1_Id is NULL then
 SELECT SEQ_V_BADANIE.nextval INTO :new.V_BADk_1_Id FROM dual;
 end if;
end;
/ 

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

column TABLE_NAME HEADING 'NAME' for A32
column DROPPED HEADING 'NAME' for A32

PROMPT Lista utworzonych tabel:	

	SELECT TABLE_NAME FROM USER_TABLES
	WHERE DROPPED='NO';
	
-----
--INSERT
-----
INSERT INTO BADANIE(BAD_Nazwa, BAD_Wynik)
	VALUES(badanie_t_t_nazwa('poziom krwi', 'cholesterol', 'TSH'), 23);

INSERT INTO BADANIE(BAD_Nazwa, BAD_Wynik)
	VALUES(badanie_t_t_nazwa('glukoza', 'cholesterol', 'FSH'), 54);
	
	
column BADk_1_Id Heading 'ID' format 999
column BAD_Nazwa Heading 'Nazwa badania' format A1000
column BAD_Wynik Heading 'Wynik badania [mg/ml]' format A20

	select * from BADANIE;
	
	set termout off
	set verify off
	set trimspool on
	set linesize 20000
	set longchunksize 200000
	set long 200000
	set pages 0
	spool "C:\Users\Aleksandra\Desktop\studia\4semestr\BazyDanych\sql\Lk_14_Radziak_Aleksandra_PLSQL6.NESTED.txt";
		select * from BADANIE;
		spool off;
		
-----
--INSERT
-----
INSERT INTO V_BADANIE(V_BAD_Nazwa, V_BAD_Wynik)
	VALUES(badanie_t_v_nazwa('cholesterol', 'FSH'), 44);

INSERT INTO V_BADANIE(V_BAD_Nazwa, V_BAD_Wynik)
	VALUES(badanie_t_v_nazwa('glukoza', 'TSH'), 11);
	

column V_BADk_1_Id Heading 'ID' format 999
column V_BAD_Nazwa Heading 'Nazwa badania' format A1000
column V_BAD_Wynik Heading 'Wynik badania [mg/ml]' format A20

select * from V_BADANIE;

	set termout off
	set verify off
	set trimspool on
	set linesize 20000
	set longchunksize 200000
	set long 200000
	set pages 0
	spool "C:\Users\Aleksandra\Desktop\studia\4semestr\BazyDanych\sql\Lk_14_Radziak_Aleksandra_PLSQL6.VARRAY.txt"; 
		select * from V_BADANIE;
	spool off;
	
	select v.* from V_BADANIE t, TABLE(t.V_BAD_Nazwa) v WHERE t.V_BAD_Wynik = 44;
	
	column crs HEADING 'Kursor' for A20
	SELECT t.V_BAD_Wynik, CURSOR(SELECT * FROM TABLE(t.V_BAD_Nazwa)) crs
	FROM V_BADANIE t where t.V_BAD_Wynik = 44;
	
PROMPT ;
PROMPT----------------------------------------;
PROMPT PROCEDURE;
PROMPT----------------------------------------;
PROMPT ;

create or replace procedure dodajnazwe(inID in BADANIE.BADk_1_Id%TYPE, inNazwa in varchar2)
is
	nazwy BADANIE.BAD_Nazwa%TYPE;
	nazwa varchar2(80);
	PRAGMA AUTONOMOUS_TRANSACTION;
	EX_TOO_MANY_ERROR EXCEPTION;
		PRAGMA EXCEPTION_INIT(EX_TOO_MANY_ERROR,-20001);
	EX_INSERT_ERROR EXCEPTION;
		PRAGMA EXCEPTION_INIT(EX_INSERT_ERROR,-20002);
begin
	select BAD_Nazwa into nazwy from BADANIE where BADk_1_Id = inID;
	if nazwy.count >= 2 then
		RAISE_APPLICATION_ERROR(-20001,'Nie mozna dodac wiecej niz 2 nazwy');
	else
		if nazwy.exists(1) then
			nazwa := nazwa(1);
		else 
				nazwa := nazwa(2);
		end if;
		nazwy := badanie_t_t_nazwa(nazwa, inNazwa);
	end if;
	update BADANIE 
	set BAD_Nazwa = nazwy
	where BADk_1_Id = inID;
	if sql%NOTFOUND then
		ROLLBACK;
		RAISE_APPLICATION_ERROR(-20002,'Nie udalo sie dodac imienia');
	end if;
	commit;
exception
	when EX_TOO_MANY_ERROR then
		DBMS_OUTPUT.PUT_LINE('dodajnazwe - Wykryto blad: '||SQLERRM);
	when EX_INSERT_ERROR then
		DBMS_OUTPUT.PUT_LINE('dodajnazwe - Wykryto blad: '||SQLERRM);
	when OTHERS then
		DBMS_OUTPUT.PUT_LINE('Nieokreslony blad w procedurze dodajnazwe!');
		DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
		DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_CALL_STACK);
end;
/

begin
dodajnazwe(1, 'FSH');
end;
/
--
select * from BADANIE;
--
create or replace procedure szukajnazwy(inNazwa in varchar2, iNazwa in number)
is
	cursor cur_nazwa IS
		select * from BADANIE;
	wiersz cur_nazwa%ROWTYPE;
	PRAGMA AUTONOMOUS_TRANSACTION;
begin
	open cur_nazwa;
	loop fetch cur_nazwa into wiersz;
		exit when cur_nazwa%NOTFOUND;
		if wiersz.BAD_Nazwa.EXISTS(iNazwa) then
			if wiersz.BAD_Nazwa(iNazwa) = inNazwa then
				if wiersz.BAD_Nazwa.count = 2 then
					DBMS_OUTPUT.PUT_LINE('BADANIE: ID: '||wiersz.BADk_1_Id||', nazwy: '||wiersz.BAD_Nazwa(1)||', '||wiersz.BAD_Nazwa(2)||', wynik: '||wiersz.BAD_Wynik);
				else 
						DBMS_OUTPUT.PUT_LINE('BADANIE: ID: '||BADk_1_Id||', nazwy: '||wiersz.BAD_Nazwa(1)||', wynik: '||wiersz.BAD_Wynik);
				end if;
			end if;
		end if;
	end loop;
	close cur_nazwa;
	commit;
exception
	when OTHERS then
		DBMS_OUTPUT.PUT_LINE('Nieokreslony blad w procedurze szukajnazwy!');
		DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
		DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_CALL_STACK);
end;
/

begin
szukajnazwy('FSH', 1);
end;
/

--
create or replace procedure zmiananazwy(inID in BADANIE_BADk_1%TYPE, nNazwa in number, inNowaNazwa in varchar2)
is
	nazwy BADANIE.BAD_Nazwa%TYPE;
	nazwa varchar2(80);
	PRAGMA AUTONOMOUS_TRANSACTION;
	EX_TOO_MANY_ERROR EXCEPTION;
		PRAGMA EXCEPTION_INIT(EX_TOO_MANY_ERROR,-20021);
	EX_INSERT_ERROR EXCEPTION;
		PRAGMA EXCEPTION_INIT(EX_INSERT_ERROR,-20022);
begin
	select BAD_Nazwa into nazwy from BADANIE where BADk_1_Id = inID;
	if nNazwa > 2 then
		ROLLBACK;
		RAISE_APPLICATION_ERROR(-20021,'Moga byc tylko 2 nazwy');
	elsif nNazwa = 1 then
		if nazwy.EXISTS(2) then
			nazwa := nazwy(2);
			nazwy := badanie_t_t_nazwa(inNowaNazwa, nazwa);
		else
			nazwy := badanie_t_t_nazwa(inNowaNazwa);
		end if;
	else
		nazwa := nazwy(1);
		nazwy := badanie_t_t_nazwa(nazwa, inNowaNazwa);
	end if;
	update BADANIE 
	set BAD_Nazwa = nazwy
	where BADk_1_Id = inID;
	if sql%NOTFOUND then
		ROLLBACK;
		RAISE_APPLICATION_ERROR(-20022,'Nie udalo sie dodac lub zmienic nazwy');
	end if;
	commit;
exception
	when EX_TOO_MANY_ERROR then
		DBMS_OUTPUT.PUT_LINE('zmiana nazwy - Wykryto blad: '||SQLERRM);
	when EX_INSERT_ERROR then
		DBMS_OUTPUT.PUT_LINE('zmiana nazwy - Wykryto blad: '||SQLERRM);
	when OTHERS then
		DBMS_OUTPUT.PUT_LINE('Nieokreslony blad w procedurze zmiananazwy!');
		DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
		DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_CALL_STACK);
end;
/

begin
zmiananazwy(2, 2, 'cholesterol'):
end;
/

PROMPT ;
PROMPT END of SCRIPT;
--
-- zatwierdzenie wszystkich transakcji
--
commit work;
	