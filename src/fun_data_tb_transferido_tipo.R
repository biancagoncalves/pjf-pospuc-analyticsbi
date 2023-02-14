fun_data_tb_transferido_tipo <- function(conn){
  output = tibble::tibble(
    transf_id =c(1,2,3,4,5,6,9),
    transf_name =c(
      "Mesmo município",
      "Município diferente (mesma UF)",
      "UF diferente",
      "País diferente",
      "",
      "",
      "Ignorado"
    )
  )
  
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_transferido_tipo' %out% tables){
    statement = readr::read_file('./sql/10_tb_dim_transferido_tipo.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_transferido_tipo',
    value = output,
    append = TRUE
  )
  
  
  
}

#DBI::dbSendQuery(conn,'DROP TABLE IF EXISTS tb_transferido_tipo')
#DBI::dbSendQuery(conn,'DROP TABLE IF EXISTS tb_tuberculose')

