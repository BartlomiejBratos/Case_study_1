--Zapytanie mające za zadanie pokazanie top 5 województw pod względem ilości dostępnych miejsc pracy

Select *
FROM wolne_miejsca_pracy
WHERE rok = 2023 AND
jednostka_miary = 'tysiąc' AND
zakres_przedmiotowy NOT LIKE 'POLSKA'
ORDER BY wartosc DESC
LIMIT 5