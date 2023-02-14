CREATE TABLE tb_dim_location(
 codigo_ibge       INTEGER,
 nome              TEXT,
 latitude          FLOAT,
 longitude         FLOAT,
 capital           INTEGER,
 codigo_uf         INTEGER,
 siafi_id          INTEGER,
 ddd               INTEGER,
 fuso_horario      TEXT,
 uf                TEXT,
 estado            TEXT,
 latitude_estado   FLOAT,
 longitude_estado  FLOAT,
 regiao   TEXT,
 PRIMARY KEY(codigo_ibge)
);
