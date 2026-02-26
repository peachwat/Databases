/* 
Zapytanie 3:
Policz liczbę przestępstw popełnionych w więzieniu dla każdej celi wraz z procentowym udziałem tych przestępstw w stosunku do wszystkich przestępstw.
*/
SELECT 
    Numer_celi,
    Typ_celi,
    COUNT(Opis_przestepstwa_wieziennego) AS Liczba_przestepstw_wieziennych,
    CAST(COUNT(Opis_przestepstwa_wieziennego) * 100.0 / 
         (SELECT COUNT(Opis_przestepstwa_wieziennego) 
          FROM WidokWiezniow 
          WHERE Opis_przestepstwa_wieziennego IS NOT NULL) AS DECIMAL(5, 2)) AS Procentowy_udzial
FROM 
    WidokWiezniow
WHERE 
    Opis_przestepstwa_wieziennego IS NOT NULL
GROUP BY 
    Numer_celi, Typ_celi
ORDER BY 
    Liczba_przestepstw_wieziennych DESC;

/* 
Uzasadnienie biznesowe:
Rozszerzenie zapytania o procentowy udział przestępstw w danej celi pozwala nie tylko zidentyfikować najbardziej problematyczne cele, ale także lepiej zrozumieć ich wkład w ogólną liczbę przestępstw w więzieniu. To wspiera skuteczne planowanie działań prewencyjnych i zarządzanie celami.
*/
