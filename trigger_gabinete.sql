USE salua;
GO

CREATE OR ALTER TRIGGER TR_PreventClassesInGabinetes --Prevenir definir aulas em gabinetes
ON Horario_de_aulas
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM INSERTED i -- 'INSERTED' contém os dados das linhas que estão sendo inseridas ou os novos dados das linhas atualizadas
        INNER JOIN Diretor_Departamento dd ON
            i.num_sala = dd.num_gab AND
            i.andar_sala = dd.andar_gab AND
            i.localizacao_sala = dd.localizacao_gab
    )
    BEGIN
        RAISERROR ('Erro: Não é permitido ter aulas em gabinetes (salas associadas a diretores de departamento). A operação foi revertida.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
------------------//------------------
USE salua;
GO

CREATE OR ALTER TRIGGER TR_PreventReservationsInGabinetes --Prevenir reserva nos gabinetes
ON Reserva
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        INNER JOIN Diretor_Departamento dd ON
            i.num_sala = dd.num_gab AND
            i.andar_sala = dd.andar_gab AND
            i.localizacao_sala = dd.localizacao_gab
    )
    BEGIN
        RAISERROR ('Erro: Não é permitido fazer reservas de gabinetes (salas associadas a diretores de departamento). A operação foi revertida.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
------------------//------------------
USE salua;
GO

CREATE OR ALTER TRIGGER TR_PreventGereEntriesForGabinetes --Previne que se defina que alguém gere um gabinete
ON Gere
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        INNER JOIN Diretor_Departamento dd ON
            i.num_sala = dd.num_gab AND
            i.andar_sala = dd.andar_gab AND
            i.localizacao_sala = dd.localizacao_gab
    )
    BEGIN
        RAISERROR ('Erro: Gabinetes (salas associadas a diretores de departamento) não podem ter entradas de gestão genéricas (tabela Gere). A operação foi revertida.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
