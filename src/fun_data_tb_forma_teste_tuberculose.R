fun_data_tb_forma_teste_tuberculose <- function(conn){
  
  output = tibble::tibble(
    forma_id= c(1,2,3),
    forma_name=c("pulmonar","extrapulmonar","pulmonar + extrapulmonar")
  )
  
  tables = DBI::dbListTables(conn)
  if('tb_dim_forma_teste_tuberculose' %out% tables){
    statement = readr::read_file('./sql/1_tb_dim_forma_teste_tuberculose.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  tryCatch({
    DBI::dbWriteTable(
      conn,
      name = 'tb_dim_forma_teste_tuberculose',
      value = output,
      append = TRUE
    )
    
    
  })
  
  
  
}

