fun_data_tb_location = function(df_location,conn){
  
  
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_location' %out% tables){
    statement = readr::read_file('./sql/3_tb_dim_location.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_location',
    value = df_location,
    append = TRUE
  )
  
  
  
}

# DBI::dbSendQuery(conn,'DROP TABLE IF EXISTS tb_tuberculose')
# DBI::dbSendQuery(conn,'DROP TABLE IF EXISTS tb_location')
