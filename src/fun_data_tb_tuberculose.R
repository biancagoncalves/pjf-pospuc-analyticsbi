fun_data_tb_tuberculose <- function(df_raw,conn){
  require(digest)
  require(dplyr)
  
  
  df_ocupacao = readr::read_csv('./data/lista_cbo.csv') |> 
    dplyr::filter(tipo == 'Ocupação') |> 
    dplyr::mutate(
      codigo = stringr::str_replace(codigo,'-','')
    ) |> 
    dplyr::distinct(codigo,.keep_all=TRUE)
  
 hashs = uuid::UUIDgenerate(n = nrow(df_raw))
 output = df_raw |> 
   dplyr::mutate(hash = hashs) |> 
   dplyr::select(c('hash', dplyr::everything()))
  
  tables = DBI::dbListTables(conn)
  
  output = output |> 
    janitor::clean_names() %>% 
    dplyr::mutate(
      cs_raca = stringr::str_replace(cs_raca,'0',NA_character_),
      raiox_tora = stringr::str_replace(raiox_tora,'9',NA_character_),
      cs_escol_n = stringr::str_replace(cs_escol_n,'0',NA_character_),
      nu_idade_n = as.numeric(nu_idade_n),
      cs_sexo   = as.character(cs_sexo),
      id_ocupa_n = as.numeric(id_ocupa_n),
      cs_gestant = as.numeric(cs_gestant),
      tp_not    = as.numeric(tp_not),
      cs_raca   = as.numeric(cs_raca),
      cs_escol_n = as.numeric(cs_escol_n),
      id_municip = as.numeric(id_municip),
      id_mn_resi = as.numeric(id_mn_resi),
      dt_notific= as.Date(dt_notific),
      raiox_tora= as.numeric(raiox_tora),
      teste_tube= as.numeric(teste_tube),
      forma     = as.numeric(forma),
      sg_uf_at  = as.numeric(sg_uf_at),
      transf    = as.numeric(transf),
      uf_transf  = as.numeric(uf_transf),
      mun_transf = as.numeric(mun_transf),
      hiv       = as.numeric(hiv),
      test_sensi= as.numeric(test_sensi),
      nchar =  stringr::str_length(id_municip)
    ) |> 
    dplyr::mutate(
      id_municip = ifelse(stringr::str_length(id_municip)<5,NA,id_municip),
      id_mn_resi = ifelse(stringr::str_length(id_mn_resi)<5,NA,id_mn_resi)
     
    ) |> 
    dplyr::select(-nchar)
  
  output  = output %>% 
    dplyr::left_join(
      df_municipio_final %>% dplyr::select(codigo_ibge,nome) %>% 
        dplyr::mutate(codigo_ibge = as.numeric(codigo_ibge)),
      by = c('id_municip'='codigo_ibge')
    ) %>% 
    dplyr::filter(!is.na(nome)) %>% 
    dplyr::select(-nome)
  
  output  = output %>% 
    dplyr::select(-nome) %>% 
    dplyr::left_join(
      df_municipio_final %>% dplyr::select(codigo_ibge,nome) %>% 
        dplyr::mutate(codigo_ibge = as.numeric(codigo_ibge)),
      by = c('id_mn_resi'='codigo_ibge')
    ) %>% 
    dplyr::filter(!is.na(nome)) %>% 
    dplyr::select(-nome)
  
  
  
  output = output |> 
    dplyr::filter(
      id_ocupa_n %in% c(df_ocupacao$codigo,NA)
    ) 
    
  output = output |> 
      dplyr::select(
        dplyr::all_of(c(
          'hash',
          "nu_idade_n",
          "cs_sexo",
          "id_ocupa_n",
          "cs_gestant",
          "tp_not",
          "cs_raca",
          "cs_escol_n",
          "id_municip",
          "id_mn_resi",
          "dt_notific",
          "raiox_tora",
          "teste_tube",
          "forma",
          "sg_uf_at",
          "transf",
          "uf_transf",
          "mun_transf",
          "hiv",
          "test_sensi",
          "sg_uf_not",
          "sg_uf",
          "dt_transus",
          "tratamento",
          "agravaids",
          "agravalcoo",
          "agravdiabe",
          "agravdoenc",
          "agravoutra",
          "agravdroga",
          "agravtabac",
          "bacilosc_e",
          "cultura_es",
          "test_molec",
          "tratsup_at",
          "nu_contato",
          "nu_comu_ex",
          "ant_retro",
          "bacilosc_1",
          "bacilosc_2",
          "bacilosc_3",
          "bacilosc_4",
          "bacilosc_5",
          "bacilosc_6",
          "bac_apos_6",
          "situa_ence",
          "dt_inic_tr"
        )
        )
      )
  
 
    # output = output |> 
    #   dplyr::mutate(
    #     test_sensi = dplyr::case_when(
    #       test_sensi %in% c(1,2,3,4,5,6,7,8,9,10) ~ test_sensi
    #     ),
    #     transf = dplyr::case_when(
    #       transf %in% c(1,2,3,4,5,6,9) ~ transf
    #     ),
    #   )
    # 
  
  if('tb_fact_tuberculose' %out% tables){
    statement = readr::read_file('./sql/17_tb_fact_tuberculose.sql')
    DBI::dbSendQuery(conn,statement=statement)
  }
  
  DBI::dbWriteTable(
    conn,
    name = 'tb_fact_tuberculose',
    value = output,
    append = TRUE
  )
  
  
  
}

#glimpse(output)

#output$cs_raca |> as.numeric()

#DBI::dbSendQuery(conn,'DROP TABLE IF EXISTS tb_tuberculose')

# purrr::walk(
#   .x = DBI::dbListTables(conn),
#   .f=~{
#     statement = glue::glue("DROP TABLE IF EXISTS {.x}")
#     DBI::dbSendQuery(conn, statement)
#   }
# )
# 
# 
# DBI::dbListTables(conn)


