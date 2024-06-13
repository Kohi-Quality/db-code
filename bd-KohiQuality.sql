create database KohiQuality;

use KohiQuality;

create table suporte (
idSuporte int primary key auto_increment,
nome varchar(45),
email varchar(100),
funcao varchar (45));

insert into suporte values
(default, "Felipe Medina", "vendas@kohi.quality.com", "Gestor de vendas"),
(default, "Vitória Lemes", "vendas@kohi.quality.com", "Lider de vendas");

select * from suporte;

select nome as 'Resposável' ,
	email as 'Email Suporte',
    funcao as 'Função Interna de Suporte'
from suporte;

create table leads (
idLeads int primary key auto_increment,
fkSuporte int, 
	constraint fkSuporteLeads foreign key (fkSuporte)
		references suporte(idSuporte),
nome varchar(45),
email varchar(100),
mensagem varchar(500));

insert into leads values 
(default,1,"Melita","contato@melita.com","Olá, adorei o sistema de monitoramento de vocês, vamos fechar um contrato ? "),
(default,2,"Pilão","contato@pilao.com","Boa tarde ! Adorei o sistema de monitoramento de vocês, vamos logo fechar um contrato ? ");

select * from leads;

select leads.nome as 'Nome Empresa',
	leads.email as 'Email Empresa',
    suporte.nome as 'Membro Responsável Pelo Suporte',
	suporte.email as 'Email suporte',
	mensagem as 'Mensagem Empresa'    
from leads join suporte on fkSuporte = idSuporte;

create table fazenda (
idFazenda int primary key auto_increment,
nome varchar(45),
cep char(9),
numero varchar(45),
complemento varchar(45));

insert into fazenda values
(default, 'Fazenda Santa Clara', '12345678', '1000', 'Sítio Bom Sucesso'),
(default, 'Fazenda São Jorge', '54321098', '500', 'Km 10, Estrada do Café'),
(default, 'Fazenda Nossa Senhora das Graças', '98765432', '1500', 'Rodovia dos Cafezais, Lote 20');

create table usuario (
idUsuario int primary key auto_increment,
fkFazenda int, 
	constraint fkFazendaUsuario foreign key (fkFazenda)
		references fazenda(idFazenda),
fkResponsavel int, 
	constraint fkUsuarioResponsavel foreign key (fkResponsavel)
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
(1, NULL, 'Felipe Albertim', '56789013216', 'Rua das Palmeiras', '101', '', 'Centro', 'SP', '111222333', 'felipe.a@gmail.com', 'albertimDEV!'),
(1, 1, 'Felipe Medina', '23456789012', 'Avenida Central', '202', 'Bloco A', 'Jardins', 'RJ', '444555666', 'felipe.m@gmail.com', 'medinaDEV!'),
(1, NULL, 'Matheus Essu', '34567890123', 'Travessa dos Lírios', '303', '', 'Centro', 'MG', '777888999', 'matheus@gmail.com', 'guedesDEV!'),
(1, 2, 'Rafaella Guedes', '45678901234', 'Rua das Acácias', '404', '', 'Liberdade', 'SP', '999888777', 'rafaella@gmail.com', 'guedesDEV!'),
(1, NULL, 'Vitória Lemes', '56789012345', 'Alameda dos Ipês', '505', '', 'Novo Mundo', 'RJ', '333222111', 'vitoria@gmail.com', 'lemesDEV!');


select * from usuario;

select usuario.nomeCompleto as 'Nome Usuário',
	responsavel.nomeCompleto as 'Nome Responsável',
	usuario.email as 'Email usuário',
    fazenda.
    nome as 'Nome Fazenda'
    from usuario join fazenda on fkFazenda = idFazenda
    join usuario as responsavel
    on responsavel.idUsuario = usuario.fkResponsavel;
    
select COUNT(idUsuario) as 'Quantidade de usuários' from usuario;

create table silo (
idSilo int auto_increment,
nome varchar(45),
fkFazenda int,
fkResponsavel int,
	constraint fkFazenda foreign key (fkFazenda) references fazenda(idFazenda),
	constraint pkComposta primary key (idSilo, fkFazenda),
	constraint fkResponsavelSilo foreign key (fkResponsavel) references usuario(idUsuario));

insert into silo values 
(null,"Beta" ,1, 3),
(null,"Alpha",1, 2),
(null,"Gama",2, 1),
(null,"Delta",3, 4);

select * from silo;

create table graos (
idGraos int primary key auto_increment,
fkSilo int, 
	constraint fkSiloGraos foreign key (fkSilo)
		references silo(idSilo),
nomeGrao varchar(45),
temperaturaIdealMax float,
temperaturaIdealMin float,
umidadeIdealMax float,
umidadeIdealMin float,
mensagemEstavel varchar(45),
mensagemAlerta varchar(45),
mensagemCritico varchar(45));


insert into graos(fkSilo, nomeGrao, temperaturaIdealMax, temperaturaIdealMin, umidadeIdealMax, umidadeIdealMin) values 
(1,'Grão de café ARÁBICA',23,10,65.99,65.01),
(2,'Grão de café ConILon',23,10,65.99,65.01);

select * from graos;

select nomeGrao as 'Nome Grão',
	silo.nome as 'Nome Silo',
    temperaturaIdealMax as 'Temperatura ideal máxima',
    temperaturaIdealMin as 'Temperatura ideal mínima',
    umidadeIdealMax as 'Umidade ideal máxima',
    umidadeIdealMin as 'Umidade ideal mínima' 
    from graos join silo on fkSilo = idSilo;

create table sensores (
idSensor int primary key auto_increment,
fkSilo int,
posicao varchar(45), 
	constraint fkSensorSilo foreign key (fkSilo)
		references silo(idSilo));

insert into sensores values
(default,1,'No silo de madeira numero 4'),
(default,2,'No silo de aluminio numero 1'),
(default,3,'No silo de madeira numero 2'),
(default,4,'No silo de aluminio numero 3');

select * from sensores;

select idSensor as 'Id Do Sensor',
	silo.nome as 'Nome Silo' from sensores
    join silo on fkSilo = idSilo;
    
select COUNT(idSensor) as 'Quantidade de Sensores' from sensores;

create table medida (
idMedida int primary key auto_increment,
fkSensor int, 
	constraint fkSensorMedida foreign key (fkSensor)
		references sensores(idSensor),
temperatura float,
umidade float,
data_hora datetime default current_timestamp);

insert into medida values
(default,1, 22.1, 64.3, '2024-06-06 17:09:25');

select * from medida;
     
select 
    u.idUsuario,
    u.nomeCompleto as nomeResponsavel,
    u.email,
    u.senha,
    s.idSilo,
    f.idFazenda,
    f.nome as nomeFazenda,
    f.cep,
    f.numero as numeroFazenda,
    f.complemento as complementoFazenda
from 
    usuario as u
join 
    silo as s on u.idUsuario = s.fkResponsavel
join 
    fazenda as f on s.fkFazenda = f.idFazenda
where
    u.email = 'felipe.a@gmail.com' AND u.senha = 'albertimDEV!';
    

    
select 
    s.idSensor,
    m.idMedida,
    m.temperatura,
    m.umidade,
	date_format(m.data_hora,'%H:%i:%s') as momento_grafico
from 
    sensores s
join 
    medida m on s.idSensor = m.fkSensor 
where fkSensor = 1
    order by idMedida desc limit 3;