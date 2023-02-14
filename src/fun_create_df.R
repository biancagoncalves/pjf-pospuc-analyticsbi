fun_create_df <- function(tables_meta,df_raw){
  
  assertthat::assert_that(is.list(tables_meta))
  skip_tables = c(
    "location","populacao_municipio_ibge","setor_movimentacao_caged")
  
  output = purrr::map(
    .x = tables_meta,
    .f = ~{
      if(!(names(.x) %in% skip_tables)){
        
       
        
      }
      
          
    }
  )
  
  
  
}
