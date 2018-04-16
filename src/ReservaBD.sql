create table Hotel
(
id integer not null generated always as identity (start with 1, increment by 1),
cnpj varchar(14) not null,
nome varchar(256) not null,
senha varchar(256) not null,
cidade varchar(24) not null,
CONSTRAINT primary_key PRIMARY KEY (id)
);


create table Promocao
(
id integer not null generated always as identity (start with 1, increment by 1),
url varchar(256) not null,
preco float not null,
dataInicial date not null,
dataFinal date not null,
hotel integer references Hotel (id)
);
