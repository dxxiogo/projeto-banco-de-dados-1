create index indice_bibliotecario on Bibliotecario(matricula);
create index indice_usuario on Usuario(cpf);
create index indice_funcionario on Funcionario(matricula);
create index indice_categoria on Categoria(genero);
create index indice_livro on Livro(titulo);
create index indice_emprestimo on Emprestimo(codigo);
create index indice_devolucao on Devolucao(codigo);
create index indice_reserva on Reserva(codigo);
create index indice_multa on Multa(codigo);
create index indice_atraso on Atraso(codigo);
create index indice_doacao on Doacao(codigo);
create index indice_emprestimo_livro on Emprestimo_Livro(cod_emprestimo);
create index indice_devolucao_livro on Devolucao_Livro(cod_devolucao);
create index indice_doacao_livro on Doacao_Livro(cod_doacao);
create index indice_atraso_livro on Atraso_Livro(cod_atraso);
create index indice_renovacoes on Renovacoes(cod_emprestimo);