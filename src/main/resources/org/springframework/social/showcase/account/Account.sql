create table Account (id INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 100, INCREMENT BY 1) PRIMARY KEY,
						username varchar(100) unique,
						password varchar(100) not null,
						firstName varchar(100) not null, 
						lastName varchar(100) not null);
