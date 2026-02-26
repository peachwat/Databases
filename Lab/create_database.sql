USE PrisonSystem;

CREATE TABLE Osoby (
    Osoby_ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL CHECK (Osoby_ID >= 0),
    Imie NVARCHAR(40) NOT NULL CHECK (LEN(Imie) >= 2),
    Nazwisko NVARCHAR(40) NOT NULL CHECK (LEN(Nazwisko) >= 2),
    Data_urodzenia DATE NOT NULL CHECK (Data_urodzenia >= '1900-01-01'),
    Pesel BIGINT NOT NULL UNIQUE CHECK (Pesel > 9999999999 AND Pesel <= 99999999999),
    Kod_Pocztowy NVARCHAR(6) NOT NULL CHECK (LEN(Kod_Pocztowy) = 6),
    Miasto NVARCHAR(40) NOT NULL CHECK (LEN(Miasto) >= 2),
    Ulica NVARCHAR(100) NOT NULL CHECK (LEN(Ulica) >= 3),
    Numer_domu_mieszkania NVARCHAR(10) NOT NULL CHECK (LEN(Numer_domu_mieszkania) >= 1)
);

CREATE TABLE Wiezniowie (
    Osoby_ID INT PRIMARY KEY NOT NULL CHECK (Osoby_ID >= 0),
    FOREIGN KEY (Osoby_ID) REFERENCES Osoby(Osoby_ID)
);

CREATE TABLE Straznicy (
    Osoby_ID INT PRIMARY KEY NOT NULL CHECK (Osoby_ID >= 0),
    Pozycja NVARCHAR(100) NOT NULL CHECK (LEN(Pozycja) >= 3),
    Odziez_robocza BIT NOT NULL,
    FOREIGN KEY (Osoby_ID) REFERENCES Osoby(Osoby_ID)
);

CREATE TABLE Odwiedzajacy (
    Osoby_ID INT PRIMARY KEY NOT NULL CHECK (Osoby_ID >= 0),
    Byly_wiezien BIT NOT NULL,
    FOREIGN KEY (Osoby_ID) REFERENCES Osoby(Osoby_ID)
);

CREATE TABLE Cele (
    Numer_celi INT PRIMARY KEY NOT NULL IDENTITY(1,1) CHECK (Numer_celi >= 0),
    Typ NVARCHAR(100) NOT NULL CHECK (LEN(Typ) >= 3),
    Pojemnosc INT NOT NULL CHECK(Pojemnosc >= 1 AND Pojemnosc <= 6)
);

CREATE TABLE Odsiadka (
    Odsiadka_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1) CHECK (Odsiadka_ID >= 0),
    Data_rozpoczecia DATE NOT NULL CHECK (Data_rozpoczecia >= '1900-01-01'),
    Planowana_data_zakonczenia DATE NOT NULL,
    Data_zakonczenia DATE NOT NULL,
    Osoby_ID INT NOT NULL CHECK (Osoby_ID >= 0),
    Numer_celi INT NOT NULL CHECK (Numer_celi >= 1),
    CHECK (Planowana_data_zakonczenia > Data_rozpoczecia),
    CHECK (Data_zakonczenia > Data_rozpoczecia),
    FOREIGN KEY (Osoby_ID) REFERENCES Wiezniowie(Osoby_ID),
    FOREIGN KEY (Numer_celi) REFERENCES Cele(Numer_celi)
);

CREATE TABLE Odwiedziny (
    Odwiedziny_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1) CHECK (Odwiedziny_ID >= 0),
    Czas_rozpoczecia_vizyty TIME NOT NULL,
    Czas_zakonczenia_vizyty TIME NOT NULL,
    Data DATE NOT NULL CHECK (Data >= '2000-01-01'),
    Osoby_ID INT NOT NULL CHECK (Osoby_ID >= 0),
    Odsiadka_ID INT CHECK (Odsiadka_ID >= 0),
    FOREIGN KEY (Osoby_ID) REFERENCES Odwiedzajacy(Osoby_ID) ON DELETE CASCADE,
    FOREIGN KEY (Odsiadka_ID) REFERENCES Odsiadka(Odsiadka_ID)
);

CREATE TABLE Rodzaje_przestepstw (
    Nazwa_rodzaju NVARCHAR(200) PRIMARY KEY NOT NULL CHECK (LEN(Nazwa_rodzaju) >= 3)
);

CREATE TABLE Przestepstwa (
    Przestepstwa_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1) CHECK (Przestepstwa_ID >= 0),
    Data DATE NOT NULL CHECK (Data >= '1900-01-01'),
    Odsiadka_ID INT NOT NULL CHECK (Odsiadka_ID >= 0),
    Nazwa_rodzaju NVARCHAR(200) NOT NULL CHECK (LEN(Nazwa_rodzaju) >= 3),
    FOREIGN KEY (Odsiadka_ID) REFERENCES Odsiadka(Odsiadka_ID),
    FOREIGN KEY (Nazwa_rodzaju) REFERENCES Rodzaje_przestepstw(Nazwa_rodzaju)
);

CREATE TABLE Typy_kar (
    Rodzaj_kary NVARCHAR(200) PRIMARY KEY NOT NULL CHECK (LEN(Rodzaj_kary) >= 3)
);

CREATE TABLE Kary (
    Kara_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1) CHECK (Kara_ID >= 0),
    Data_rozpoczecia_kary DATE NOT NULL CHECK (Data_rozpoczecia_kary >= '2000-01-01'),
    Planowana_data_zakonczenia DATE NOT NULL,
    Data_zakonczenia DATE NOT NULL,
    CHECK (Planowana_data_zakonczenia >= Data_rozpoczecia_kary),
    CHECK (Data_zakonczenia >= Data_rozpoczecia_kary),
    Czy_kara_wykonana BIT NOT NULL,
    Rodzaj_kary NVARCHAR(200) NOT NULL CHECK (LEN(Rodzaj_kary) >= 3),
    FOREIGN KEY (Rodzaj_kary) REFERENCES Typy_kar(Rodzaj_kary)
);

CREATE TABLE Przestepstwa_w_wiezieniu (
    Przestepstwa_wiezienne_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1) CHECK (Przestepstwa_wiezienne_ID >= 0),
    Opis NVARCHAR(1000) NOT NULL CHECK (LEN(Opis) >= 3),
    Data DATE NOT NULL CHECK (Data >= '2000-01-01'),
    Odsiadka_ID INT CHECK (Odsiadka_ID >= 0),
    Nazwa_rodzaju NVARCHAR(200) NOT NULL CHECK (LEN(Nazwa_rodzaju) >= 3),
    Kara_ID INT CHECK (Kara_ID >= 0),
    FOREIGN KEY (Odsiadka_ID) REFERENCES Odsiadka(Odsiadka_ID),
    FOREIGN KEY (Nazwa_rodzaju) REFERENCES Rodzaje_przestepstw(Nazwa_rodzaju),
    FOREIGN KEY (Kara_ID) REFERENCES Kary(Kara_ID)
);
