-- parte 03

--3. Crie o arquivo "4_relatorios.sql". feito 

--4. Crie uma consulta com JOIN que mostre: Nome do Hóspede, Nome do Imóvel e a Data de Início da reserva.

select nome, nome_imovel, data_inicio from Reservas
inner join Hospedes on id_hospede  = fk_hospede
inner join Propriedades on id_propriedade = fk_propriedade;

--5. Crie um filtro (WHERE) para mostrar apenas reservas com valor total acima de R$ 500,00.

select * from Reservas
where valor_total > 500.00;

--6. Crie uma VIEW chamada "vw_faturamento_por_imovel" que mostre o nome da propriedade e a soma de todos os valores de reservas já feitas nela.

create view vw_faturamento_por_imovel as
select nome_imovel, sum(valor_total) as total_faturamento from Reservas
inner join propriedades on id_propriedade = fk_propriedade
group by nome_imovel;
select * from vw_faturamento_por_imovel;


--Atualiza o projeto e faça o Commit e push.