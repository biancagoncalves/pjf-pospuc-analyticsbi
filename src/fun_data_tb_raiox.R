fun_data_tb_raiox <- function(conn){
  
  output = tibble::tibble(
    id_raiox = c(1,2,3,4),
    diagnostico_tipo = c('suspeito','normal','outra patologia','não realizado')
  )
  
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_raiox' %out% tables){
    statement = readr::read_file('./sql/7_tb_dim_raiox.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_raiox',
    value = output,
    append = TRUE
  )
  
  
  
}

