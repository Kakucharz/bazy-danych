SELECT 
    *,
    DATEPART(WEEKDAY, data) AS dzien_tygodnia,
    DATEPART(MONTH, data) AS miesiac
FROM 
    rozliczenia.godziny;
