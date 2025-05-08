USE salua;

-- Inserir dados na tabela Gestor
INSERT INTO Gestor (nome, horario_trabalho)
VALUES 
('Ana Silva', '9h-17h Segunda a Sexta'),
('Carlos Santos', '8h-16h Segunda a Sexta'),
('Maria Oliveira', '10h-18h Segunda a Sexta'),
('João Pereira', '9h-17h Segunda a Quinta'),
('Luísa Martins', NULL),
('Beatriz Silveira', '10h-18h Segunda a Sexta');

-- Inserir dados na tabela Email
INSERT INTO Email (email, id_gestor)
VALUES 
('ana.silva@ua.pt', 1),
('maria.oliveira@ua.pt', 3),
('joao.pereira@ua.pt', 4),
('luisa.martins@ua.pt', 5),
('ana.trabalho@ua.pt', 1),
('beatriz.S@ua.pt', 6);

-- Inserir dados na tabela Telefone
INSERT INTO Telefone (telefone, id_gestor)
VALUES 
('234370500', 1),
('234370501', 2),
('234370503', 4),
('234370504', 5),
('912345678', 1);

-- Inserir dados na tabela Localizacao
INSERT INTO Localizacao (nome, campus, endereco)
VALUES 
('Edifício Central', 'Santiago', 'Rua da Universidade 1, Aveiro'),
('DETI', 'Santiago', 'Alameda'),
('DMAT', 'Santiago', 'Alameda'),
('Biblioteca', 'Santiago', NULL),
('Residências do Crasto', 'Crasto', 'Rua do Crasto 1, Aveiro'),
('Residências de Santiago', 'Santiago', 'Rua do Crasto 1, Aveiro');

-- Inserir dados na tabela Departamento
INSERT INTO Departamento (numero, nome, abreviatura, localizacao)
VALUES 
(4, 'Departamento de Eletrônica, Telecomunicações e Informática', 'DETI', 'DETI'),
(11, 'Departamento de Matemática', 'DMAT', 'DMAT');

-- Inserir dados na tabela Predio
INSERT INTO Predio (codigo, localizacao)
VALUES 
('A', 'Edifício Central'),
('C', 'Residências do Crasto'),
('D', 'Residências de Santiago'),
('B', 'Biblioteca');

-- Inserir dados na tabela Nomes_Alternativos
INSERT INTO Nomes_Alternativos (nome_alternativo, localizacao)
VALUES
('Departamento de Eletrónica', 'DETI'),
('Departamento de Matematica', 'DMAT'),
('Biblioteca Geral', 'Biblioteca'),
('Reitoria', 'Edifício Central'),
('Casas do Crasto', 'Residências do Crasto'),
('Residências Universitárias', 'Residências de Santiago');

-- Inserir dados na tabela Horario_Localizacao
INSERT INTO Horario_Localizacao (localizacao, dia_semana, hora_abertura, hora_fecho)
VALUES
('Biblioteca', 'Segunda', '00:00', '23:59'),
('Biblioteca', 'Terça', '00:00', '23:59'),
('Biblioteca', 'Quarta', '00:00', '23:59'),
('Biblioteca', 'Quinta', '00:00', '23:59'),
('Biblioteca', 'Sexta', '00:00', '23:59'),
('Biblioteca', 'Sábado', '00:00', '23:59'),
('Biblioteca', 'Domingo', '00:00', '23:59'),

('Residências de Santiago', 'Segunda', '00:00', '23:59'),
('Residências de Santiago', 'Terça', '00:00', '23:59'),
('Residências de Santiago', 'Quarta', '00:00', '23:59'),
('Residências de Santiago', 'Quinta', '00:00', '23:59'),
('Residências de Santiago', 'Sexta', '00:00', '23:59'),
('Residências de Santiago', 'Sábado', '00:00', '23:59'),
('Residências de Santiago', 'Domingo', '00:00', '23:59'),

('Residências do Crasto', 'Segunda', '07:00', '22:00'),
('Residências do Crasto', 'Terça', '07:00', '22:00'),
('Residências do Crasto', 'Quarta', '07:00', '22:00'),
('Residências do Crasto', 'Quinta', '07:00', '22:00'),
('Residências do Crasto', 'Sexta', '07:00', '22:00'),
('Residências do Crasto', 'Sábado', '08:00', '20:00'),
('Residências do Crasto', 'Domingo', '08:00', '20:00'),

