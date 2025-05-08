use salua;

select * from Gestor as g join Outro as o
on g.id = o.id_gestor;

select * from Gestor as g join Diretor_Departamento as dd
on dd.id_gestor = g.id;

select * from Gestor as g join Secretario_Departamento as sd
on g.id = sd.id_gestor;

select * from Sala as s join Gere as g
on s.numero = g.num_sala and s.andar = g.andar_sala and s.localizacao = g.localizacao_sala
join Gestor on Gestor.id = g.id_gestor;


select * from Sala as s join Gere as g
on s.numero = g.num_sala and s.andar = g.andar_sala and s.localizacao = g.localizacao_sala
join Gestor on Gestor.id = g.id_gestor
left join Outro as o on o.id_gestor = Gestor.id
left join Diretor_Departamento as dd on Gestor.id = dd.id_gestor
left join Secretario_Departamento as sd on Gestor.id = sd.id_gestor;


-- seleciona todas as salas com os dados respectivos à sua localização
select concat(s.andar, '.', s.numero) as 'sala', s.designacao_tipo, s.localizacao, p.codigo, d.numero, d.abreviatura
from Sala as s 
left join Predio as p on p.localizacao = s.localizacao
left join Departamento as d on d.localizacao = s.localizacao

--seleciona todos os managers com os seus contactos
select g.id, g.nome, g.horario_trabalho, e.email, t.telefone
from Gestor as g 
left join Email as e on g.id = e.id_gestor
left join Telefone as t on g.id = t.id_gestor;

-- seleciona todas as sala com a informação sobre os seus horários
select s.numero, s.andar, s.localizacao, s.designacao_tipo, h.nome_aula, h.dia_semana, h.inicio, h.fim
from Sala as s
join Horario_de_aulas as h 
on s.numero = h.num_sala and s.andar = h.andar_sala and s.localizacao = h.localizacao_sala
order by h.dia_semana, h.inicio;

-- seleciona todas as salas e as respetivas quantias de material
select s.numero, s.andar, s.localizacao, s.designacao_tipo, m.nome as material, cm.quantidade
from Sala as s
join Contem_Material as cm 
on s.numero = cm.num_sala and s.andar = cm.andar_sala and s.localizacao = cm.localizacao_sala
join Material as m on cm.cod_material = m.codigo;

-- seleciona todos os diretores de cada departamento e os seus gabinetes
select g.nome as diretor, d.abreviatura as departamento, 
concat(dd.andar_gab, '.', dd.num_gab) as gabinete, dd.localizacao_gab
from Gestor as g
join Diretor_Departamento as dd on g.id = dd.id_gestor
join Departamento as d on dd.num_dep = d.numero;

-- seleciona todas as localizações e os seu nomes alternativos
select l.nome, l.campus, l.endereco, na.nome_alternativo
from Localizacao as l
left join Nomes_Alternativos as na on l.nome = na.localizacao;