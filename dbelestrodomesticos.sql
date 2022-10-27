CREATE DATABASE dbelectrodomesticos;

USE dbelectrodomesticos;

CREATE TABLE CLIENTE (
	CODCLI char(4),
    NOMCLI varchar(60),
    APECLI varchar(80),
    EMACLI varchar(80),
    CELCLI char(9),
    DIRCLI varchar(70),
    ESTCLI char(1),
    CONSTRAINT CODCLI_PK PRIMARY KEY (CODCLI)
);

CREATE TABLE VENDEDOR (
	CODVEND char(4),
    NOMBVEND varchar(60),
    APEVEND varchar(80),
    EMAVEND varchar(80),
    CELVEND char(9),
    DIRVEND varchar(70),
    ESTVEND char(1),
	CONSTRAINT CODVEND_PK PRIMARY KEY (CODVEND)
);

CREATE TABLE PRODUCTO (
	CODPRO char(5),
    DESCPRO varchar(60),
    CETPRO char(1),
    PREPRO decimal(8.2),
    STOCKPRO int,
    ESTPRO char(1),
    CONSTRAINT CODPRO_PK PRIMARY KEY (CODPRO)
);

CREATE TABLE PROVEEDOR (
	CODPROV char(1),
    RAZSOCPROV varchar(90),
    RUCPROV varchar(11),
    EMAPROV varchar(70),
    ESTPROV char(1),
    CONSTRAINT CODPROV_PK PRIMARY KEY (CODPROV)
);

CREATE TABLE VENTA (
	CODVEN char(5),
    NOMVEN datetime,
    APEVEN char(4),
    EMAVEN char(4),
    CELVEN char(1),
    CONSTRAINT CODVEN_PK PRIMARY KEY (CODVEN)
);

CREATE TABLE VENTADETALLE (
	IDVENDET int,
    CODVEN char(5),
    CODPRO char(5),
    CANTPRO int,
    CONSTRAINT IDVENDET_PK PRIMARY KEY (IDVENDET)
);

CREATE TABLE COMPRA(
	CODCOM char(5),
    FECCOM datetime,
    CODVEND char(4),
    CODPROV char(5),
    ESTCOM char(1),
    CONSTRAINT CODCOM_PK PRIMARY KEY (CODCOM)
);

CREATE TABLE COMPRADETALLE (
	IDCOMDET int,
    CODCOM char(5),
    CODPRO char(5),
    CANTPRO int,
    CONSTRAINT IDCOMDET_PK PRIMARY KEY (IDCOMDET)
);

ALTER TABLE COMPRA
	ADD CONSTRAINT CODVEND_FK FOREIGN KEY (CODVEND) 
    REFERENCES VENDEDOR (CODVEND);
    
ALTER TABLE COMPRA
	ADD CONSTRAINT CODPROV_FK FOREIGN KEY (CODPROV) 
    REFERENCES PROVEEDOR (CODPROV);

ALTER TABLE VENTADETALLE
	ADD CONSTRAINT CODPRO_FK FOREIGN KEY (CODPRO) 
    REFERENCES PRODUCTO (CODPRO);
    
ALTER TABLE VENTADETALLE
	ADD CONSTRAINT CODVEN_FK FOREIGN KEY (CODVEN) 
    REFERENCES VENTA (CODVEN);
    
ALTER TABLE COMPRADETALLE
	ADD CONSTRAINT CODPRO_FK FOREIGN KEY (CODPRO) 
    REFERENCES PRODUCTO (CODPRO);
    
ALTER TABLE COMPRADETALLE
	ADD CONSTRAINT CODCOM_FK FOREIGN KEY (CODCOM) 
    REFERENCES COMPRA (CODCOM);