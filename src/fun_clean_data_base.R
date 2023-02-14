fun_clean_data_base <- function(conn){
  
  files = fs::dir_ls(path='./sql/',type = 'file',glob = '*.sql')
  
  tb_files = tibble::tibble(
    order = stringr::str_extract(files,'\\d+') |> as.numeric(),
    file = files
  ) |> 
    dplyr::arrange(order)
  
  purrr::walk(
    .x = tb_files$file,
    .f=~{
      statement = glue::glue("DROP TABLE IF EXISTS {.x}")
      DBI::dbSendQuery(conn,statement)
    }
  )
}