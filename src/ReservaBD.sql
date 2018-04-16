create table Hotel
(
id integer not null generated always as identity (start with 1, increment by 1),
cnpj varchar(14) not null,
nome varchar(256) not null,
senha varchar(256) not null,
cidade varchar(24) not null,
CONSTRAINT primary_key PRIMARY KEY (id)
);

create table Site
(
id integer not null generated always as identity (start with 1, increment by 1),
url varchar(256) not null,
senha varchar(256) not null,
nome varchar(256) not null,
telefone varchar(11) not null,
CONSTRAINT primary_key_site PRIMARY KEY (id)
);


create table Promocao
(
id integer not null generated always as identity (start with 1, increment by 1),
preco float not null,
dataInicial date not null,
dataFinal date not null,
site  integer references Site (id),
hotel integer references Hotel (id),
CONSTRAINT primary_key_promocao PRIMARY KEY (id)
);