fun_data_tb_populacao <- function(df_populacao,conn){
  
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_populacao' %out% tables){
    statement = readr::read_file('./sql/5_tb_dim_populacao.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_populacao',
    value = df_populacao,
    append = TRUE
  )
  
  
  
}

#DBI::dbSendQuery(conn,'DROP TABLE IF EXISTS tb_populacao')
