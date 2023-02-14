require(dplyr)
require(purrr)
require(fs)

fs::dir_ls('./src',type='file',glob = '*.R') |> 
  purrr::walk(~source(.x,encoding='utf-8'))


df_files <-  fun_sinan_links()

if(!fs::dir_exists('./data/raw')){
  fs::dir_create('./data/raw')
}

purrr::walk2(
  .x = df_files$file,
  .y = df_files$ftp,
  .f = fun_sinan_download_dbc
)


# Base final --------------------------------------------------------------

df_final = fun_prep_data()


# Fato e dimensao ---------------------------------------------------------

tables_to_build <- fun_build_tables(df_final)


# Location ----------------------------------------------------------------

df_municipios  = readr::read_csv('./data/municipios.csv')

df_estados = readr::read_csv('./data/estados.csv') |> 
  dplyr::rename(
    'estado' = 'nome',
    'latitude_estado' = 'latitude',
    'longitude_estado' ='longitude' 
  )

df_municipio_final = df_municipios |> 
  dplyr::left_join(df_estados, by = 'codigo_uf') #|> 
  #readr::write_csv('./data/location_table.csv')


df_municipio_final = df_municipio_final |> 
  dplyr::mutate(
    codigo_ibge = stringr::str_extract(codigo_ibge,'\\d{6}')
  )

#tables$fact$id_mn_resi= NA

# Populacao ---------------------------------------------------------------

df_populacao = sidrar::get_sidra(
  api ='/t/6579/n6/all/v/all/p/last%2011'
)
gc()


df_populacao_final = df_populacao |> 
  tibble::as_tibble() |> 
  janitor::clean_names() |> 
  dplyr::select('municipio_codigo','valor','ano') |> 
  dplyr::rename('codigo_ibge'='municipio_codigo') %>% 
  dplyr::mutate(codigo_ibge = stringr::str_extract(codigo_ibge,'\\d{6}'))



# Send to database --------------------------------------------------------

# Build database

conn = fun_create_connection()


fun_data_tb_forma_teste_tuberculose(conn)
fun_data_tb_hiv_tipo(conn)
fun_data_tb_location(df_municipio_final,conn)
fun_data_tb_ocupacao_economica(conn)
fun_data_tb_populacao(df_populacao_final,conn)
fun_data_tb_raca(conn)
fun_data_tb_raiox(conn)
#fun_data_tb_setor_movimentacao_caged(conn)
fun_data_tb_teste_sensibilidade(conn)
fun_data_tb_transferido_tipo(conn)

fun_data_tb_gestante(conn)
fun_data_tb_escolaridade(conn)
fun_data_tb_tipo_entrada(conn)
fun_data_tb_teste_molecular(conn)
fun_data_tb_situacao_encerramento(conn)

#fun_data_tipo_notificacao(conn)

fun_data_tb_tuberculose(df_final,conn)

tables_to_build$fact$id_mn_resi %>% unique()

tables_to_build$fact$cs_escol_n %>% unique()

