fun_data_tb_ocupacao_economica <- function(conn){
  
  df_ocupacao = readr::read_csv('./data/lista_cbo.csv') |> 
    dplyr::filter(tipo == 'Ocupação') |> 
    dplyr::mutate(
      codigo = stringr::str_replace(codigo,'-','')
    ) |> 
    dplyr::distinct(codigo,.keep_all=TRUE)
  
  tables = DBI::dbListTables(conn)
  if('tb_dim_ocupacao_economica' %out% tables){
    
    DBI::dbSendQuery(
      conn,
      statement=readr::read_file('./sql/4_tb_dim_ocupacao_economica.sql')
      )
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_ocupacao_economica',
    value = df_ocupacao,
    append = TRUE
  )
  
  
  
  
  
}


# x = DBI::dbGetQuery(conn,'select * from tb_ocupacao_economica')
# nrow(x)
# 
# x |> distinct(codigo,.keep_all=TRUE) |> nrow()
# 
# DBI::dbSendQuery(conn,'DROP TABLE IF EXISTS tb_ocupacao_economica')
# 
# DBI::dbSendQuery(conn,'DROP TABLE IF EXISTS tb_cbo_movimentacao_caged')
