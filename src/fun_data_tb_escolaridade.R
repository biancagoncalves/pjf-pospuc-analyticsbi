fun_data_tb_escolaridade <- function(conn){
  output = tibble::tibble(
    cs_escol_n =c(1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                  8,
                  9,
                  10),
    cs_escol_n_name=c(
      "1a a 4a série incompleta do EF"
      ,"4a série completa do EF (antigo 1° grau)"
      ,"5a à 8a série incompleta do EF (antigo ginásio ou 1° grau)"
      ,"Ensino fundamental completo (antigo ginásio ou 1° grau)"
      ,"Ensino médio incompleto (antigo colegial ou 2° grau)"
      ,"Ensino médio completo (antigo colegial ou 2° grau)"
      ,"Educação superior incompleta"
      ,"Educação superior completa"
      ,"Ignorado"
      ,"Não se aplica"
    )
  )
  tables = DBI::dbListTables(conn)
  
  if('tb_dim_escolaridade' %out% tables){
    statement = readr::read_file('./sql/13_tb_dim_escolaridade.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_dim_escolaridade',
    value = output,
    append = TRUE
  )
  
}

 
 