/* 
Zapytanie:
Wyświetl więźniów, których kary zakończyły się przed planowaną datą zakończenia kary.
*/
SELECT 
    Wiezien_ID,
    Imie,
    Nazwisko,
    Rodzaj_kary,
    Data_rozpoczecia_kary,
    Data_kary_zakonczenia,
    Planowana_data_zakonczenia_kary
FROM 
    WidokWiezniow
WHERE 
    Data_kary_zakonczenia < Planowana_data_zakonczenia_kary;

/* 
Uzasadnienie biznesowe:
Zapytanie pozwala monitorować sytuacje, w których kary więźniów zakończyły się przed planowanym czasem, co może być pomocne w analizie skuteczności zarządzania więźniami oraz potencjalnych problemów związanych z wykonywaniem kar.
*/
