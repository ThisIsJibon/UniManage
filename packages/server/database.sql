CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(28) NOT NULL UNIQUE,
    passhash VARCHAR NOT NULL
);

INSERT INTO users(username, passhash) values($1,$2);


CREATE TABLE userData(
    reg INTEGER PRIMARY KEY,
    fullname VARCHAR(30),
    username VARCHAR(28) NOT NULL UNIQUE,
    email  VARCHAR(28),
    dept  VARCHAR(28),
    ses  VARCHAR(28),
    addres  VARCHAR(28),
    contact  VARCHAR(28)
    
);