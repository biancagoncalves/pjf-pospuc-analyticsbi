fun_data_tb_setor_movimentacao_caged <- function(conn){
  
  df_ocupacao = readr::read_csv('./data/lista_cbo.csv') |> 
    dplyr::filter(tipo == 'Ocupação') |> 
    dplyr::mutate(
      codigo = stringr::str_replace(codigo,'-','')
    ) |> 
    dplyr::distinct(codigo,.keep_all=TRUE)
  
  df_movimentacao = readRDS('./data/df_movimentacao_caged.rds') |> 
    dplyr::rename('codigo_cbo' = 'cbo_2002_ocupacao') |> 
    dplyr::distinct(ano_declarado,codigo_cbo,.keep_all=TRUE)  |> 
    dplyr::filter(codigo_cbo %in% df_ocupacao$codigo)
   
  
  tables = DBI::dbListTables(conn)
  
  if('tb_cbo_movimentacao_caged' %out% tables){
    statement = readr::read_file('./sql/8_tb_setor_movimentacao_caged.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_cbo_movimentacao_caged',
    value = df_movimentacao,
    append = TRUE
  )
  
  
}
# 
# 
# DBI::dbListFields(conn,'tb_cbo_movimentacao_caged')
# DBI::dbSendQuery(conn,'DROP TABLE IF EXISTS tb_cbo_movimentacao_caged')
# DBI::dbGetQuery(conn,'select * from tb_ocupacao_economica')
# 
# 
# library(tabulizer)
