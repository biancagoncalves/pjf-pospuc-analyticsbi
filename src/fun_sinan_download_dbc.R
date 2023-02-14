fun_sinan_download_dbc <- function(file,url){
  
  url = paste0(url,file)
  usethis::ui_line(
    paste(
      Sys.time(),
      crayon::bold(crayon::green(file)),   
      sep = ' > '
    )
  )
    
    
  file_name_rds = stringr::str_replace(file,'.dbc','.rds')
  save_fn =  glue::glue('./data/raw/{file_name_rds}')
   tryCatch({
      dest_file = paste0(tempfile(),'.dbc')
      download.file(url,dest_file,quiet = TRUE)
      dados =  read.dbc::read.dbc(dest_file)
      file.remove(dest_file)
      dados %>% saveRDS(save_fn, compress = 'bzip2')
    },
    error = function(e){print(e)}
    )

  
  
}
