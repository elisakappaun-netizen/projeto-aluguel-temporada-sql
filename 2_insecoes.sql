INSERT INTO Hospedes (nome, email, telefone) VALUES
   ('Ana Souza', 'ana@email.com', '2499999-1111'),
   ('Bruno Lima', 'bruno@email.com', '2499999-2222'),
   ('Carla Dias', 'carla@email.com', '2499999-3333');
  
-- Vamos inserir 4 endereços para usar nas 4 casas
  
INSERT INTO Enderecos (rua, numero, bairro, cidade, estado) VALUES
   ('Rua das Ondas', '10', 'Praia', 'Cabo Frio', 'RJ'),      -- Endereço 1
   ('Av. Principal', '500', 'Centro', 'Petrópolis', 'RJ'),   -- Endereço 2
   ('Est. da Montanha', 'S/N', 'Serra', 'Petrópolis', 'RJ'), -- Endereço 3
   ('Rua Moderna', '101', 'Bingen', 'Petrópolis', 'RJ');     -- Endereço 4
   
-- 4. Insira 4 propriedades
     
INSERT INTO Propriedades (nome_imovel, capacidade_hospe, preco_noite, fk_endereco) VALUES
   ('Casa de Praia', 6, 500.00, 1),
   ('Apartamento Central', 4, 350.00, 2),
   ('Choupana na Serra', 2, 250.00, 3),
   ('Studio Moderno', 2, 150.00, 4);
;
-- parte 03

--2. Inserir dados para a tabela Reservas.

insert into Reservas (data_inicio, data_fim, valor_total, fk_hospede, fk_propriedade ) values
('2026-02-10', '2026-02-15', 1200.00, 2, 3),
('2026-03-01', '2026-03-07', 2100.00, 3, 1);


