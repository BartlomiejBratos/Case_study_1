WITH porownanie AS (
    SELECT
    nazwa,
    rok,
    (wartosc - LAG(wartosc, 1) 
        OVER (PARTITION BY nazwa
            ORDER BY rok)) AS zmiana
FROM wynagrodzenie_brutto
WHERE
nazwa NOT LIKE 'Powiat%' AND 
nazwa NOT LIKE 'POLSKA')
SELECT
    nazwa,
    SUM(zmiana) AS suma_zmiany_brutto
FROM porownanie
GROUP BY nazwa
ORDER BY suma_zmiany_brutto DESC