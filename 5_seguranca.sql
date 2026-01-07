--Parte 04 : Precisamos criar um acesso para o funcionário do suporte técnico.  

--1. Crie o arquivo 5_seguranca.sql. FEITO

--2. Crie o usuário suporte_estagiario.

create user suporte_estagiario with password 'senha123';

--3. Dê a ele permissão de SELECT em todas as tabelas.

grant select on Enderecos, Hospedes, Propriedades, Reservas to suporte_estagiario;

--4. Dê permissão de UPDATE apenas na tabela Reservas (para que ele possa ajustar datas, se necessário).

grant update on reservas to suporte_estagiario;

--5. Crie uma conexão nova usando esse novo usuário e teste os comandos que ele pode e que não pode fazer.

select * from reservas;
select * from hospedes;
select * from Propriedades;
select * from enderecos;


delete from hospedes;



--Ajuste a pasta do projeto e faça o Commit e Push
