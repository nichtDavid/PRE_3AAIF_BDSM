CREATE DATABASE BDSM_Datenbank_hierKundenNamenEinfügen;

USE BDSM_Datenbank_hierKundenNamenEinfügen;


CREATE TABLE Produkt
(
Produkt_ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
Produktname varchar(255) NOT NULL,
Produktart_ID int NOT NULL FOREIGN KEY REFERENCES Produktart (Produktart_ID),
EingeführtAm date,
);

CREATE TABLE Lagereingang
(
Lagereingang_ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
Produkt_ID int NOT NULL FOREIGN KEY REFERENCES Produkt (Produkt_ID),
Datum date,
Lieferant_ID int,
Menge int
)

CREATE TABLE Lagerausgang
(
Lagerausgang_ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
Produkt_ID int NOT NULL FOREIGN KEY REFERENCES Produkt (Produkt_ID),
Datum date,
Menge int
)

CREATE TABLE Produktart
(
Produktart_ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
Produktartname varchar(255)
)

CREATE TABLE Lieferant
(
Lieferant_ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
Name varchar(255),
Adresse varchar(255)
)

CREATE TABLE LieferantPreis
(
Lieferant_ID int NOT NULL FOREIGN KEY REFERENCES Lieferant (Lieferant_ID),
Produkt_ID int NOT NULL FOREIGN KEY REFERENCES Produkt (Produkt_ID),
CONSTRAINT LieferantPreis PRIMARY KEY (Lieferant_ID, Produkt_ID),
Einkaufspreis decimal(10, 2)
)

CREATE TABLE Produkteigenschaft
(
Produkt_ID int NOT NULL FOREIGN KEY REFERENCES Produkt (Produkt_ID),
Eigenschaft_ID int NOT NULL FOREIGN KEY REFERENCES Eigenschaft (Eigenschaft_ID),
CONSTRAINT Produkteigenschaft PRIMARY KEY (Produkt_ID, Eigenschaft_ID)
)

CREATE TABLE Eigenschaft
(
Eigenschaft_ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
Eigenschaftname varchar(255)
)

CREATE TABLE Produktpreis
(
Preis_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
Produkt_ID int NOT NULL FOREIGN KEY REFERENCES Produkt (Produkt_ID),
Ab date,
Bis date,
Preis decimal(10,2)
)

CREATE TABLE Preislog
(
Produkt_ID int NOT NULL FOREIGN KEY REFERENCES Produkt (Produkt_ID),
Preis decimal (10,2),
Eigefuegt_am date
)

CREATE TABLE Rechnungsdetails
(
Rechnungsartikel_ID int NOT NULL IDENTITY (1,1) PRIMARY KEY,
Rechnungsnummer int NOT NULL FOREIGN KEY REFERENCES Rechnung (Rechnungsnummer),
Produkt_ID int NOT NULL FOREIGN KEY REFERENCES Produkt (Produkt_ID),
Anzahl int,
Verkaufspreis decimal(10,2),
CONSTRAINT Rechnungsdetails PRIMARY KEY (Rechnungsartikel_ID, Rechnungsnummer)
)

CREATE TABLE Rechnung
(
Rechnungsnummer int NOT NULL IDENTITY(1,1) PRIMARY KEY,
Rechnungsdatum date,
Rechnungspreis decimal (10,2)
)