('DETI', 'Segunda', '08:00', '20:00'),
('DETI', 'Terça', '08:00', '20:00'),
('DETI', 'Quarta', '08:00', '20:00'),
('DETI', 'Quinta', '08:00', '20:00'),
('DETI', 'Sexta', '08:00', '20:00'),

('DMAT', 'Segunda', '08:00', '20:00'),
('DMAT', 'Terça', '08:00', '20:00'),
('DMAT', 'Quarta', '08:00', '20:00'),
('DMAT', 'Quinta', '08:00', '20:00'),
('DMAT', 'Sexta', '08:00', '20:00'),

('Edifício Central', 'Segunda', '09:00', '18:00'),
('Edifício Central', 'Terça', '09:00', '18:00'),
('Edifício Central', 'Quarta', '09:00', '18:00'),
('Edifício Central', 'Quinta', '09:00', '18:00'),
('Edifício Central', 'Sexta', '09:00', '18:00');

-- Inserir dados na tabela Tipo (necessário para Sala)
INSERT INTO Tipo (designacao, lot_min, lot_max, descricao)
VALUES
('Anfiteatro', 40, 150, 'Sala para aulas teóricas de grande dimensão'),
('Gabinete', NULL, 3, 'Sala para professores e direção'),
('Laboratório de eletrônica', NULL, 30, 'Sala para aulas práticas de eletrônica'),
('Sala de Aula', NULL, 40, 'Sala para aulas teóricas ou teórico-práticas'),
('Sala de Estudo', 3, 7, 'Sala para estudo de pequenos grupos'),
('Sala de Estudo Pequena', 1, 2, 'Sala para estudo individual ou em dupla');

-- Inserir dados na tabela Sala (necessário para Diretor_Departamento)
INSERT INTO Sala (numero, andar, localizacao, designacao_tipo, nome, lotacao)
VALUES
(101, 1, 'DETI', 'Gabinete', NULL, 2),
(202, 2, 'DMAT', 'Gabinete', NULL, 2),
(103, 1, 'DETI', 'Laboratório de eletrônica', NULL, 25),
(104, 1, 'DETI', 'Laboratório de eletrônica', NULL, 25),
(4, 1, 'DETI', 'Anfiteatro', 'Anf IV', 120),
(201, 2, 'DMAT', 'Sala de Aula', NULL, 35),
(203, 2, 'DMAT', 'Sala de Aula', NULL, 35),
(101, 1, 'DMAT', 'Sala de Aula', NULL, 35),
(102, 1, 'DMAT', 'Sala de Aula', NULL, 35),
(103, 1, 'DMAT', 'Sala de Aula', NULL, 35),
(104, 1, 'DMAT', 'Sala de Estudo', NULL, 7),
(102, 1, 'DETI', 'Sala de Estudo', NULL, 5),
(21, 2, 'Biblioteca', 'Sala de Estudo', NULL, 5),
(22, 2, 'Biblioteca', 'Sala de Estudo', NULL, 5),
(23, 2, 'Biblioteca', 'Sala de Estudo', NULL, 6),
(31, 3, 'Biblioteca', 'Sala de Estudo Pequena', NULL, 1),
(32, 3, 'Biblioteca', 'Sala de Estudo Pequena', NULL, 2);

-- Inserir dados na tabela Outro (gestores com funções específicas)
INSERT INTO Outro (id_gestor, funcao)
VALUES 
(1, 'Responsável de Manutenção'),
(6, 'Bibliotecário');

-- Inserir dados na tabela Secretario_Departamento
INSERT INTO Secretario_Departamento (id_gestor, num_dep)
VALUES
(3, 4),  -- Maria Oliveira é secretária do DETI
(4, 11); -- João Pereira é secretário do DMAT

-- Inserir dados na tabela Diretor_Departamento
INSERT INTO Diretor_Departamento (id_gestor, num_dep, num_gab, andar_gab, localizacao_gab)
VALUES
(2, 4, 101, 1, 'DETI'),     -- Carlos Santos é diretor do DETI e tem gabinete no DETI
(5, 11, 202, 2, 'DMAT');    -- Luísa Martins é diretora do DMAT e tem gabinete no DMAT



