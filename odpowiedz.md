## Jakie są inne opcje JOIN w Merge Join? Jaka jest różnica pomiędzy nimi?

INNER JOIN - Zwraca tylko pasujące wiersze z obu strumieni
LEFT OUTER JOIN - Zwraca wszystkie z lewej + pasujące z prawej
FULL OUTER JOIN - Zwraca wszystkie z obu stron, nawet bez dopasowania

Różnice między nimi:
- INNER → tylko przecięcie
- LEFT → cała lewa + dopasowania
- FULL → unia lewa + prawa