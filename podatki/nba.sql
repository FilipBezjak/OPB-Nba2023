DROP TABLE IF EXISTS tekme;
DROP TABLE IF EXISTS najljubse;
DROP TABLE IF EXISTS oseba;
DROP TABLE IF EXISTS poskodba;
DROP TABLE IF EXISTS igralec;
DROP TABLE IF EXISTS ekipa;



CREATE TABLE oseba (
    ime VARCHAR(20) NOT NULL,
    priimek VARCHAR(20) NOT NULL,
    username VARCHAR(25) PRIMARY KEY,
    geslo VARCHAR(20) NOT NULL,
    adminstrator BOOLEAN NOT NULL DEFAULT (0)
);

CREATE TABLE ekipa (
    ime VARCHAR(25),
    kratica VARCHAR(3) PRIMARY KEY
);

CREATE TABLE najljubse (
    clovek VARCHAR(25) REFERENCES oseba(username),
    ekipa VARCHAR(3) REFERENCES ekipa(kratica)
);


CREATE TABLE igralec (
    ime VARCHAR(40)  PRIMARY KEY,
    ekipa VARCHAR(3) REFERENCES  ekipa(kratica),
    pozicija VARCHAR(5),
    tocke FLOAT NOT NULL,
    asistence FLOAT NOT NULL,
    skoki FLOAT NOT NULL,
    odigrane_minute FLOAT  NOT NULL
);

CREATE TABLE poskodba (
    ime VARCHAR(40) PRIMARY KEY,
    cas DATE NOT NULL
);

CREATE TABLE tekme (
    ekipa1 VARCHAR REFERENCES  ekipa(kratica),
    ekipa2 VARCHAR REFERENCES  ekipa(kratica),
    cas TIME NOT NULL
)



