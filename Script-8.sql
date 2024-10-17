-- il between mette tutti i valori compresi tra a e b, se non ci fosse sarebbe x>=A && x<=B
-- l'operando in è un operatore di insieme e si fa A IN (x1,x2) estrae tutte le tuple che hanno valori x1 e x2, senza quello si farebbe A0x1 || A=x2
-- count = funzione di aggregazione, e groupby me le permette di usare

select * from amministrazione.personale p where nome between "arisa" and "asia";
-- vedere quanti hanno la fascia stipendio uguale con nome che inizia per "a" ed ordinato in modo discendente
select p.fascia_stipendio, count(*) from amministrazione.personale p
where p.nome like "a%"
group by p.fascia_stipendio
having p.fascia_stipendio in (1,3,5)
order by p.fascia_stipendio desc;
-- limit 1; serve a vedere solo la prima tupla
-- non posso usare il where perchè quando ho a che fare con il group by, ma devo usare having
-- calcolo i minuti medi per ogni timbratura di ogni codice fiscale, con sum invece calcolo i minuti totali
select t.codice_fiscale, avg(hour(timediff(t.uscita, t.ingresso)) * 60 + minute(timediff(t.uscita, t.ingresso))) as minuti_lavorati 
from amministrazione.test t
group by t.codice_fiscale;
-- count(*)
-- group by t.codice_fiscale ;