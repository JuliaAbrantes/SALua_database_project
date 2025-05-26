USE salua;
GO

CREATE OR ALTER FUNCTION GetManagerInfo_Simplified
(
    @SearchTerm NVARCHAR(255) = NULL,
    @SearchType NVARCHAR(50) = 'ID' -- Expected values: 'ID', 'Nome', 'Localizacao'
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        G.nome AS NomeGestor,
        G.horario_trabalho AS HorarioTrabalho,
        -- Aggregate emails for the current manager
        STUFF((SELECT ', ' + E.email
               FROM Email E
               WHERE E.id_gestor = G.id -- Correctly referencing G.id
               FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS Emails,
        -- Aggregate phone numbers for the current manager
        STUFF((SELECT ', ' + T.telefone
               FROM Telefone T
               WHERE T.id_gestor = G.id -- Correctly referencing G.id
               FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS Telefones,
        -- Determine the manager's type
        CASE
            WHEN DD.id_gestor IS NOT NULL THEN 'Diretor de Departamento'
            WHEN SD.id_gestor IS NOT NULL THEN 'Secretário de Departamento'
            WHEN O.id_gestor IS NOT NULL THEN O.funcao
            ELSE 'Gestor Geral'
        END AS TipoGestor,
        -- Determine the associated department
        COALESCE(D_DD.nome, D_SD.nome) AS DepartamentoAssociado,
        -- Get cabinet information for directors
        DD.num_gab AS GabineteNumero,
        DD.andar_gab AS GabineteAndar,
        DD.localizacao_gab AS GabineteLocalizacao
    FROM
        Gestor AS G
    LEFT JOIN
        Diretor_Departamento AS DD ON G.id = DD.id_gestor -- Correctly referencing G.id
    LEFT JOIN
        Departamento AS D_DD ON DD.num_dep = D_DD.numero
    LEFT JOIN
        Secretario_Departamento AS SD ON G.id = SD.id_gestor -- Correctly referencing G.id
    LEFT JOIN
        Departamento AS D_SD ON SD.num_dep = D_SD.numero
    LEFT JOIN
        Outro AS O ON G.id = O.id_gestor -- Correctly referencing G.id
    WHERE
        (@SearchTerm IS NULL) -- If no search term, return all
        OR (@SearchType = 'ID' AND TRY_CAST(@SearchTerm AS INT) = G.id) -- Correctly referencing G.id
        OR (@SearchType = 'Nome' AND G.nome LIKE '%' + @SearchTerm + '%')
        OR (@SearchType = 'Localizacao' AND
            (DD.localizacao_gab LIKE '%' + @SearchTerm + '%'
             OR D_DD.nome LIKE '%' + @SearchTerm + '%'
             OR D_SD.nome LIKE '%' + @SearchTerm + '%'
             OR D_DD.abreviatura LIKE '%' + @SearchTerm + '%'
             OR D_SD.abreviatura LIKE '%' + @SearchTerm + '%')
           )
);
GO
