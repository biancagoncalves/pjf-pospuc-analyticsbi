CREATE TABLE tb_dim_cbo_movimentacao_caged(
   ano_declarado INTEGER not null,
   codigo_cbo INTEGER not null,
   desligamento NUMERIC,
   admissao NUMERIC,
   saldo NUMERIC,
   
 PRIMARY KEY (ano_declarado,codigo_cbo),
 --FOREIGN KEY (codigo_cbo) REFERENCES tb_ocupacao_economica (codigo)

);