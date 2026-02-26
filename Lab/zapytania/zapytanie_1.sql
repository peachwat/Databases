/* 
Zapytanie 1: Lista więźniów przebywających w celach typu "Pojedyncza" z informacją o rodzaju przestępstwa.
*/
SELECT 
    w.Osoby_ID AS Wiezien_ID,
    o.Imie,
    o.Nazwisko,
    c.Typ AS Typ_celi,
    pw.Opis AS Opis_przestepstwa_wieziennego,
    pw.Data AS Data_przestepstwa_wieziennego,
    rp.Nazwa_rodzaju AS Rodzaj_przestepstwa
FROM 
    Wiezniowie w
JOIN 
    Osoby o ON w.Osoby_ID = o.Osoby_ID
JOIN 
    Odsiadka od ON w.Osoby_ID = od.Osoby_ID
JOIN 
    Cele c ON od.Numer_celi = c.Numer_celi
LEFT JOIN 
    Przestepstwa_w_wiezieniu pw ON od.Odsiadka_ID = pw.Odsiadka_ID
LEFT JOIN 
    Rodzaje_przestepstw rp ON pw.Nazwa_rodzaju = rp.Nazwa_rodzaju
WHERE 
    c.Typ = 'Pojedyncza';

/* 
Uzasadnienie biznesowe:
Zapytanie pozwala uzyskać listę więźniów przebywających w celach izolacyjnych "Pojedyncza" z dodatkowymi informacjami o rodzaju przestępstwa. Takie dane są przydatne do zarządzania zasobami więzienia, oceną ryzyka oraz optymalizacją nadzoru dla osób o wysokim potencjale problematycznym.
*/
