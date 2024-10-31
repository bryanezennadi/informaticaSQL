select * from fantacalcio.listone l;

-- aumentare la quotazione del 25% all'intero successivo

update fantacalcio.listone 
set quotazione = quotazione + quotazione * 1/4;


-- aggiorna tutti i valori con quotazione 1 a valore null
update fantacalcio.listone set quotazione = null where quotazione = 1;

-- eliminare tutte le tuple che hanno quotazione null
delete from fantacalcio.listone where quotazione is null;

-- tutti i calciatori con quotazione 11<x<15
select * from fantacalcio.listone where quotazione between  11 and 15;


-- visualizza quali sono le squadre senza ripetizioni
select distinct squadra from fantacalcio.listone;

 
-- creare la tabella squadre con due campi: id int primary key autoincrement, descrizione varchar(30) not nul

create table fantacalcio.squadre(
descrizione varchar (30) not null,
id int primary key auto_increment
)

insert into fantacalcio.squadre(descrizione)
select distinct squadra from fantacalcio.listone:

select * from fantacalcio.squadre;

alter table fantacalcio.listone add column id_squadre int not null;


-- eliminare l'attributo id squadre dalla tabella listone
alter table fantacalcio.listone drop
column id_squadre;
select * from fantacalcio.listone;


-- creare una tabella con gli attributi: id int primary key auto_increment ruolo char(1) nome varchar(40), id_squadra int foreign (id_squadra) key reference  squadre(id) e quotazione int

create table fantacalcio.calciatori(
id int primary key auto_increment,
ruolo char (1),
nome varchar (40),
quotazione int,
id_squadra int, foreign key (id_squadra) references fantacalcio.squadre(id)
);

-- visualizzare la media delle quotazioni dei calciatori per ruolo

select l.ruolo, avg(l.quotazione) as media_quotazione from fantacalcio.listone l group by l.ruolo;

-- visualizzare solo le quotazioni medie inferiori a 10
select l.ruolo, avg(l.quotazione) as media_quotazione from fantacalcio.listone l group by l.ruolo having media_quotazione between 10 and 20;