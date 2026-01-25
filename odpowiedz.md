## We właściwościach Package zmień ProtectionLevel na DontSaveSensitive. Jaki ma to wpływ na eksport procesu? 
Ustawienie ProtectionLevel = DontSaveSensitive oznacza, że żadne dane wrażliwe (np. hasła, connection stringi z hasłem) nie będą zapisywane w pliku pakietu .dtsx.

Podczas eksportu do pliku .dtsx:
- hasła do baz danych nie zostaną zapisane w pliku,
- przy ponownym otwarciu lub uruchomieniu pakietu trzeba je wpisać ponownie,
- plik .dtsx będzie bezpieczniejszy do wrzucenia na GitHuba, repozytorium uczelniane itp.