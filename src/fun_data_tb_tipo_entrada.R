fun_data_tb_tipo_entrada <- function(conn){
  output = tibble::tibble(
    tratamento =c(1,
                  2,
                  3,
                  4,
                  5,
                  6),
    tratamento_name=c(
      "Caso novo"
      ,"Recidiva"
      ,"Reingresso após abandono"
      ,"Não sabe"
      ,"Transferência"
      ,"Pós óbito"
    )
  )
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_tipo_entrada' %out% tables){
    statement = readr::read_file('./sql/14_tb_dim_tipo_entrada.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_tipo_entrada',
    value = output,
    append = TRUE
  )
  
}


