/* 
Zapytanie 4:
Wyświetl więźniów, którzy popełnili więcej niż jedno przestępstwo w więzieniu, oraz oblicz ich procentowy udział w całkowitej liczbie więźniów.
*/
SELECT 
    Wiezien_ID,
    Imie,
    Nazwisko,
    COUNT(Opis_przestepstwa_wieziennego) AS Liczba_przestepstw_wieziennych,
    CAST(COUNT(Opis_przestepstwa_wieziennego) * 100.0 / 
         (SELECT COUNT(DISTINCT Wiezien_ID) 
          FROM WidokWiezniow) AS DECIMAL(5, 2)) AS Procentowy_udzial_wiezniow
FROM 
    WidokWiezniow
WHERE 
    Opis_przestepstwa_wieziennego IS NOT NULL
GROUP BY 
    Wiezien_ID, Imie, Nazwisko
HAVING -- having=where po group by
    COUNT(Opis_przestepstwa_wieziennego) > 1;

/* 
Uzasadnienie biznesowe:
Zapytanie identyfikuje więźniów o wysokim ryzyku recydywy wewnętrznej. Dodatkowo, obliczenie procentowego udziału takich więźniów w całkowitej populacji więzienia pozwala administracji zrozumieć skalę problemu i dostosować zasoby do działań resocjalizacyjnych i prewencyjnych.
*/
