CREATE TABLE USERS (
user_name varchar(300),
email varchar(300),
PASSWORD varchar(300),
CONSTRAINT pk_users PRIMARY KEY(user_name));

CREATE TABLE BOOKS (
bookID integer,
title varchar(500),
isbn13 integer,
CONSTRAINT pk_books PRIMARY KEY(isbn13));

CREATE TABLE AUTHORS (
isbn13 integer not NULL,
authors varchar(100),
CONSTRAINT fk_authors_books foreign key(isbn13) references BOOKS(isbn13));

CREATE TABLE RATING(
isbn13 integer not NULL,
rating decimal(3,2),
CONSTRAINT fk_rating_books foreign key(isbn13) references BOOKS(isbn13));

CREATE TABLE PUBLISH(
isbn13 integer not NULL,
publication_date date,
publisher varchar(20),
CONSTRAINT fk_publish_books foreign key(isbn13) references BOOKS(isbn13));

CREATE TABLE AVAILABILITY(
isbn13 integer not NULL,
status integer(1) check (status = 0 OR status = 1),
CONSTRAINT fk_availability_books foreign key(isbn13) references BOOKS(isbn13));

CREATE TABLE RESERVATION(
res_id integer not NULL,
user_name varchar(300) not NULL,
res_date date,
copies integer,
isbn13 integer not NULL,
CONSTRAINT pk_reservation primary key(res_id),
CONSTRAINT fk_reservation_users foreign key(user_name) references USERS(user_name),
CONSTRAINT fk_reservation_books foreign key(isbn13) references BOOKS(isbn13));

CREATE TABLE RETURNING(
return_id integer not NULL,
user_name varchar(300) not NULL,
return_date date,
copies integer,
CONSTRAINT pk_returning primary key(return_id),
CONSTRAINT fk_returning_users foreign key(user_name) references USERS(user_name));


CREATE TABLE FINE(
fine_id integer not NULL,
user_name varchar(300) not NULL,
fine_amt integer,
CONSTRAINT pk_fine primary key(fine_id),
CONSTRAINT fk_fine_users foreign key(user_name) references USERS(user_name));

DROP TABLES authors, availability, books, fine, publish, rating, reservation, returning, users