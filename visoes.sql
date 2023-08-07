
create view visao_livro_emprestimo_livro as select * from Emprestimo_Livro EL, Livro L where EL.cod_livro = L.codigo;

create view multas_pendentes as select codigo from Multa where status = 'pendente';

create view usuarios_atraso_pendentes as select U.*, A.*
from Usuario U inner join Atraso A on U.cpf = A.cpf_usuario
where A.status = 'pendente';

