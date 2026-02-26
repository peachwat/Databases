/* 
Zapytanie:
Policz liczbę przestępstw w podziale na rodzaj przestępstwa.
*/
SELECT 
    Rodzaj_przestepstwa,
    COUNT(*) AS Liczba_przestepstw -- COUNT(*) zlicza wszystkie przestępstwa w danej kategorii
FROM 
    WidokWiezniow
WHERE 
    Rodzaj_przestepstwa IS NOT NULL
GROUP BY 
    Rodzaj_przestepstwa
ORDER BY 
    Liczba_przestepstw DESC;

/* 
Uzasadnienie biznesowe:
Pomaga w identyfikacji dominujących typów przestępstw, co wspiera działania prewencyjne i zarządzanie więzieniem.
*/
