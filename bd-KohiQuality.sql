CREATE TABLE leads (

idLeads int primary key auto_increment,
fkSuporte int, constraint fkSuporteLeads foreign key (fkSuporte)
references suporte(idSuporte),
nome varchar(45),
email varchar(100),
mensagem varchar(500));

INSERT INTO leads VALUES 
(default,1,"Melita","contato@melita.com","Olá, adorei o sistema de monitoramento de vocês, vamos fechar um contrato ? "),
(default,2,"Pilão","contato@pilao.com","Boa tarde ! Adorei o sistema de monitoramento de vocês, vamos logo fechar um contrato ? ");

CREATE TABLE suporte (
idSuporte int primary key auto_increment,
nome varchar(45),
email varchar(100),
funcao varchar (45));

INSERT INTO suporte VALUES 
(default, "Luis Gustavo", "vendas@kohi.quality.com", "Lider de vendas"),
(default, "Vitória Lemes", "vendas@kohi.quality.com", "Lider de vendas");

SELECT * FROM suporte;

CREATE TABLE fazenda (
idFazenda int primary key auto_increment,
nome varchar(30),
cep char(9),
numero varchar(45),
complemento varchar(45));

CREATE TABLE usuario (
idUsuario int primary key auto_increment,
fkFazenda int, constraint fkFazendaUsuario foreign key (fkFazenda)
references fazenda(idFazenda),
fkResponsavel int, constraint fkUsuarioResponsavel foreign key (fkResponsavel)
references usuario(idUsuario),
nomeCompleto varchar(100),
cpf char(11),
logradouro varchar(100),
numero varchar(10),
complemento varchar(45),
bairro varchar(45),
estado char(2),
numeroTelefone char(9),
email varchar(45),
senha varchar(45));

insert into usuario (fkFazenda, fkResponsavel, nomeCompleto, cpf, logradouro, numero, complemento, bairro, estado, numeroTelefone, email, senha) values
(1, NULL, 'Ana Silva', '12345678901', 'Rua das Palmeiras', '101', '', 'Centro', 'SP', '111222333', 'ana@example.com', 'senha123'),
(2, 1, 'Marcos Oliveira', '23456789012', 'Avenida Central', '202', 'Bloco A', 'Jardins', 'RJ', '444555666', 'marcos@example.com', 'abc123'),
(3, NULL, 'Carla Pereira', '34567890123', 'Travessa dos Lírios', '303', '', 'Centro', 'MG', '777888999', 'carla@example.com', 'senha456'),
(1, 2, 'Lucas Santos', '45678901234', 'Rua das Acácias', '404', '', 'Liberdade', 'SP', '999888777', 'lucas@example.com', 'xyz789'),
(2, NULL, 'Fernanda Souza', '56789012345', 'Alameda dos Ipês', '505', '', 'Novo Mundo', 'RJ', '333222111', 'fernanda@example.com', 'senha456'),
(1, 1, 'Gabriel Lima', '67890123456', 'Avenida dos Girassóis', '606', 'Casa 2', 'Praia', 'SP', '666777888', 'gabriel@example.com', 'senhaabc'),
(2, NULL, 'Juliana Castro', '78901234567', 'Rua das Violetas', '707', '', 'Floresta', 'RJ', '555444333', 'juliana@example.com', 'novasenha'),
(3, 2, 'Rafaela Almeida', '89012345678', 'Rua dos Jasmins', '808', '', 'Jardim', 'MG', '222333444', 'rafaela@example.com', 'outrasenha'),
(1, NULL, 'Sérgio Costa', '90123456789', 'Travessa das Orquídeas', '909', '', 'Centro', 'SP', '123456789', 'sergio@example.com', 'senha1234'),
(2, 3, 'Thiago Martins', '01234567890', 'Rua dos Cravos', '1010', '', 'Centro', 'RJ', '987654321', 'thiago@example.com', 'senha654');

CREATE TABLE armazem (
idArmazem int auto_increment,
fkFazenda int,
fkResponsavel int,
constraint fkFazenda foreign key (fkFazenda) references fazenda(idFazenda),
constraint pkComposta primary key (idArmazem, fkFazenda),
constraint fkResponsavelArmazen foreign key (fkResponsavel) references usuario(idUsuario));

insert into armazem values 
(null, 1, 3),
(null, 1, 3),
(null, 2, 1),
(null, 3, 6);

CREATE TABLE graos (
idGraos int primary key auto_increment,
fkArmazem int, constraint fkArmazemGraos foreign key (fkArmazem)
references armazem(idArmazem),
nomeGrao varchar(45),
temperaturaIdealMax float,
temperaturaIdealMin float,
umidadeIdealMax float,
umidadeIdealMin float
);

insert into graos values 
(null,1,'Grão de café ARÁBICA',15,10,70,60),
(null,2,'Grão de café CONILON',15,10,70,60);

CREATE TABLE sensores (
idSensores int primary key auto_increment,
fkArmazem int, constraint fkSensoresArmazem foreign key (fkArmazem)
references armazem(idArmazem),
posicaoSensor varchar(45));

insert into sensores values
(default,1,'No silo de madeira numero 4'),
(default,2,'No silo de aluminio numero 1'),
(default,3,'No silo de madeira numero 2'),
(default,4,'No silo de aluminio numero 3');

CREATE TABLE medida (
idMedida int primary key auto_increment,
fkSensores int, constraint fkSensorMedida foreign key (fkSensores)
references sensores(idSensores),
temperatura float,
umidade float,
data_hora datetime
);

INSERT INTO medida (fkSensor, temperatura, umidade) VALUES
(1, 25.5, 60.2),
(2, 26.3, 58.7),
(3, 24.8, 63.1),
(4, 27.1, 55.9);


















































