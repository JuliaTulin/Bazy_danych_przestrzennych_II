## Co to jest Lookup No Match Output, co i kiedy zostanie tam zapisane?
Lookup No Match Output to dodatkowe wyjście komponentu Lookup w SSIS, które przechwytuje wiersze niepasujące do warunków łączenia (JOIN). Jeżeli dany wiersz z wejścia Lookup nie znajdzie odpowiadającego rekordu w tabeli referencyjnej, wtedy ten wiersz nie trafia do Match Output, tylko jest przekierowany do No Match Output.


## Jaka jest rónica między kwerendą, a procesem ETL? Wskaż wady i zalety.

Kwerenda to jednorazowe lub cykliczne zapytanie do bazy, a proces ETL to przep�yw mi�dzy systemami
obejmujący pobieranie, przekształcanie i ładowanie danych.

Zalety kwerendy:
 - łatwa modyfikacja
 - nie potrzeba innych środowisk, wystarczy SQL Server
 - Szybkość tworzenia

Wady kwerendy:
 - Nie wykona bardziej skomplikowanych przep�yw�w
 - brak rozbudowanego logowania

Zalety ETL:
 - graficzna prezentacja procesu
 - możliwość automatyzacji
 - możliwość podłączenia rónych źródeł danych

Wady ETL:
 - bardziej skomplikowane w utrzymaniu i modyfikacji