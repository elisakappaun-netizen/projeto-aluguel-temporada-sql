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