-- Inserir materiais básicos no banco de dados
INSERT INTO Material (codigo, nome, descricao)
VALUES
('QD001', 'Quadro Branco', 'Quadro branco para marcador 120x90cm'),
('QD002', 'Quadro Negro', 'Quadro negro para giz 200x120cm'),
('PRJ001', 'Projetor', 'Projetor multimídia 3000 lumens'),
('OSC001', 'Osciloscópio', 'Osciloscópio digital 100MHz'),
('CAD001', 'Cadeira Estudante', 'Cadeira com braço para estudante'),
('CAD002', 'Cadeira Professor', 'Cadeira ergonômica para professor'),
('MES001', 'Mesa Professor', 'Mesa para professor 120x80cm'),
('MES002', 'Bancada Laboratório', 'Bancada para experiências em laboratório'),
('COMP001', 'Computador', 'Desktop i5 8GB RAM 256GB SSD'),
('COMP002', 'Computador Laboratório', 'Desktop i7 16GB RAM 512GB SSD'),
('TEL001', 'Televisor', 'Smart TV 55 polegadas');

-- Associar materiais aos tipos de sala
INSERT INTO Contem_Tipicamente (designacao_tipo, cod_material)
VALUES
-- Anfiteatro
('Anfiteatro', 'QD001'),
('Anfiteatro', 'PRJ001'),
('Anfiteatro', 'CAD001'),
('Anfiteatro', 'MES001'),
('Anfiteatro', 'COMP001'),

-- Laboratório de eletrônica
('Laboratório de eletrônica', 'QD001'),
('Laboratório de eletrônica', 'OSC001'),
('Laboratório de eletrônica', 'CAD001'),
('Laboratório de eletrônica', 'MES001'),
('Laboratório de eletrônica', 'COMP002'),
('Laboratório de eletrônica', 'MES002'),

-- Sala de Aula
('Sala de Aula', 'QD001'),
('Sala de Aula', 'PRJ001'),
('Sala de Aula', 'CAD001'),
('Sala de Aula', 'MES001'),
('Sala de Aula', 'COMP001'),

-- Sala de Estudo
('Sala de Estudo', 'QD001'),
('Sala de Estudo', 'CAD001'),
('Sala de Estudo', 'MES001');


-- Inserir materiais nas salas (exceto gabinetes e salas de estudo pequenas)
INSERT INTO Contem_Material (num_sala, andar_sala, localizacao_sala, cod_material, quantidade)
VALUES
-- Anfiteatro
(4, 1, 'DETI', 'QD001', 2),
(4, 1, 'DETI', 'PRJ001', 2),
(4, 1, 'DETI', 'CAD001', 120),
(4, 1, 'DETI', 'MES001', 1),
(4, 1, 'DETI', 'COMP001', 1),

-- Laboratórios DETI
(103, 1, 'DETI', 'QD001', 1),
(103, 1, 'DETI', 'OSC001', 12),
(103, 1, 'DETI', 'CAD001', 25),
(103, 1, 'DETI', 'MES001', 1),
(103, 1, 'DETI', 'COMP002', 13),
(103, 1, 'DETI', 'MES002', 6),

(104, 1, 'DETI', 'QD001', 1),
(104, 1, 'DETI', 'OSC001', 12),
(104, 1, 'DETI', 'CAD001', 25),
(104, 1, 'DETI', 'MES001', 1),
(104, 1, 'DETI', 'COMP002', 13),
(104, 1, 'DETI', 'MES002', 6),

-- Salas de Aula DMAT
(201, 2, 'DMAT', 'QD001', 1),
(201, 2, 'DMAT', 'PRJ001', 1),
(201, 2, 'DMAT', 'CAD001', 35),
(201, 2, 'DMAT', 'MES001', 1),
(201, 2, 'DMAT', 'COMP001', 1),

(203, 2, 'DMAT', 'QD001', 1),
(203, 2, 'DMAT', 'PRJ001', 1),
(203, 2, 'DMAT', 'CAD001', 35),
(203, 2, 'DMAT', 'MES001', 1),
(203, 2, 'DMAT', 'COMP001', 1),

(101, 1, 'DMAT', 'QD001', 1),
(101, 1, 'DMAT', 'PRJ001', 1),
(101, 1, 'DMAT', 'CAD001', 35),
(101, 1, 'DMAT', 'MES001', 1),
(101, 1, 'DMAT', 'COMP001', 1),

