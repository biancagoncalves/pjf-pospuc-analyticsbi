fun_data_tb_raca <- function(conn){
  
  output = tibble::tibble(
    id_raca =c(1,2,3,4,5,9),
    raca_name =c('branca','preta','amarela','parda','indígena','ignorado')
  )
  
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_raca' %out% tables){
    statement = readr::read_file('./sql/6_tb_dim_raca.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_raca',
    value = output,
    append = TRUE
  )
  
  
  
  
 
}