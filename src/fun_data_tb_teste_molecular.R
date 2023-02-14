fun_data_tb_teste_molecular <- function(conn){
  output = tibble::tibble(
    test_molec =c(1,
                  2,
                  3,
                  4,
                  5),
    test_molec_name=c(
      "Detectável sensível à Rifampicina"
      ,"Detectável resistente à Rifampicina"
      ,"Não detectável"
      ,"Inconclusivo"
      ,"Não realizado"
    )
  )
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_teste_molecular' %out% tables){
    statement = readr::read_file('./sql/15_tb_dim_teste_molecular.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_teste_molecular',
    value = output,
    append = TRUE
  )
  
}