(102, 1, 'DMAT', 'QD001', 1),
(102, 1, 'DMAT', 'PRJ001', 1),
(102, 1, 'DMAT', 'CAD001', 35),
(102, 1, 'DMAT', 'MES001', 1),
(102, 1, 'DMAT', 'COMP001', 1),

(103, 1, 'DMAT', 'QD001', 1),
(103, 1, 'DMAT', 'PRJ001', 1),
(103, 1, 'DMAT', 'CAD001', 35),
(103, 1, 'DMAT', 'MES001', 1),
(103, 1, 'DMAT', 'COMP001', 1),

-- Salas de Estudo (normais)
(104, 1, 'DMAT', 'QD001', 1),
(104, 1, 'DMAT', 'CAD001', 7),
(104, 1, 'DMAT', 'MES001', 1),

(102, 1, 'DETI', 'QD001', 1),
(102, 1, 'DETI', 'CAD001', 5),
(102, 1, 'DETI', 'MES001', 1),

(21, 2, 'Biblioteca', 'QD001', 1),
(21, 2, 'Biblioteca', 'CAD001', 5),
(21, 2, 'Biblioteca', 'MES001', 1),

(22, 2, 'Biblioteca', 'QD001', 1),
(22, 2, 'Biblioteca', 'CAD001', 5),
(22, 2, 'Biblioteca', 'MES001', 1),

(23, 2, 'Biblioteca', 'QD001', 1),
(23, 2, 'Biblioteca', 'CAD001', 6),
(23, 2, 'Biblioteca', 'MES001', 1);



-- Inserir dados na tabela Gere
-- Gestor 1 (Ana Silva) gerencia todas as salas
INSERT INTO Gere (id_gestor, num_sala, andar_sala, localizacao_sala)
VALUES
-- Salas do DETI
(1, 101, 1, 'DETI'),
(1, 102, 1, 'DETI'),
(1, 103, 1, 'DETI'),
(1, 104, 1, 'DETI'),
(1, 4, 1, 'DETI'),

-- Salas do DMAT
(1, 101, 1, 'DMAT'),
(1, 102, 1, 'DMAT'),
(1, 103, 1, 'DMAT'),
(1, 104, 1, 'DMAT'),
(1, 201, 2, 'DMAT'),
(1, 203, 2, 'DMAT'),

-- Salas da Biblioteca
(1, 21, 2, 'Biblioteca'),
(1, 22, 2, 'Biblioteca'),
(1, 23, 2, 'Biblioteca'),
(1, 31, 3, 'Biblioteca'),
(1, 32, 3, 'Biblioteca'),

-- Gestores do DETI
(2, 101, 1, 'DETI'), -- Carlos Santos
(2, 103, 1, 'DETI'),
(2, 104, 1, 'DETI'),
(2, 4, 1, 'DETI'),
(3, 102, 1, 'DETI'), -- Maria Oliveira
(3, 103, 1, 'DETI'),
(3, 104, 1, 'DETI'),
(3, 4, 1, 'DETI'),

-- Gestores do DMAT
(5, 201, 2, 'DMAT'), -- Luísa Martins
(5, 203, 2, 'DMAT'),
(5, 101, 1, 'DMAT'),
(4, 102, 1, 'DMAT'), -- João Pereira
(4, 103, 1, 'DMAT'),
(4, 104, 1, 'DMAT'),
(4, 201, 2, 'DMAT'),
(4, 203, 2, 'DMAT'),


-- Bibliotecário
(6, 21, 2, 'Biblioteca'),
(6, 22, 2, 'Biblioteca'),
(6, 23, 2, 'Biblioteca'),
(6, 31, 3, 'Biblioteca'),
(6, 32, 3, 'Biblioteca');




-- Inserir horários de aulas
INSERT INTO Horario_de_aulas (nome_aula, num_sala, andar_sala, localizacao_sala, inicio, fim, dia_semana)
VALUES
-- Aulas no DETI
('Bases de Dados', 4, 1, 'DETI', '09:00', '11:00', 'Segunda'),
('Programação I', 4, 1, 'DETI', '11:00', '13:00', 'Segunda'),
('Sistemas Operativos', 4, 1, 'DETI', '14:00', '16:00', 'Segunda'),
('Redes de Computadores', 4, 1, 'DETI', '09:00', '11:00', 'Terça'),
('Inteligência Artificial', 4, 1, 'DETI', '11:00', '13:00', 'Terça'),

