create table Usuario (
	CPF CHARACTER(11),
	Nome VARCHAR(100) NOT NULL,
	Email VARCHAR(60) NOT NULL,
	Telefone VARCHAR(15) NOT NULL,
	Endereco VARCHAR(100) NOT NULL,
	CONSTRAINT Usuario_cpf_pk PRIMARY KEY(CPF)
);

create table Funcionario (
	Matricula VARCHAR(20),
	Nome VARCHAR(100),
	CPF CHARACTER(11) UNIQUE NOT NULL,
	Email VARCHAR(60),
	Telefone VARCHAR(15) NOT NULL,
	Endereco VARCHAR(100) NOT NULL,
	Salario NUMERIC(10, 2) NOT NULL,
	CONSTRAINT Funcionario_matricula_pk PRIMARY KEY(Matricula),
	CONSTRAINT Funcionario_salario_check CHECK(Salario >= 1320)
);

create table Bibliotecario (
	Matricula VARCHAR(20),
	Turno VARCHAR(30) NOT NULL,
	Escolaridade VARCHAR(50) NOT NULL,
	CONSTRAINT Bibliotecario_matricula_pk PRIMARY KEY(Matricula),
	CONSTRAINT Bibliotecario_matricula_fk FOREIGN KEY(Matricula) REFERENCES Funcionario(Matricula)
);

create table Categoria(
	codigo varchar(20),
	genero varchar(100) not null,
	num_bloco int not null,
	descricao varchar(300),
	constraint categoria_codigo_pk primary key(codigo)
);


create table Livro(
	codigo varchar(20),
	titulo varchar(100) not null,
	autor varchar(100) not null,
	editora varchar(80),
	data_publicacao date,
	tipo varchar(50) not null,
	num_paginas int not null,
	cod_categoria varchar(20),
	constraint livro_codigo_pk primary key(codigo),
	constraint livro_cod_categoria_fk foreign key (cod_categoria) references Categoria (codigo)
);


create table Emprestimo (
	codigo varchar(20),
	status varchar(20) not null,
	data_emprestimo date not null,
	cpf_usuario character(11) not null,
	mat_bibliotecario varchar(20) not null,
	constraint emprestimo_codigo_pk primary key(codigo),
	constraint emprestimo_usuario_fk foreign key(cpf_usuario) references Usuario(CPF),
	constraint emprestimo_bibliotecario_fk foreign key(mat_bibliotecario) references Bibliotecario(matricula)
);

create table Devolucao (
	codigo varchar(20),
	status varchar(20) not null,
	data_devolucao date not null,
	observacao varchar(80),
	cpf_usuario character(11) not null,
	mat_bibliotecario varchar(20) not null,
	constraint devolucao_codigo_pk primary key(codigo),
	constraint devolucao_usuario_fk foreign key(cpf_usuario) references Usuario(CPF),
	constraint devolucao_bibliotecario_fk foreign key(mat_bibliotecario) references Bibliotecario(matricula)
);

create table Reserva (
	codigo varchar(20),
	status varchar(20) not null,
	data_reserva date not null,
	data_disponibilidade date not null,
	cpf_usuario character(11) not null,
	mat_bibliotecario varchar(20) not null,
	cod_livro varchar(20) not null,
	constraint reserva_codigo_pk primary key(codigo),
	constraint reserva_usuario_fk foreign key(cpf_usuario) references Usuario(CPF),
	constraint reserva_bibliotecario_fk foreign key(mat_bibliotecario) references Bibliotecario(matricula),
	constraint reserva_livro_fk foreign key(cod_livro) references Livro(codigo)
);



create table Multa (
	codigo varchar(20),
	status varchar(20) not null,
	razao varchar(200),
	valor numeric(5, 2) not null,
	constraint multa_codigo_pk primary key(codigo)
);

create table Atraso (
	codigo varchar(20),
	status varchar(20) not null,
	duracao int not null,
	data_inicio date not null,
	cpf_usuario character(11) not null,
	cod_multa varchar(20) not null,
	constraint atraso_codigo_pk primary key(codigo),
	constraint atraso_usuario_fk foreign key(cpf_usuario) references Usuario(CPF),
	constraint atraso_multa_fk foreign key(cod_multa) references Multa(codigo)
);


create table Doacao (
	codigo varchar(20),
	quant_livros int not null,
	data_doacao date not null,
	cpf_usuario character(11) not null,
	constraint doacao_codigo_pk primary key(codigo),
	constraint doacao_usuario_fk foreign key(cpf_usuario) references Usuario(CPF)
);
create table Devolucao_Livro (
	cod_devolucao varchar(20),
	cod_livro varchar(20),
	constraint devolucao_livro_pk primary key(cod_devolucao, cod_livro),
	constraint devolucao_livro_codLivro_fk foreign key(cod_livro) references Livro(codigo),
	constraint devolucao_livro_codDevolucao_fk  foreign key(cod_devolucao) references Devolucao(codigo)
);

create table Emprestimo_Livro (
	cod_emprestimo varchar(20),
	cod_livro varchar(20),
	constraint emprestimo_livro_pk primary key(cod_emprestimo, cod_livro),
	constraint emprestimo_livro_codLivro_fk foreign key(cod_livro) references Livro(codigo),
	constraint emprestimo_livro_codEmprestimo_fk  foreign key(cod_emprestimo) references Emprestimo(codigo)
);

create table Atraso_Livro (
	cod_atraso varchar(20),
	cod_livro varchar(20),
	constraint atraso_livro_pk primary key(cod_atraso, cod_livro),
	constraint atraso_livro_codLivro_fk foreign key(cod_livro) references Livro(codigo),
	constraint atraso_livro_codAtraso_fk  foreign key(cod_atraso) references Atraso(codigo)
);

create table Doacao_Livro (
	cod_doacao varchar(20),
	cod_livro varchar(20),
	constraint doacao_livro_pk primary key(cod_doacao, cod_livro),
	constraint doacao_livro_codLivro_fk foreign key(cod_livro) references Livro(codigo),
	constraint doacao_livro_codDoacao_fk  foreign key(cod_doacao) references Doacao(codigo)
);

create table Renovacoes (
	cod_emprestimo varchar(20),
	cod_renovacao varchar(20),
	data_renovacao date not null,
	constraint renovacoes_pk primary key(cod_emprestimo, cod_renovacao),
	constraint renovacoes_codEmprestimo_fk  foreign key(cod_emprestimo) references Emprestimo(codigo)
);



