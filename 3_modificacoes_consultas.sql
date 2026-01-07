UPDATE Propriedades
SET preco_noite = preco_noite * 1.10
WHERE nome_imovel = 'Studio Moderno';

-- 7. Um dos hóspedes cancelou a conta (Remover pelo ID)

DELETE FROM Hospedes
WHERE id_hospede = 1;

SELECT * FROM Propriedades;
SELECT * FROM Hospedes;
