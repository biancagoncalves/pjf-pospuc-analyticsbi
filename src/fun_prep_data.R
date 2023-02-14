fun_prep_data = function(){
  df_final = purrr::map_dfr(
    .x = fs::dir_ls('./data/raw/',type='file',glob='*.rds'),
    .f = ~{
      readRDS(.x) # %>%  fun_prep_sinan() adicionar funcao de tratamento aqui
    }
  ) |> 
    tibble::as_tibble() %>% 
    dplyr::mutate(
      SITUA_ENCE = as.integer(SITUA_ENCE) %>% ifelse(.>10,NA,.),
      SG_UF_NOT = dplyr::case_when(as.character(SG_UF_NOT) == "ES" ~ "32", 
                                   TRUE ~ as.character(SG_UF_NOT)),
      CS_GESTANT = dplyr::case_when(as.character(CS_GESTANT) %in% c(".","9") ~ NA_character_,
                                    TRUE ~ as.character(CS_GESTANT)),
      CS_RACA = dplyr::case_when(as.character(CS_RACA) == "B" ~ "1",
                                 as.character(CS_RACA) == "N" ~ "2",
                                 as.character(CS_RACA) == "A" ~ "3",
                                 as.character(CS_RACA) %in% c("0", "9")  ~ NA_character_,
                                 TRUE ~ as.character(CS_RACA)),
      CS_ESCOL_N = as.integer(as.character(CS_ESCOL_N)) %>% ifelse(.==9,NA,.),
      SG_UF = dplyr::case_when(as.character(SG_UF) == "ES" ~ "32",
                               as.character(SG_UF) == "BA" ~ "29",
                               as.character(SG_UF) == "MG" ~ "31",
                               as.character(SG_UF) == "PR" ~ "41",
                               as.character(SG_UF) == "RJ" ~ "33",
                               as.character(SG_UF) == "SP" ~ "35",
                               as.character(SG_UF) == "AL" ~ "27",
                               as.character(SG_UF) == "DF" ~ "53",
                               as.character(SG_UF) == "9" ~ NA_character_,
                               TRUE ~ as.character(SG_UF)),
      DT_TRANSUS = dplyr::case_when(as.character(DT_TRANSUS) == "1899-12-30" ~ NA_character_,
                                    TRUE ~ as.character(DT_TRANSUS)),
      TRATAMENTO = as.integer(as.character(TRATAMENTO)) %>% ifelse(.==9,NA,.),
      RAIOX_TORA = as.integer(as.character(RAIOX_TORA)) %>% ifelse(.==9,NA,.),
      FORMA = as.integer(as.character(FORMA)) %>% ifelse(.==9,NA,.),
      AGRAVAIDS = as.integer(as.character(AGRAVAIDS)) %>% ifelse(. %in% c(9,3),NA,.),
      AGRAVALCOO = as.integer(as.character(AGRAVALCOO)) %>% ifelse(. %in% c(9,3),NA,.),
      AGRAVDIABE = as.integer(as.character(AGRAVDIABE)) %>% ifelse(. %in% c(9,3),NA,.),
      AGRAVDOENC = as.integer(as.character(AGRAVDOENC)) %>% ifelse(. %in% c(9,3),NA,.),
      AGRAVOUTRA = as.integer(as.character(AGRAVOUTRA)) %>% ifelse(. %in% c(9,3),NA,.),
      AGRAVDROGA = as.integer(as.character(AGRAVDROGA)) %>% ifelse(. %in% c(9,3),NA,.),
      AGRAVTABAC = as.integer(as.character(AGRAVTABAC)) %>% ifelse(. %in% c(9,3),NA,.),
      BACILOSC_E = as.integer(as.character(BACILOSC_E)) %>% ifelse(.>4,NA,.),
      CULTURA_ES = as.integer(as.character(CULTURA_ES)) %>% ifelse(.>4,NA,.),
      HIV = as.integer(as.character(HIV)) %>% ifelse(.>4,NA,.),
      DT_INIC_TR = dplyr::case_when(as.character(DT_INIC_TR) == "1899-12-30" ~ NA_character_,
                                    TRUE ~ as.character(DT_INIC_TR)),
      TEST_MOLEC = as.integer(as.character(TEST_MOLEC)) %>% ifelse(.>5,NA,.),
      TEST_SENSI = as.integer(as.character(TEST_SENSI)) %>% ifelse(.>7|.<1,NA,.),
      TRANSF = as.integer(as.character(TRANSF)) %>% ifelse(.>4|.<1,NA,.),
      TRATSUP_AT = as.integer(as.character(TRATSUP_AT)) %>% ifelse(.>2|.<1,NA,.),
      NU_CONTATO = as.integer(as.character(NU_CONTATO)) %>% ifelse(.==0,NA,.),
      NU_COMU_EX = as.integer(as.character(NU_COMU_EX)) %>% ifelse(.==0,NA,.),
      BACILOSC_1 = as.integer(as.character(BACILOSC_1)) %>% ifelse(.>4,NA,.),
      BACILOSC_2 = as.integer(as.character(BACILOSC_2)) %>% ifelse(.>4,NA,.),
      BACILOSC_3 = as.integer(as.character(BACILOSC_3)) %>% ifelse(.>4,NA,.),
      BACILOSC_4 = as.integer(as.character(BACILOSC_4)) %>% ifelse(.>4,NA,.),
      BACILOSC_5 = as.integer(as.character(BACILOSC_5)) %>% ifelse(.>4,NA,.),
      BACILOSC_6 = as.integer(as.character(BACILOSC_6)) %>% ifelse(.>4,NA,.),
      BAC_APOS_6 = as.integer(as.character(BAC_APOS_6)) %>% ifelse(.>4|.<1,NA,.),
      ANT_RETRO = as.integer(as.character(ANT_RETRO)) %>% ifelse(.>2,NA,.)
    )
  df_final$CS_ESCOL_N %>% unique()
  df_final = df_final |> mutate(across(where(is.factor), as.character)) 
  
  return(df_final)
}