-- trigger

create function atualizar_valor_total()
returns trigger as $$
declare
	diaria decimal;
begin
		select preco_noite into diaria
		from Propriedades
		where id_propriedades = new.fk_propriedade;
		new.valor_total = (new.data_fim - new.data_inicio) * diaria;
		return new;
end;
$$ language plpgsql;


create trigger trg_recalcula_valor
before update on Reservas
for each row
execute function atualizar_valor_total();
select * from reservas where id_reserva = 2;
update reservas r  set data_fim = '2026/03/20'
where id_reserva = 2;


--Parte 5: Para evitar fraudes, queremos saber sempre que o preço de uma diária for alterado e automatizar algumas outras coisas.
--1. Crie o arquivo 6_automatizacao.sql. Feito
--2. Crie uma tabela Log_Precos (ID, Propriedade_ID, Preco_Antigo, Preco_Novo, Data_Alteracao).

create table Log_Precos(
	id_Log_Preco serial primary key,
	propriedades_fk int references Propriedades (id_propriedade),
	preco_antigo numeric(10,2),
	preco_novo numeric(10,2),
	data_alteracao timestamp
);
--3. Crie uma Trigger que será disparada pela ação de atualizar um registro da tabela propriedades.

create or replace trigger trg_atualizar_resgistro_propriedades
before update on Propriedades
for each row
execute function atualizar_log_registro();

--4. Crie uma Function que será chamada pela trigger acima e precisará inserir os dados nessa tabela nova que foi criada (log_preços).

create or replace function atualizar_log_registro()
returns trigger as $$
begin
if(old.preco_noite <> new.preco_noite) then
	insert into Log_Precos(propriedades_fk, preco_antigo, preco_novo, data_alteracao)
	values	(old.id_propriedade, old.preco_noite, new.preco_noite, current_timestamp);
end if;
return new;
end;
$$ language plpgsql;
update propriedades
set preco_noite = 280
where id_propriedade = 3;

--5. Automatize o processo de inserção de nome (ou de hospede, ou de propriedade ou de endereço) para que o nome sempre seja salvo com as letras minúsculas, mesmo que a informação tenha sido passada com letras maiúsculas.

create or replace trigger trg_minusculas
before insert on Enderecos
for each row
execute function minusculas();
create or replace function minusculas()
returns trigger as $$
begin
	new.cidade = lower(new.cidade);
	new.bairro = lower(new.bairro);
	new.estado = lower(new.estado);
return new;
end;
$$ language plpgsql;
insert into Enderecos (rua, numero, bairro, cidade, estado)
values ('RUA x', 111, 'BAIRRO TAL', 'SÃO PAULO', 'SP');

--6. Automatize o processo de calcular o valor_total da reserva quando algum registro de reserva é alterada e tenha sua data modificada.

create or replace trigger trg_recalcula_valor
before update on Reservas
for each row
execute function atualizar_valor_total();



create or replace function atualizar_valor_total()
returns trigger as $$
declare
	diaria decimal;
begin
		select preco_noite into diaria                                                       -- new.valor_total = (new.data_fim - new.data_inicio) 
		from Propriedades                                                                     --*
		where id_propriedade = new.fk_propriedade;
		new.valor_total = (new.data_fim - new.data_inicio) * diaria;                          -- (select preco_noite from Propriedades where new.Propriedade = id_propriedade 

return new;
end;
$$ language plpgsql;


select * from reservas where id_reserva = 2;

update reservas set data_fim = '2026/03/20'
where id_reserva = 2;


