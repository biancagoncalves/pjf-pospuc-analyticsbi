fun_data_tb_situacao_encerramento <- function(conn){
  output = tibble::tibble(
    situa_ence =c(1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                  8,
                  9,
                  10),
    situa_ence_name=c(
      "Cura"
      ,"Abandono"
      ,"Óbito por TB"
      ,"Óbito por outras causas"
      ,"Transferência"
      ,"Mudança de Diagnóstico"
      ,"TB-DR"
      ,"Mudança de esquema"
      ,"Falência"
      ,"Abandono Primário"
    )
  )
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_situacao_encerramento' %out% tables){
    statement = readr::read_file('./sql/16_tb_dim_situacao_encerramento.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_situacao_encerramento',
    value = output,
    append = TRUE
  )
  
}


