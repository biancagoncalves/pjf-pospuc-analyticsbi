fun_data_tb_gestante <- function(conn){
  output = tibble::tibble(
    cs_gestant =c(1,
              2,
              3,
              4,
              5,
              6,
              9),
    cs_gestant_name=c(
      "1o Trimestre",
      "2o Trimestre",
      "3o Trimestre",
      "Idade gestacional ignorada" ,
      "Não",
      "Não se aplica",
      "Ignorado"
    )
  )
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_gestante' %out% tables){
    statement = readr::read_file('./sql/12_tb_dim_gestante.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_gestante',
    value = output,
    append = TRUE
  )
  
}



