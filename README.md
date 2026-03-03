# Databases

# Prison System Database Project

Projekt relacyjnej bazy danych stworzony w celu zarządzania systemem więziennictwa. System pozwala na ewidencję osób (więźniów, strażników, odwiedzających), zarządzanie celami, monitorowanie wyroków oraz rejestrowanie przestępstw popełnionych zarówno przed, jak i w trakcie pobytu w placówce.

## Model Danych

Baza danych została zaprojektowana w oparciu o zasadę unikania redundancji (tabela bazowa `Osoby`) oraz integralność referencyjną.

### Kluczowe tabele:
* **Osoby**: Centralna tabela przechowująca dane personalne, adresowe oraz numer PESEL.
* **Więźniowie / Strażnicy / Odwiedzający**: Tabele specjalistyczne powiązane relacją jeden-do-jeden z tabelą `Osoby`.
* **Cele**: Informacje o typie i pojemności cel (od 1 do 6 osób).
* **Odsiadka**: Logika przypisywania więźnia do konkretnej celi w określonych ramach czasowych.
* **Odwiedziny**: Rejestr wizyt osób z zewnątrz u konkretnych osadzonych.
* **Przestępstwa i Kary**: System śledzenia historii kryminalnej oraz kar dyscyplinarnych nałożonych wewnątrz więzienia.

## Technologia

* **Silnik bazy danych**: SQL Server (T-SQL).
* **Mechanizmy integralności**:
    * Klucze główne (`PRIMARY KEY`) z automatyczną inkrementacją (`IDENTITY`).
    * Klucze obce (`FOREIGN KEY`) zapewniające powiązania między danymi.
    * Ograniczenia `CHECK` (np. walidacja długości imienia, formatu PESEL czy logiki dat).
    * Unikalność numerów PESEL.

## Struktura plików

* `Lab/create_database.sql`: Skrypt definiujący strukturę bazy danych (DDL).
* `Lab/insert.sql`: Skrypt zawierający przykładowe dane (DML) dla wszystkich tabel, w tym zestawy danych dla 20 więźniów i 20 strażników.
* `Lab/zapytania/`: Folder z zapytaniami analitycznymi SQL.

## Instalacja i uruchomienie

1.  Uruchom środowisko **SQL Server Management Studio (SSMS)** lub **Azure Data Studio**.
2.  Stwórz nową bazę danych:
    ```sql
    CREATE DATABASE PrisonSystem;
    ```
3.  W pierwszej kolejności wykonaj skrypt tworzący tabele:
    * Otwórz i uruchom plik `Lab/create_database.sql`.
4.  Następnie wypełnij bazę danymi testowymi:
    * Otwórz i uruchom plik `Lab/insert.sql`.

## Przykładowe reguły biznesowe
* Numer PESEL musi składać się dokładnie z 11 cyfr.
* Data rozpoczęcia odsiadki lub kary nie może być późniejsza niż data jej zakończenia.
* Pojemność celi jest ograniczona do maksymalnie 6 osób.
