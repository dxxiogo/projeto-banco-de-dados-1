
/* Consulta de todos os usuários que realizaram pelo menos uma doação e não possuem registro de atraso 
- Consulta envolvendo operações com conjuntos */

select U.*
from Usuario U, Doacao D
where U.cpf = D.cpf_usuario
intersect
select U.*
from Usuario U
where U.cpf not in (select cpf_usuario from Atraso)

/*Consulta para obter todos os livros que foram emprestados, mas não possuem registro de reserva - Consulta envolvendo
operação com conjuntos*/
select L.*
from Livro L, Emprestimo_Livro EL 
where L.codigo = EL.cod_livro
except
select L.*
from Livro L, Reserva R
where L.codigo = R.cod_livro


/*Listar o titulo, o código e o autor de todos os livros que não possuem editoras, mas possuem uma data de publicação e ordenar por ordem decrescente do autor - Consulta envolvendo comparação com valores nulos*/
select codigo, titulo, autor 
from Livro
where editora is null AND data_publicacao is not null;


/*Listar todas as informações das devoluções em que o status é de concluída e que possuem alguma observação - Consulta envolvendo comparação com valores nulos*/

select *
from Devolucao
where status = 'concluida' AND observacao is not null;



/*Obter todas as informações de usuários com multas pendentes - Consulta envolvendo aninhamento*/
select *
from Usuario
where cpf in (
	select cpf_usuario as cpf
	from Atraso
	where cod_multa in (select codigo from multas_pendentes)); 



/*Obter o nome e o cpf  dos usuários que possuem e pelo menos dois livros emprestados  e ordenar por ordem crescente do nome - Consulta envolvendo aninhamento e ordenamento*/
select cpf, nome
from Usuario
where cpf in 
(select E.cpf_usuario
from Emprestimo E, Emprestimo_Livro EL
where E.codigo = EL.cod_emprestimo
group by E.cpf_usuario
having count(*) >= 2) 
order by nome asc;

/*Obter o código, o gênero e a quantidade de livros que estão associados a cada categoria - Consulta envolvendo agrupamento*/

select Cat.codigo, Cat.genero, count(*) as quant_livros 
from Categoria Cat, Livro L
where L.cod_categoria = Cat.codigo
group by Cat.codigo, Cat.genero;

/*Obter o nome, cpf  e a quantidade de empréstimos realizados pelos usuários que possuem status de pendente em que a quantidade é superior a 1 -
Consulta envolvendo agrupamento com filtro*/

select U.cpf, U.nome, count(*) as quant_pendentes
from Usuario U, Emprestimo E
where U.cpf = E.cpf_usuario AND E.status = 'pendente'
group by U.cpf, U.nome
having count(*) >= 2;


/*Listar livros em que o sobrenome do autor possua uma determinada sequência de caracteres, em ordem crescente do autor - Consulta envolvendo busca por substrings e ordenamento*/
select * 
from Livro
where autor like '% Lispector'
order by autor asc;

/*Obter bibliotecários em que o número do telefone que iniciam com uma determinada sequência de dígitos - Consulta envolvendo busca por substrings*/
select F.*
from Funcionario F natural inner join Bibliotecario B
where F.telefone like '992%';

/*Obter todas as informações dos livro, incluindo o gênero da categoria e o número do bloco em que ela está associada - Consulta envolvendo junção*/
select L.*, Cat.genero, num_bloco
from Livro L inner join Categoria Cat on L.cod_categoria = Cat.codigo;


/*Consulta para obter a quantidade total de livros emprestados por categoria - Consulta envolvendo junção*/
select Cat.genero, count(*) as livros_emprestados 
from Categoria Cat inner join visao_livro_emprestimo_livro VLEL on Cat.codigo = VLEL.cod_categoria
group by Cat.genero;


/*Obter todas as doações feitas por usuários que já realizaram um empréstimo - Consulta envolvendo aninhmaneto correlacionado*/
select *
from Doacao
where exists (select cpf_usuario from Emprestimo);

/*Obter todas as devoluções recebidas por um determinado bibliotecário - Consulta envolvendo aninhamento correlacionado*/
select *
from Devolucao
where exists (
	select *
	from Bibliotecario B natural inner join Funcionario
	where nome = 'Kauan'
);


/*Obter a soma da quantidade de todos os livros doados recebidos na biblioteca - Consulta envolvendo função agregada*/
select sum(quant_livros) as livros_doados
from Doacao

/*Obter a média salarial de todos os funcionários que não são bibliotecários - Consulta envolvendo função agregada*/
select avg(salario) as media_salarial
from Funcionario F, Bibliotecario B
where F.matricula <> B.matricula
