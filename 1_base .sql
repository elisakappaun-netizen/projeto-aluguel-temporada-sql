--retorno das aulas 
-- 1_base 
drop table 
  create table Enderecos (
 	id_endereco serial primary key,
 	rua varchar(30) not null,
 	numero varchar (10),
 	bairro varchar(10),
 	cidade varchar(20),
 	estado varchar(2)
 );
 
 create table Hospedes(
 	id_hospede serial primary key,
 	nome varchar(50) not null,
 	email varchar(30),
 	telefone varchar(30)
 );
 
 create table Propriedades(
 	id_propriedade serial primary key,
 	nome_imovel varchar (30),
 	capacidade_hospe int,  -- defailt 1 pq precisa ter pelo menos 1 hospede. 
    fk_endereco int not null references Enderecos (id_endereco) 	
 );
 
