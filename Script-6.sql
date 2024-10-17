-- proiezione dell'intera tabella
select * 
from amministrazione.test t ; 
-- proiezione degli attributi elencati dell'intera tabella
select t.codice_fiscale ,t.cognome, t.nome 
from amministrazione.test t ;
-- proiezione degli attributi elencati dell'intera tabella 
-- SENZA ripetizione delle tuple uguali (UNIQUE)
select distinct t.codice_fiscale ,t.cognome, t.nome
from amministrazione.test t ;
-- conta le righe della tabella (funzione di aggregazione count)
select count(*) 
from amministrazione.test t ; 
-- proiezione con selezione
select distinct t.codice_fiscale ,t.cognome, t.nome
from amministrazione.test t where t.nome="Aurelia";
-- proiezione con selezione
select distinct t.codice_fiscale ,t.cognome, t.nome
from amministrazione.test t where t.nome like "%a";
-- proiezione con selezione
select  t.codice_fiscale ,t.cognome, t.nome, t.ingresso, t.uscita
from amministrazione.test t where t.nome like "%a";
-- proiezione con selezione
select  t.codice_fiscale ,t.cognome, t.nome, t.ingresso, t.uscita
from amministrazione.test t;
-- proiezione con selezione ordinata in ordine decrescente
select  t.codice_fiscale ,t.cognome, t.nome, t.ingresso, t.uscita
from amministrazione.test t 
order by t.ingresso desc ; 
-- proiezione con selezione ordinata in ordine crescente
select  t.codice_fiscale ,t.cognome, t.nome, t.ingresso, t.uscita
from amministrazione.test t 
order by t.ingresso asc ; 
-- proiezione con data assunzione
select distinct t.codice_fiscale ,t.cognome, t.nome, t.data_assunzione 
from amministrazione.test t ; 
-- FUNZIONI 
-- now (orario e giorno attuale)
select distinct t.codice_fiscale ,t.cognome, t.nome, 
now(), t.data_assunzione 
from amministrazione.test t ;
-- calcola i giorni trascorsi dall'assunzione a oggi 
-- (datediff(now(), t.data_assunzione)
-- as giorni è ALIAS 
select distinct t.codice_fiscale ,t.cognome, t.nome, 
datediff (now(), t.data_assunzione ) as giorni  
from amministrazione.test t ; 
-- calcola gli anni da quando è stato assunto a oggi
select distinct t.codice_fiscale ,t.cognome, t.nome, 
datediff (now(), t.data_assunzione ) as giorni,  
datediff (now(), t.data_assunzione ) /365 as anni
from amministrazione.test t ;
-- divisione con risultato un numero intero (div)
select distinct t.codice_fiscale ,t.cognome, t.nome, 
datediff (now(), t.data_assunzione ) as giorni,  
datediff (now(), t.data_assunzione ) div 365 as anni
from amministrazione.test t ;
-- resto divisione: giorni che rimangono dall'anno (tra 0 e 364)
select distinct t.codice_fiscale ,t.cognome, t.nome, 
datediff (now(), t.data_assunzione ) as giorni,  
datediff (now(), t.data_assunzione ) div 365 as anni, 
datediff (now(), t.data_assunzione ) mod 365 as x
from amministrazione.test t ;
-- calcolo mesi e giorni dalla data di assunzione 
select distinct t.codice_fiscale ,t.cognome, t.nome, 
datediff (now(), t.data_assunzione ) as giorni,  
datediff (now(), t.data_assunzione ) div 365 as anni, 
datediff (now(), t.data_assunzione ) mod 365 div 30 as mesi, 
datediff (now(), t.data_assunzione ) mod 365 mod 30 as giorni
from amministrazione.test t ;
-- calcola giorno attuale (giorno, mese, anno)
-- data assunzione (giorno, mese, anno)
select distinct t.codice_fiscale ,t.cognome, t.nome, 
datediff (now(), t.data_assunzione ) as giorni,  
datediff (now(), t.data_assunzione ) div 365 as anni, 
datediff (now(), t.data_assunzione ) mod 365 div 30 as mesi, 
datediff (now(), t.data_assunzione ) mod 365 mod 30 as giorni,
date_format(now(), "%d %M %Y") as oggi, 
date_format(t.data_assunzione, "%d %M %Y") as dataAssunzione
from amministrazione.test t ;

-- inserimento multiplo di righe da una tabella ad un'altra 
-- insert into table_name select 

create table amministrazione.personale(
codice_fiscale nvarchar(16), 
nome nvarchar(50),
cognome nvarchar(50),
fascia_stipendio int,
data_assunzione datetime
);
-- importo tutto il personale dalla tabella test alla tabella 
-- personale con proiezione unique 
insert into amministrazione.personale 
select distinct t.codice_fiscale, t.nome, t.cognome, 
				t. fascia_stipendio, t.data_assunzione 
from amministrazione.test t;
select distinct t.codice_fiscale, t.cognome, t.nome, 
timediff(t.uscita, t.ingresso) AS differenza_orario,
HOUR(TIMEDIFF(t.uscita, t.ingresso)) AS ore_lavorate,
MINUTE(TIMEDIFF(t.uscita, t.ingresso)) AS minuti_lavorati,
SECOND(TIMEDIFF(t.uscita, t.ingresso)) AS secondi_lavorati
from amministrazione.test t;

-- select distinct t.codice_fiscale, t.cognome, t.nome, 
-- date_format(timediff(t.uscita , t.ingresso), "%H") as ore,
-- date_format(timediff(t.uscita , t.ingresso), "%i") as minuti,
-- date_format(timediff(t.uscita , t.ingresso), "%s") as secondi
-- from amministrazione.test t ;

