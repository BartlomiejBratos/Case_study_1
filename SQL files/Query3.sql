WITH porownanie AS (

--CTE, które oblicza zmianę wynagrodzenia brutto na przestrzeni ostatnich 5 lat

    SELECT
    nazwa,
    rok,
    (wartosc - LAG(wartosc, 1) 
        OVER (PARTITION BY nazwa
            ORDER BY rok)) AS zmiana
FROM wynagrodzenie_brutto
WHERE
rok BETWEEN 2019 and 2024 AND
nazwa NOT LIKE 'Powiat%' AND 
nazwa NOT LIKE 'POLSKA')
SELECT
    nazwa,
    SUM(zmiana) AS suma_zmiany_brutto
FROM porownanie
GROUP BY nazwa
ORDER BY suma_zmiany_brutto DESC