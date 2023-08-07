insert into Funcionario (matricula, nome, Cpf, email, telefone, endereco, salario)
values ('1111-1', 'Kamila', '12314588929', 'kamila@gmail.com', '9992678900', 'Rua Bernado Nogueira', 2000),
	   ('1111-2', 'Veneranda', '15646797851', 'veneranda@gmail.com', '992867456', 'Rua Constantino da Silva', 1400),
	   ('1111-3', 'Patrícia', '22287698134', 'patricia@gmail.com', '9654326765', 'Rua Cunha Da Costa', 1400),
	   ('1111-4', 'Kauan', '12365378900', 'kauan@gmail.com', '995678912', 'Rua Bernado Nogueira', 1400),
	   ('1111-5', 'Viviane', '75565988856', 'vivi@gmail.com', '987654990', 'Centro', 2500),
	   ('1111-6', 'Rafael', '98765432100', 'rafael@gmail.com', '9998887776', 'Avenida das Flores', 1800),
       ('1111-7', 'Juliana', '45678901234', 'juliana@gmail.com', '9888776655', 'Rua dos Amigos', 1600);
	   
insert into Bibliotecario (matricula, turno, escolaridade)
values ('1111-1', 'tarde', 'superior completo'),
	   ('1111-4', 'manha', 'ensino medio completo'),
	   ('1111-5', 'noite', 'superior completo'),
	   ('1111-2', 'manha', 'superior completo'),
       ('1111-3', 'tarde', 'ensino medio completo');

insert into Usuario (cpf, nome, email, telefone, endereco)
values ('12377654229', 'Diogo', 'diogo@gmail.com', '991234567','Rua Senhor Nogueira'),
	   ('67896542987', 'Ana Clara', 'ana@gmail.com', '99976543', 'Rua das Flores'),
	   ('99278906544', 'Gabriela', 'gabi@gmail.com', '992654378', 'Rua Cunha da Costa'),
	   ('11177659321', 'Misael', 'misael@gmail.com', '9937654312', 'Rua Constatino da Silva'),
	   ('76549875433', 'Estephany', 'estephany@gmail.com', '991886654', 'Rua Marielle Franco');
	   
insert into Categoria (codigo, genero, num_bloco, descricao) 
values ('23467', 'Romance', 1, '...'),
		('12678', 'Poema', 2, '...'),
		('98753', 'Novela', 3, '...'),
		('76541', 'Conto', 4, '...'),
		('98765', 'Drama histórico', 5, '...'),
		('76542', 'História', 6, '...');
		
insert into Livro (codigo, titulo, autor, editora, cod_categoria, tipo, data_publicacao, num_paginas)
values ('6558380544', 'A biblioteca da meia-noite', 'Matt Haig', 'Bertrand Brasil', '23467', 'literario', '27/07/2021', 308),
	   ('8535932569', 'Pessoas normais', 'Sally Rooney' ,'Companhia das Letras', '23467', 'literario', '30/09/2019', 264),
	   ('8584391509', 'Os sete maridos de Evelyn Hugo', 'Taylor Jenkis' , null, '23467', 'literario', '21/08/2019', 360),
	   ('9780292724', 'Laços de Familia', 'Clarice Lispector', 'Rocco Digital', '76541', 'literario','19/06/2020', 135),
	   ('8535931805', 'Os contos', 'Lygia Fagundes Telles', 'Companhia das Letras', '76541', 'literario', '28/11/2018', 762),
	   ('6555874600', 'Sentimento do Mundo', 'Carlos Drummond de Andrade', 'Record', '12678', 'literário' ,'18/04/2022', 93),
	   ('8547209824', 'Historia Global, Brasil e Geral', 'Gilberto Cotrim', 'Saraiva', '76542', 'didático', '03/12/2019', 832),
	   ('6555875232', 'A rosa do povo', 'Carlos Drummond', 'Recorde', '12678', 'literario', null, 238 ),
	   ('6588490365', 'Antes que o café esfrie', 'Toshikazu Kawaguchi', null, '76541', 'literario','15/04/2022', 208),
	   ('8525064141', 'O livro da História', 'Rafael Longo', null, '76542', 'didático', null, 352);

insert into Emprestimo (codigo, status, data_emprestimo, cpf_usuario, mat_bibliotecario) 
values ('11191', 'pendente', '20/12/2022', '99278906544', '1111-3'),
	   ('11192', 'pendente', '09/12/2022', '76549875433', '1111-5'),
	   ('11193', 'concluido', '15/12/2022', '12377654229', '1111-1'),
	   ('11194', 'pendente', '15/12/2022', '67896542987', '1111-4'),
	   ('11198', 'concluido', '10/12/2022', '99278906544', '1111-4'),
	   ('11196', 'concluido', '12/12/2022', '11177659321', '1111-3'),
	   ('11199', 'concluido', '17/12/2022', '76549875433', '1111-1'),
	   ('11200', 'concluido', '23/11/2022', '12377654229', '1111-5'),
	   ('11201', 'pendente', '05/01/2023', '67896542987', '1111-4'),
       ('11202', 'concluido', '08/01/2023', '99278906544', '1111-2'),
       ('11203', 'concluido', '10/01/2023', '12377654229', '1111-5'),
       ('11204', 'pendente', '12/01/2023', '11177659321', '1111-2'),
       ('11205', 'pendente', '15/01/2023', '76549875433', '1111-1');

