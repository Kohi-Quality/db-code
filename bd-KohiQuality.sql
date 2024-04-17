create database KohiQuality;

use KohiQuality;

-- TABELA USUÁRIO (PARA GUARDAR OS DADOS DOS NOSSOS CLIENTES)
create table Usuario(
idUsuario int primary key auto_increment,
nome varchar(40) not null,
CEP varchar(9) not null,
logradouro varchar(40)not null,
numero varchar(10) not null,
complemento varchar(30),
CPF char(11) unique not null,
email varchar(40) unique not null,
senha char(8) not null,
contato varchar(14) unique not null,
idFazenda int);

insert into Usuario(nome,CEP,logradouro,numero,complemento,CPF,email,senha,contato,idFazenda) values
('José Santanna','19537-145','R. Inglaterra', '91','casa 2','09534253319','josesantanna@gmail.com','1535','(18)3265-1329',1),
('São João da Silva','15965-442','R. Com. Bichara Moherdauí','191','casa 4','09423442343','saojoao@gmail.com','5698','(11)99935-0594',2),
('Geronimo Alves','04337-180','R. Celestino Gonçalves Bueno','120','casa 6','2344689898','geronimo@gmail.com','4002','(11)99918-3851',3),
('Fabiana Santos','04829-156','R. Nove de Julho','453','casa 10','43523478822','fabianasantos@gmail.com','8922','(21)3432-5541',4),
('Clotilde Ferreira','09856-174','R. Doce Caminho do Mar','563','casa 4','34265888523','clotildeferreira@gmail.com','1212','(13)4454-3642',5);

select idUsuario as 'ID Usuário', nome as 'Nome', CEP,logradouro as 'Logradouro',numero as 'Número',complemento as 'Complemento', CPF, email as 'E-mail', senha as 'Senha', contato as Contato, idFazenda as 'ID Fazenda' from Usuario;


-- TABELA FAZENDA (PARA DISTRIBUIR A QUANTIDADE DE USUARIOS PARA CADA FAZENDA)
create table Fazenda(
idFazenda int primary key auto_increment,
responsavel varchar(40),
nome varchar(30),
endereco varchar(40));

insert into Fazenda(responsavel, nome, endereco) values
('José Santanna','Vale do Café','R. Inglaterra, 91'),
('São João da Silva','Alto da Colina','R. Com. Bichara Moherdauí, 191'),
('Geronimo da Silva','Fazenda California','R. Celestino Gonçalves Bueno, 120'),
('Fabiana Santos','Fazenda Camocim','R. Nove de Julho, 453'),
('Clotilde Ferreira','Fazenda Diamantina','R. Doce Caminho do Mar, 563');

select idFazenda as 'ID Fazenda', responsavel as 'Responsável', nome as 'Nome', endereco as 'Endereço' from Fazenda;


-- TABELA SENSOR (PARA TERMOS CONTROLE DOS NOSSOS SENSORES, SABENDO ONDE ESTÃO LOCALIZADOS)
create table Sensor(
idSensor int primary key auto_increment,
idArmazem int,
nome varchar(15));

insert into Sensor(idArmazem, nome)values
(1,'DHT11'),
(2,'DHT11'),
(3,'DHT11'),
(4,'DHT11'),
(5,'DHT11');

select idSensor as 'ID Sensor', idArmazem as 'ID Armazém', nome as 'Nome' from Sensor;


-- TABELA REGISTROS DO SENSOR (ONDE FICA ARMAZENADO OS DADOS DOS SENSORES)
create table RegistroSensor(
idRegistroSensor int auto_increment primary key,
idSensor int,
temperatura float,
umidade float,
data_hora datetime default current_timestamp);

insert into RegistroSensor (idSensor,temperatura,umidade) values
(1,'17.6','17.8'),
(2,'16.2','15.1'),
(3,'16.5','12'),
(4,'16.9','13.7'),
(5,'17.1','15.8');

select idRegistroSensor as 'ID Registro do Sensor',idSensor as 'ID Sensor',temperatura as 'Temperatura',umidade as 'Umidade', data_hora as 'Data e Hora' from RegistroSensor;


-- TABELA ARMAZEM (PARA GURDAR INFORMAÇÕES SOBRE O SILO, COMO SUA CAPACIDADE)
create table Armazem(
idArmazem int primary key auto_increment,
idFazenda int,
modelo varchar (20),
capacidadeTonelada float,
localizacao varchar(50),
responsavel varchar(50));

insert into Armazem(idFazenda,modelo,capacidadeTonelada,localizacao,responsavel) values
(1,'SAT 0405','64.20','Rua Inglaterra, 91','José Santana'),
(2,'SAT 0508','145.80','R. Com. Bichara Moherdauí, 191','São joão da Silva'),
(3,'SAT 0705','174.70','Rua Celestinho Gonçalves Bueno, 120','Geronimo Alves'),
(4,'SAT 0406','74.20','Rua Nove de Julho, 453','Fabiana Santos'),
(5,'SAT 0811','462','Rua Doce Caminho do Mar, 563','Clotilde Ferreira');

select idArmazem as 'ID Armazém', idFazenda as 'ID Fazenda', modelo as 'Modelo', capacidadeTonelada as 'Capacidade em Toneladas', localizacao as 'Localização', responsavel as 'Responsável' from Armazem;


-- TABELA GRÃOS (PARA ARMAZENAR AS ESPECIFICAÇÕES DE CADA GRÃO)
create table Graos(
idGrao int primary key auto_increment,
nome varchar(20),	
temperaturaIdeal varchar(20),
umidadeIdeal varchar(20));

insert into Graos(nome,temperaturaIdeal,umidadeIdeal) values
('Connilon','22°C ~ 26°C','16 ~ 18%'),
('Arábica','19°C ~ 21°C','11 ~ 13%');

select idGrao as 'ID Grão', nome as 'Nome', temperaturaIdeal as 'Temperatura Ideal',umidadeIdeal as 'Umidade Ideal' from Graos;


-- TABELA CONTATO DO SIMULADOR (PARA GUARDAR OS DADOS DOS INTERESSADOS NA SIMULAÇÃO)
create table ContatoSimulador(
idContato int primary key auto_increment,
nome varchar(40),
email varchar(40),
mensagem varchar(500));

insert into ContatoSimulador(nome,email,mensagem) values
('Henrique de Oliveira Perez','henriqueperez@hotmail.com','Olá, tudo bem? gostei da proposta de vocês, gostaria de nogociar!'),
('Sheila Fagundes Neto','sheilafagundes@gmail.com','Oi, gostei dos valores informados poderiamos negociar?'),
('Cleber Florentino','cleberflorentino@outlook.com','Tudo bem? gostei dos valores poderiam entrar em contato?'),
('Anastacia Pereira da Silva','anastacia.pereira@gmail.com','Oi, gostaria de fazer um orçamento'),
('Mauricio de Souza','mauriciodesouza@hotmail.com','Olá, gostaria de saber seus valores, poderia entrar em contato?');

select idContato as 'ID Contato', nome as 'Nome', email as 'E-mail', mensagem as 'Mensagem' from ContatoSimulador;

create table medida(
idMedida int primary key auto_increment,
dht11_temperatura decimal(4,2),
dht11_umidade decimal(4,2));

ALTER TABLE medida ADD COLUMN data_hora datetime;

select * from medida;