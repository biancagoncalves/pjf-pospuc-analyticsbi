
fun_sinan_links <- function(...){
  
  library(rvest)
  library(httr)
  library(xml2)
  library(stringr)
  output = purrr::map_dfr(
    .x = c(
      'ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/',
      'ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/PRELIM/'
    ),
    .f=~{
      files = .x %>% 
        xml2::read_html() %>% 
        rvest::html_node("body p") %>% 
        rvest::html_text() %>%
        stringr::str_split("\n") %>% unlist() %>% 
        stringr::str_split(" ") %>% unlist()
      
      condition <- files %>% stringr::str_detect(".dbc")
      dbcs <- files[condition] 
      tuberculose_files = tibble::tibble(
        file = dbcs,
        n = stringr::str_extract(dbcs,'\\d+')
      ) %>% 
        dplyr::filter(stringr::str_detect(file,'TUBE')) %>% 
        dplyr::mutate(
          ftp = .x
        )
    }
  )
  return(output)
}