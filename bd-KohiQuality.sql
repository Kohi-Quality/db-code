CREATE TABLE leads (

idLeads int primary key auto_increment,
fkSuporte int, constraint fkSuporteLeads foreign key (fkSuporte)
references suporte(idSuporte),
nome varchar(45),
email varchar(100),
mensagem varchar(500));

CREATE TABLE suporte (
idSuporte int primary key auto_increment,
nome varchar(45),
email varchar(100),
funcao varchar (45));

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

CREATE TABLE armazem (
idArmazem int primary key auto_increment,
fkFazenda int, constraint fkFazendaArmazem foreign key (fkFazenda)
references fazenda(idFazenda));

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

CREATE TABLE sensores (
idSensores int primary key auto_increment,
fkArmazem int, constraint fkSensoresArmazem foreign key (fkArmazem)
references armazem(idArmazem),
posicaoSensor varchar(45));

CREATE TABLE medida (
idMedida int primary key auto_increment,
fkSensores int, constraint fkSensorMedida foreign key (fkSensores)
references sensores(idSensores),
temperatura float,
umidade float,
data_hora datetime
);


















