insert into Emprestimo_Livro (cod_emprestimo, cod_livro)
values ('11191', '9780292724'),
	   ('11192', '8584391509'),
	   ('11193', '8584391509'),
	   ('11194', '6555874600'),
	   ('11198', '8547209824'),
	   ('11196', '9780292724'),
	   ('11199', '6555874600'),
	   ('11200', '8584391509' );
	   
	   
insert into Devolucao (codigo, status, data_devolucao, observacao, cpf_usuario, mat_bibliotecario)
values ('91234', 'concluida', '28/12/2023', '...' ,'12377654229', '1111-1'),
	   ('91764', 'concluida', '20/12/2023', null,'99278906544', '1111-1'),
	   ('91334', 'concluida', '28/12/2023', null,'12377654229', '1111-4'),
	   ('91094', 'concluida', '23/12/2023', '...','76549875433', '1111-5'),
	   ('91774', 'concluida', '10/12/2023', '...','11177659321', '1111-3');

insert into Devolucao_Livro (cod_devolucao, cod_livro) 
values ('91234', '6555874600'),
	   ('91764', '9780292724'),
	   ('91334', '8584391509'),
	   ('91094', '8547209824'),
	   ('91774', '8584391509');


insert into Doacao (codigo, quant_livros, data_doacao, cpf_usuario) 
values ('64576', 2, '08/09/2023', '76549875433'),
	   ('64366', 1, '12/10/2023', '11177659321'),
	   ('64987', 1, '15/10/2023', '67896542987'),
	   ('64332', 1, '17/08/2023', '67896542987'),
	   ('64637', 1, '15/09/2023', '12377654229');

insert into doacao_livro (cod_doacao, cod_livro) 
values ('64576', '9780292724'),
	   ('64576', '6555874600'),
	   ('64366', '6558380544'),
	   ('64987', '8547209824'),
	   ('64332', '8535932569'),
	   ('64637', '8584391509');

insert into Reserva (codigo, status, data_reserva, data_disponibilidade, cpf_usuario, mat_bibliotecario, cod_livro)
values ('29787', 'pendente', '20/12/2022' , '27/12/2022', '11177659321',  '1111-1', '6555874600'),
	   ('29768', 'concluida', '05/12/2022', '08/12/2022', '99278906544', '1111-2', '6555874600'),	
	   ('29732', 'pendente', '19/12/2022', '22/12/2022', '99278906544',  '1111-4', '8535932569'),
	   ('29709', 'concluida', '19/11/2022', '21/11/2022','12377654229', '1111-5', '6558380544'),	
	   ('29721', 'concluida', '03/11/2022', '12/11/2022','12377654229', '1111-3', '8535932569');


insert into Multa (codigo, status, razao, valor)
values ('33301', 'pendente', 'Atraso na devolução', 0.5),
       ('33302', 'pendente', 'Danos ao livro', 0.25),
       ('33303', 'concluido', 'Perda do livro', 0.50),
       ('33304', 'pendente', 'Atraso na devolução', 0.75),
       ('33305', 'concluido', 'Danos ao livro', 1.00);


insert into Atraso (codigo, duracao, status, data_inicio, Cpf_usuario, cod_multa)
values ('22201', 5, 'pendente', '28/12/2022', '99278906544', '33301'),
       ('22202', 3, 'pendente', '17/12/2022', '12377654229', '33302'),
       ('22203', 2, 'concluido', '23/11/2022', '12377654229', '33303'),
       ('22204', 4, 'pendente', '04/01/2023', '67896542987', '33304'),
       ('22205', 2, 'concluido', '16/01/2023', '99278906544', '33305');

insert into Atraso_Livro (cod_atraso, cod_livro)
values ('22201', '6558380544'),
       ('22202', '8535932569'),
       ('22203', '8584391509'),
       ('22204', '9780292724'),
       ('22205', '8535931805');

insert into Renovacoes (cod_emprestimo, cod_Renovacao, data_Renovacao)
values ('11191', '22211', '27/12/2022'),
       ('11193', '22212', '22/12/2022'),
       ('11196', '22213', '20/12/2022'),
       ('11199', '22214', '24/12/2022'),
       ('11202', '22215', '10/01/2023');