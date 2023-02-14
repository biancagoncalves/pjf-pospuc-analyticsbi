fun_data_tipo_notificacao <- function(conn){
  output = tibble::tibble(
    tp_not =c(1,2,3,4),
    tp_not_name=c(
      "negativo",
      "individual",
      "surto",
      "agregado"
    )
  )
  tables = DBI::dbListTables(conn)
  
  if('tb_tp_not' %out% tables){
    statement = readr::read_file('./sql/11_tb_tp_not.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_tp_not',
    value = output,
    append = TRUE
  )
  
}