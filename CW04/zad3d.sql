ALTER TABLE rozliczenia.pensje
ADD CONSTRAINT fk_pensje_premie FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);