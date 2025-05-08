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

