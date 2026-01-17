## 6. Jaki typ SCD został zaimplementowany w każdej z kwerend w zadaniu numer 5b i c? 
5b – zmiana LastName 270
SCD Type 1 – Changing attribute (nadpisanie wartości, brak historii)

5b – zmiana Title (274)
SCD Type 2 – Historical attribute
(tworzy nowy rekord z nową wartością, stary rekord zamknięty przez EndDate)

5c – zmiana FirstName (275)
SCD Type 0 – Fixed attribute
(atrybut stały – zmiana jest niedozwolona, dlatego proces zgłasza błąd).



## 7. Jakie ustawienie i dlaczego miało wpływ na działanie procesu w przypadku kwerendy 5c? 
W 5c proces nie wykonuje update ani insert, tylko kończy się błędem, ponieważ FirstName zostało zdefiniowane jako Fixed attribute. Każda zmiana wartości w stg_dimemp powoduje:

- wykrycie zmiany na atrybucie stałym,
- przerwanie działania transformacji SCD,
- błąd i zatrzymanie pakietu.

