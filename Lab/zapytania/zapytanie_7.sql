/* 
Zapytanie:
Policz liczbę przestępstw popełnionych w więzieniu w podziale na lata.
*/
SELECT 
    YEAR(Data_przestepstwa_wieziennego) AS Rok, 
    COUNT(*) AS Liczba_przestepstw_wieziennych
FROM 
    WidokWiezniow
WHERE 
    Data_przestepstwa_wieziennego IS NOT NULL
GROUP BY 
    YEAR(Data_przestepstwa_wieziennego)
ORDER BY 
    Rok;

/* 
Uzasadnienie biznesowe:
Pozwala analizować zmiany w liczbie przestępstw w więzieniu na przestrzeni lat.
*/
