fun_create_connection <- function(){
   readRenviron(".env")
   conn = tryCatch(
    {
       DBI::dbConnect(
          drv=RPostgres::Postgres(),
          host=Sys.getenv('HOST'),
          db= Sys.getenv('DB'),
          port=Sys.getenv('PORT'),
          user=Sys.getenv('USER'),
          password = Sys.getenv('PASS')
      )
    },
    error = function(e){
      return('Não foi possível conectar!')
     }
    )
  return(conn)
   
}
