create table amministrazione.RipassoVerifica(
calorie_assunte int not null,
calorie_bruciate int not null,
data_registrata date default "2024-1-1",
ore_movimento int
);
insert into amministrazione.ripassoverifica (calorie_assunte, calorie_bruciate, data_registrata, ore_movimento) values (1500, 850, "2024-10-25", 60);
select * from amministrazione.ripassoverifica r;

alter table amministrazione.ripassoverifica drop column ore_movimento;
alter table amministrazione.ripassoverifica add tempo_movimento time;
alter table amministrazione.ripassoverifica add ID int primary key auto_increment;
update amministrazione.ripassoverifica r set r.tempo_movimento = "00:50" where id= 1;
alter table amministrazione.ripassoverifica add constraint unique_Data_registrata unique(data_registrata);
insert into amministrazione.ripassoverifica (calorie_assunte, calorie_bruciate, data_registrata, tempo_movimento) values (1500, 850, "2024-10-26", "00:35");
insert into amministrazione.ripassoverifica (calorie_assunte, calorie_bruciate, data_registrata, tempo_movimento) values (1600, 1850, "2024-10-27", "00:45");
insert into amministrazione.ripassoverifica (calorie_assunte, calorie_bruciate, data_registrata, tempo_movimento) values (1500, 850, "2024-10-29", "00:35");
DELETE FROM amministrazione.ripassoverifica 
WHERE data_registrata = '2024-10-27';
drop table amministrazione.ripassoverifica;

select tempo_movimento, avg(calorie_bruciate) from amministrazione.ripassoverifica group by tempo_movimento order by tempo_movimento desc;