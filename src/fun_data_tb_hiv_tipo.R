fun_data_tb_hiv_tipo <- function(conn){
  output = tibble::tibble(
    hiv= c(1,2,3,4),
    hiv_tipo_name=c("Positivo","Negativo","Em andamento", "Não realizado"),
  )
  
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_hiv_tipo' %out% tables){
    statement = readr::read_file('./sql/2_tb_dim_hiv_tipo.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_hiv_tipo',
    value = output,
    append = TRUE
  )
  
  
}

