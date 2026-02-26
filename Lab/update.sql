USE PrisonSystem;

ALTER TABLE Odwiedzajacy
ADD CONSTRAINT FK_Osoby
FOREIGN KEY (Osoby_ID) REFERENCES Osoby(Osoby_ID) 
ON DELETE CASCADE;

DELETE FROM Osoby WHERE Osoby_ID = 41;

SELECT * FROM Osoby;
SELECT * FROM Odwiedzajacy;


ALTER TABLE Kary
ADD CONSTRAINT FK_Rodzaj_kary
FOREIGN KEY (Rodzaj_kary) REFERENCES Typy_kar(Rodzaj_kary)
ON UPDATE CASCADE;

UPDATE Typy_kar SET Rodzaj_kary = 'Ograniczenie ilości jedzenia' WHERE Rodzaj_kary = 'Praca w więzieniu';

SELECT * FROM Typy_kar;
SELECT * FROM Kary;

