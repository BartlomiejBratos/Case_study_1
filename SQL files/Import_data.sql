COPY bezrobocie_rejestrowane
FROM 'E:\Case_study_1\CSV  files\Bezrobocie_rejestrowane.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');

COPY wolne_miejsca_pracy
FROM 'E:\Case_study_1\CSV  files\Wolne_miejsca_pracy.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');

COPY wynagrodzenie_brutto
FROM 'E:\Case_study_1\CSV  files\wynagrodzenia_brutto.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');