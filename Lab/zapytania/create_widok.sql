CREATE VIEW WidokWiezniow AS
SELECT 
    w.Osoby_ID AS Wiezien_ID,
    o.Imie,
    o.Nazwisko,
    od.Odsiadka_ID,
    od.Data_rozpoczecia,
    od.Data_zakonczenia,
    od.Planowana_data_zakonczenia AS Planowana_data_zakonczenia_odsiadki,
    c.Numer_celi,
    c.Typ AS Typ_celi,
    c.Pojemnosc,
    k.Rodzaj_kary,
    k.Data_rozpoczecia_kary,
    k.Planowana_data_zakonczenia AS Planowana_data_zakonczenia_kary,
    k.Data_zakonczenia AS Data_kary_zakonczenia,
    k.Czy_kara_wykonana,
    pw.Opis AS Opis_przestepstwa_wieziennego,
    pw.Data AS Data_przestepstwa_wieziennego,
    rp.Nazwa_rodzaju AS Rodzaj_przestepstwa,
    p.Data AS Data_przestepstwa,
    CASE 
        WHEN od.Data_zakonczenia > GETDATE() THEN 1 
        ELSE 0 
    END AS Niezakonczona_odsiadka
FROM 
    Wiezniowie w
JOIN 
    Osoby o ON w.Osoby_ID = o.Osoby_ID
JOIN 
    Odsiadka od ON w.Osoby_ID = od.Osoby_ID
JOIN 
    Cele c ON od.Numer_celi = c.Numer_celi
LEFT JOIN 
    Kary k ON od.Odsiadka_ID = k.Kara_ID
LEFT JOIN 
    Przestepstwa_w_wiezieniu pw ON od.Odsiadka_ID = pw.Odsiadka_ID
LEFT JOIN 
    Przestepstwa p ON od.Odsiadka_ID = p.Odsiadka_ID
LEFT JOIN 
    Rodzaje_przestepstw rp ON p.Nazwa_rodzaju = rp.Nazwa_rodzaju;
