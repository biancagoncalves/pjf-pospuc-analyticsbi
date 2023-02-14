fun_data_tb_teste_sensibilidade <- function(conn){
  output = tibble::tibble(
    test_sensi_id =c(1,2,3,4,5,6,7,8,9,10),
    test_sensi_name=c(
      "Resistente somente à Isoniazida",
      "Resistente somente à Rifampicina",
      "Resistente à Isoniazida e Rifampicina",
      "Resistente a outras drogas de 1ª linha",
      "Sensível",
      "Em andamento",
      "Não realizado",
      "",
      "",
      ""
    )
  )
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_teste_sensibilidade' %out% tables){
    statement = readr::read_file('./sql/9_tb_dim_teste_sensibilidadeo.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_teste_sensibilidade',
    value = output,
    append = TRUE
  )
  
  
  
}

#DBI::dbSendQuery(conn,'DROP TABLE IF EXISTS tb_teste_sensibilidade')
#DBI::dbSendQuery(conn,'DROP TABLE IF EXISTS tb_tuberculose')
