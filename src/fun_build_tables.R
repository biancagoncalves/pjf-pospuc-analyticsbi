


fun_build_tables <- function(df_raw){
  
  assertthat::assert_that(is.data.frame(df_raw))
  assertthat::assert_that(nrow(df_raw) > 0)
  
  
  require(rjson)
  require(dplyr)
  
  tables_meta = rjson::fromJSON(file = 'www/variables.json')

  
  df_fact <- df_raw |> 
    janitor::clean_names() %>% 
    dplyr::select(
      dplyr::all_of(tables_meta$fact_variables)
    ) |> janitor::clean_names()
  
  
  # dimensions = tables_meta$dimensions
  # 
  # 
  # dimensaions_tables = purrr::imap(
  #   .x = dimensions,
  #   .f = ~{
  #     table_name = names(.x)
  #     if(!is.list(.x) ){
  #       
  #       matrix(nrow = 1,ncol=length(.x)) |> 
  #         as.data.frame() |> 
  #         setNames(.x) |> 
  #         tibble::as_tibble()
  #       
  #     }else{
  #       
  #       tibble::as_tibble(.x)
  #       
  #     }
  #   }
  # ) |> 
  #   `names<-`(names(dimensions))
  
  output = list(
    fact = df_fact
    #dimensions =  dimensaions_tables
  )
  return(output)
  
}


