/* 
Zapytanie: Wypisz nazwę rodzaju przestępstwa i procentowy udział niezakończonych odsiadek przypisanych do danego rodzaju przestępstwa.
*/
SELECT 
    Rodzaj_przestepstwa,
    COUNT(CASE WHEN Niezakonczona_odsiadka = 1 THEN 1 ELSE NULL END) AS Liczba_niezakonczonych_odsiadek,
    CAST(COUNT(CASE WHEN Niezakonczona_odsiadka = 1 THEN 1 ELSE NULL END) * 100.0 / 
         SUM(COUNT(CASE WHEN Niezakonczona_odsiadka = 1 THEN 1 ELSE NULL END)) OVER () AS DECIMAL(5, 2)) AS Udzial_procentowy
FROM 
    WidokWiezniow
WHERE 
    Niezakonczona_odsiadka = 1
GROUP BY 
    Rodzaj_przestepstwa
ORDER BY
	Udzial_procentowy DESC;

/* 
Uzasadnienie biznesowe:
Analiza udziału przestępstw w niezakończonych odsiadkach pozwala na identyfikację przestępstw, które dominują w populacji więźniów i lepsze planowanie działań resocjalizacyjnych oraz przestrzeni w więzieniach.
*/
