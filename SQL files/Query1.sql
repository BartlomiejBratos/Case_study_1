WITH bezrobocie_roznica AS 

 --CTE, które oblicza różnicę stopy bezrobocia między 2023 and 2024 rokiem

(
SELECT 
    nazwa,
    rok,
    wartosc,
    wartosc - LAG(wartosc, 1) 
        OVER (PARTITION BY nazwa
            ORDER BY rok) AS zmiana

FROM bezrobocie_rejestrowane

--Klauzula WHERE, która pozwoli mi wyświetlić dane jedynie dla wojedwództw

WHERE rok IN(2023, 2024) AND
nazwa NOT LIKE 'Powiat%' AND 
nazwa NOT LIKE 'POLSKA'
ORDER BY zmiana ASC
)

--Zapytanie, które filtruje tylko te województwa, gdzie stopa bezrobocia nie wzrosła w ostatnim roku

SELECT *
FROM bezrobocie_roznica
WHERE zmiana <= 0