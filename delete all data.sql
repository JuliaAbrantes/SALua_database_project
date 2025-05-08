USE salua;

-- 1. Primeiro as tabelas que representam relacionamentos ou dependem de múltiplas tabelas
DELETE FROM Reserva;
DELETE FROM Horario_de_aulas;
DELETE FROM Gere;
DELETE FROM Contem_Material;
DELETE FROM Diretor_Departamento;

-- 2. Tabelas com dependências intermediárias
DELETE FROM Secretario_Departamento;
DELETE FROM Contem_Tipicamente;
DELETE FROM Outro;
DELETE FROM Email;
DELETE FROM Telefone;

-- 3. Tabelas que dependem de uma ou mais tabelas base
DELETE FROM Sala;
DELETE FROM Nomes_Alternativos;
DELETE FROM Departamento;
DELETE FROM Predio;
DELETE FROM Horario_Localizacao;

-- 4. Tabelas base (sem dependências)
DELETE FROM Tipo;
DELETE FROM Material;
DELETE FROM Localizacao;
DELETE FROM Gestor;

-- 2. Resetar o contador de auto-increment
DBCC CHECKIDENT ('Gestor', RESEED, 0);