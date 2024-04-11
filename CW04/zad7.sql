--ALTER TABLE rozliczenia.pensje
--ADD kwota_netto DECIMAL(10,2);

--UPDATE rozliczenia.pensje
--SET kwota_netto = kwota * 0.77; 

--EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';
SELECT *
FROM rozliczenia.pensje