('Laboratório de Bases de Dados', 103, 1, 'DETI', '14:00', '16:00', 'Terça'),
('Laboratório de Programação', 103, 1, 'DETI', '16:00', '18:00', 'Terça'),
('Laboratório de Redes', 104, 1, 'DETI', '09:00', '11:00', 'Quarta'),
('Laboratório de Sistemas Embarcados', 104, 1, 'DETI', '11:00', '13:00', 'Quarta'),

-- Aulas no DMAT
('Álgebra Linear', 201, 2, 'DMAT', '09:00', '11:00', 'Segunda'),
('Cálculo I', 201, 2, 'DMAT', '11:00', '13:00', 'Segunda'),
('Probabilidades', 203, 2, 'DMAT', '09:00', '11:00', 'Terça'),
('Métodos Numéricos', 203, 2, 'DMAT', '11:00', '13:00', 'Terça'),

('Complementos de Matemática', 101, 1, 'DMAT', '14:00', '16:00', 'Terça'),
('Matemática Discreta', 101, 1, 'DMAT', '16:00', '18:00', 'Terça'),
('Equações Diferenciais', 102, 1, 'DMAT', '09:00', '11:00', 'Quarta'),
('Geometria Computacional', 103, 1, 'DMAT', '11:00', '13:00', 'Quarta');




-- Inserir reservas (apenas para gestores que gerem as salas)
INSERT INTO Reserva (id_gestor, num_sala, andar_sala, localizacao_sala, inicio, fim, motivo)
VALUES
-- Reservas feitas pelo Gestor 1 (Ana Silva) que gerencia todas as salas
(1, 21, 2, 'Biblioteca', '2025-04-20 14:00', '2025-04-20 16:00', 'Manutenção do aquecedor'),
(1, 103, 1, 'DETI', '2025-04-20 10:00', '2025-04-20 12:00', 'Instalação de software'),
(1, 103, 1, 'DETI', '2025-04-20 15:00', '2025-04-20 17:00', 'Manutenção do ar-condicionado'),

-- Reservas feitas pelo Gestor 2 (Carlos Santos - Diretor DETI)
(2, 4, 1, 'DETI', '2025-04-22 09:00', '2025-04-22 11:00', 'Apresentação de Projetos Finais'),
(2, 101, 1, 'DETI', '2025-04-23 14:00', '2025-04-23 16:00', 'Reunião com Professores'),
(2, 103, 1, 'DETI', '2025-04-24 10:00', '2025-04-24 12:00', 'Defesas de Mestrado'),

-- Reservas feitas pelo Gestor 3 (Maria Oliveira - Secretária DETI)
(3, 102, 1, 'DETI', '2025-04-26 14:00', '2025-04-26 16:00', 'Sessão de Esclarecimento'),
(3, 103, 1, 'DETI', '2025-04-27 11:00', '2025-04-27 13:00', 'Workshop de Programação'),
(3, 4, 1, 'DETI', '2025-04-28 15:00', '2025-04-28 17:00', 'Palestra de Convidado'),

-- Reservas feitas pelo Gestor 4 (João Pereira - Secretário DMAT)
(4, 102, 1, 'DMAT', '2025-04-29 09:00', '2025-04-29 11:00', 'Sessão de Modelagem Matemática'),
(4, 103, 1, 'DMAT', '2025-04-30 14:00', '2025-04-30 16:00', 'Grupo de Estudo'),
(4, 201, 2, 'DMAT', '2025-05-02 10:00', '2025-05-02 12:00', 'Oficina de Estatística'),

-- Reservas feitas pelo Gestor 5 (Luísa Martins - Diretora DMAT)
(5, 202, 2, 'DMAT', '2025-05-03 14:00', '2025-05-03 16:00', 'Reunião Departamental'),
(5, 203, 2, 'DMAT', '2025-05-04 09:00', '2025-05-04 11:00', 'Defesa de Tese'),
(5, 101, 1, 'DMAT', '2025-05-05 15:00', '2025-05-05 17:00', 'Seminário de Matemática Avançada');
