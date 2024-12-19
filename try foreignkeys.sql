select * from piante_verifica2024.report r ;
DESCRIBE piante_verifica2024.report;
/* ================= PIANTE ======================*/
create table piante_verifica2024.piante(
nome_pianta varchar(100),
id_pianta int,
pianta_esotica boolean, 
prezzo_pianta float,
id_luogo int
);
alter table piante_verifica2024.piante
add constraint fk_id_luogo
foreign key (id_luogo) references piante_verifica2024.luogo(id);
drop table piante_verifica2024.piante;
INSERT INTO piante_verifica2024.piante (nome_pianta, id_pianta, pianta_esotica, prezzo_pianta, id_luogo)
SELECT distinct r.nome_pianta, r.id_pianta, r.pianta_esotica, r.prezzo_pianta, r.id_luogo 
FROM piante_verifica2024.report r;

select * from piante_verifica2024.piante p;
/* ================= CLIENTE ======================*/
create table piante_verifica2024.cliente(
nome varchar(100),
id int
);

INSERT INTO piante_verifica2024.cliente (nome, id)
SELECT distinct r.nome_cliente , r.id_cliente
FROM piante_verifica2024.report r;

select * from piante_verifica2024.cliente;

/* ================= Fattura ======================*/
create table piante_verifica2024.fattura(
data_registrata date,
id int primary key auto_increment
);

INSERT INTO piante_verifica2024.fattura (data_registrata)
SELECT distinct r.data_fattura 
FROM piante_verifica2024.report r;

select * from piante_verifica2024.fattura;

/* ================= LUOGO ======================*/
create table piante_verifica2024.luogo(
id int primary key,
nome_luogo varchar(30)
);

INSERT INTO piante_verifica2024.luogo (id, nome_luogo)
SELECT distinct r.id_luogo, r.luogo 
FROM piante_verifica2024.report r;
select * from piante_verifica2024.luogo;

-- ============================== Prova group By =================

select id_luogo, count(nome_pianta) as piante_per_luogo from piante_verifica2024.piante p group by p.id_luogo;


