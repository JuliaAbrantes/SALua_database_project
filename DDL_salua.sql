--CREATE DATABASE salua;

USE salua;

CREATE TABLE Gestor (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    horario_trabalho VARCHAR(100)
);

CREATE TABLE Localizacao (
    nome VARCHAR(50) PRIMARY KEY,
    campus VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE Horario_Localizacao (
    localizacao VARCHAR(50),
    dia_semana VARCHAR(20),
    hora_abertura TIME,
    hora_fecho TIME,
    PRIMARY KEY (localizacao, dia_semana),
    FOREIGN KEY (localizacao) REFERENCES Localizacao(nome),
    CHECK (dia_semana IN ('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo'))
);

CREATE TABLE Material (
    codigo VARCHAR(20) PRIMARY KEY,
    descricao TEXT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Tipo (
    designacao VARCHAR(50) PRIMARY KEY,
    lot_min INT,
    lot_max INT,
    descricao TEXT,
    CHECK (lot_min <= lot_max)
);

CREATE TABLE Outro (
    id_gestor INT PRIMARY KEY,
    funcao VARCHAR(100),
    FOREIGN KEY (id_gestor) REFERENCES Gestor(id)
);

CREATE TABLE Email (
    email VARCHAR(100),
    id_gestor INT,
    FOREIGN KEY (id_gestor) REFERENCES Gestor(id),
    PRIMARY KEY (email, id_gestor)
);

CREATE TABLE Telefone (
    telefone VARCHAR(20),
    id_gestor INT,
    FOREIGN KEY (id_gestor) REFERENCES Gestor(id),
    PRIMARY KEY (telefone, id_gestor)
);

CREATE TABLE Nomes_Alternativos (
    nome_alternativo VARCHAR(100),
    localizacao VARCHAR(50),
    FOREIGN KEY (localizacao) REFERENCES Localizacao(nome),
    PRIMARY KEY (nome_alternativo, localizacao)
);

CREATE TABLE Predio (
    codigo VARCHAR(20) PRIMARY KEY,
    localizacao VARCHAR(50),
    FOREIGN KEY (localizacao) REFERENCES Localizacao(nome)
);

CREATE TABLE Departamento (
    numero INT PRIMARY KEY,
    nome VARCHAR(100),
    abreviatura VARCHAR(20),
    localizacao VARCHAR(50),
    FOREIGN KEY (localizacao) REFERENCES Localizacao(nome),
    check (numero > 0)
);

CREATE TABLE Secretario_Departamento (
    id_gestor INT PRIMARY KEY,
    num_dep INT,
    FOREIGN KEY (id_gestor) REFERENCES Gestor(id),
    FOREIGN KEY (num_dep) REFERENCES Departamento(numero)
);

CREATE TABLE Sala (
    numero INT,
    andar INT,
    localizacao VARCHAR(50),
    designacao_tipo VARCHAR(50),
    nome VARCHAR(100),
    lotacao INT NOT NULL,
    PRIMARY KEY (numero, andar, localizacao),
    FOREIGN KEY (localizacao) REFERENCES Localizacao(nome),
    FOREIGN KEY (designacao_tipo) REFERENCES Tipo(designacao),
    check (numero > 0)
);

CREATE TABLE Diretor_Departamento (
    id_gestor INT PRIMARY KEY,
    num_dep INT,
    num_gab INT,
    andar_gab INT,
    localizacao_gab VARCHAR(50),
    FOREIGN KEY (id_gestor) REFERENCES Gestor(id),
    FOREIGN KEY (num_dep) REFERENCES Departamento(numero),
    FOREIGN KEY (num_gab, andar_gab, localizacao_gab) REFERENCES Sala(numero, andar, localizacao)
);

CREATE TABLE Contem_Tipicamente (
    designacao_tipo VARCHAR(50),
    cod_material VARCHAR(20),
    PRIMARY KEY (designacao_tipo, cod_material),
    FOREIGN KEY (designacao_tipo) REFERENCES Tipo(designacao),
    FOREIGN KEY (cod_material) REFERENCES Material(codigo)
);

CREATE TABLE Contem_Material (
    num_sala INT,
    andar_sala INT,
    localizacao_sala VARCHAR(50),
    cod_material VARCHAR(20),
    quantidade INT,
    PRIMARY KEY (num_sala, andar_sala, localizacao_sala, cod_material),
    FOREIGN KEY (num_sala, andar_sala, localizacao_sala) REFERENCES Sala(numero, andar, localizacao),
    FOREIGN KEY (cod_material) REFERENCES Material(codigo),
    check (quantidade > 0)
);

CREATE TABLE Horario_de_aulas (
    nome_aula VARCHAR(100) NOT NULL,
    num_sala INT,
    andar_sala INT,
    localizacao_sala VARCHAR(50),
    inicio TIME,
    fim TIME,
    dia_semana VARCHAR(20),
    PRIMARY KEY (num_sala, andar_sala, localizacao_sala, inicio, fim, dia_semana),
    FOREIGN KEY (num_sala, andar_sala, localizacao_sala) REFERENCES Sala(numero, andar, localizacao)
);

CREATE TABLE Reserva (
    id_gestor INT,
    num_sala INT,
    andar_sala INT,
    localizacao_sala VARCHAR(50),
    inicio DATETIME,
    fim DATETIME,
    motivo VARCHAR(200),
    PRIMARY KEY (id_gestor, num_sala, andar_sala, localizacao_sala, inicio),
    FOREIGN KEY (id_gestor) REFERENCES Gestor(id),
    FOREIGN KEY (num_sala, andar_sala, localizacao_sala) REFERENCES Sala(numero, andar, localizacao)
);

CREATE TABLE Gere (
    id_gestor INT,
    num_sala INT,
    andar_sala INT,
    localizacao_sala VARCHAR(50),
    PRIMARY KEY (id_gestor, num_sala, andar_sala, localizacao_sala),
    FOREIGN KEY (id_gestor) REFERENCES Gestor(id),
    FOREIGN KEY (num_sala, andar_sala, localizacao_sala) REFERENCES Sala(numero, andar, localizacao)
);
