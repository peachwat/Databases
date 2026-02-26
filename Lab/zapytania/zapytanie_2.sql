/* 
Zapytanie 2:
Wyświetl więźniów z niewykonanymi karami, posortowanych według daty rozpoczęcia kary.
*/
SELECT 
    w.Osoby_ID AS Wiezien_ID,
    o.Imie,
    o.Nazwisko,
    k.Rodzaj_kary,
    k.Data_rozpoczecia_kary,
    k.Data_zakonczenia
FROM 
    Wiezniowie w
JOIN 
    Osoby o ON w.Osoby_ID = o.Osoby_ID
JOIN 
    Odsiadka od ON w.Osoby_ID = od.Osoby_ID
JOIN 
    Kary k ON od.Odsiadka_ID = k.Kara_ID
WHERE 
    k.Czy_kara_wykonana = 0
ORDER BY 
    k.Data_rozpoczecia_kary;

/* 
Uzasadnienie biznesowe:
Zapytanie bezpośrednio pobiera informacje o więźniach z niewykonanymi karami. Umożliwia to dokładniejszą analizę zaległości w wykonaniu kar, co wspiera skuteczniejsze zarządzanie więzieniem.
*/
