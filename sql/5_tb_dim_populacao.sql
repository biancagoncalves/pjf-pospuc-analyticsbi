CREATE TABLE tb_dim_populacao(
 codigo_ibge INTEGER,
 valor INTEGER,
 ano INTEGER,
 PRIMARY KEY(codigo_ibge, ano),
 FOREIGN KEY (codigo_ibge) REFERENCES tb_dim_location (codigo_ibge)
);
