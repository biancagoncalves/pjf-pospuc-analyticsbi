## DATASus Sinan



## Variáveis - dicionário


- *TP_NOT* (tipo de notificação): 
  - 1: negativo
  - 2: individual
  - 3: surto
  - 4: agregado
- *ID_AGRAVO* (agravo): 
- *DT_NOTIFIC* (data da notificação)
- *NU_ANO* (ano da notificação)
- *SG_UF_NOT* (UF da notificação)
- *ID_MUNICIP* (Municipio da notificação)
- *ID_REGIONA* (campo interno)
- *DT_DIAG* (data do diagnóstico)
- *NU_IDADE_N* (idade), se o campo <4007 (7 anos), campo escolaridade é preenchido
com 10 - não se aplica. Para Rubéola congˆ´nita, idade máxima é 2 anos. Para Sífilis Congênita e AIDS Criança, idade máxima é 12 anos;
  - dígito 1: hora
  - dígito 2: dia
  - dígito 3: mes
  - dígito 4: ano
  - Exemplo: 3009 - nove meses, 4018 dezoito anos.
- *CS_SEXO* (sexo), M masculino, F feminino e I ignorado
- *CS_GESTANT* (gestante), campo obrigatório para mulheres
  - 1 indica primeiro trimestre
  - 2 indica segundo trimestre
  - 3 indica terceiro trimestre
  - 4 indica idade gestacional ignorada
  - 5 indica não
  - 6 indica não se aplica
  - 9 indica ignorado
- *CS_RACA* (raça/cor)
  - 1 branca
  - 2 preta
  - 3 amarela
  - 4 parda
  - 5 indígena
  - 9 ignorado
- *CS_ESCOL_N* (escolaridade)
  - 43: analfabeto
  - 1: de 1 a 4 série incompleta do EF
  - 2: 4 serie completa do EF (antigo primeiro grua)
  - 3: 5 a 8 serie incompleta do EF
  - 4: ensino fundamental completo
  - 5: ensino médio incompleto
  - 6: ensino médio completo
  - 7: educação superior incompleta
  - 8: educacao superior completa
  - 9: ignorado
  - 10: Não se aplica
- *SG_UF* (UF)
- *ID_MN_RESI* (município de residência)
- *ID_RG_RESI* (Uf de residência)
- *ID_PAIS* (pais se residente fora do Brasil)
- *NDUPLIC_N* (não contar)
 - 0 ou branco - não identicado
 - 1 não é duplicade
 - 2 duplicidade (não contar)
- *IN_VINCULA* (vinculação) , indica se a notificação foi vinculada
  - 0 não vinculada
  - 1 vinculada
- *MIGRADO_W* (identifica migração) inútil
- *ID_OCUPA_N* (Ocupação/ Ramo de Atividade Econômica) - CBO
- *TRATAMENTO* (data do inicio do tratamento)
- *INSTITUCIO*
- *RAIOX_TORA* (radiografia do torax)
  - 1: suspeito
  - 2: normal
  - 3: outra patologia
  - 4: não realizado
  
- *TESTE_TUBE*
- *FORMA* (forma)
  - 1: pulmonar
  - 2: extrapulmonar
  - 3: pulmonar + extrapulmonar
  - Se Forma= 1, o campo 36 (Se Extrapulmonar) não será habilitado e o cursor pula para item 37; Se Forma= 2 ou 3, o campo 36 (Se Extrapulmonar) é de preenchimento obrigatório; Quando Forma=2 os campos 58 (Baciloscopia no 1º, 2º, 3º, 4º, 5º, 6º e após 6º mês) preenchidos automaticamente com a opção 4 (Não se aplica)
- *EXTRAPU_N*:
  - 1. Pleural
  - 2. Gang. Perif.
  - 3. Geniturinária
  - 4. Óssea
  - 5. Ocular
  - 6. Miliar
  - 7. Meningoencefálico
  - 8. Cutânea
  - 9. Laringea
  - 10. Outra
- *EXTRAPU1_N*
- *EXTRAPU2_N*
- *EXTRAPUL_O* (Se extrapulmonar Outras especificar)
- *AGRAVAIDS* (doenças e agravos associados a AIDS)
  - 1 sim
  - 2 nao
  - 9 ignorado
- *AGRAVALCOO* (Doenças e agravos associados Alcoolismo)
  - 1 sim
  - 2 nao
  - 9 ignorado
- *AGRAVDIABE* (Doenças e agravos associados Diabetes)
  - 1 sim
  - 2 nao
  - 9 ignorado
- *AGRAVDOENC* (Doenças e agravos associados Doença Mental)
  - 1 sim
  - 2 nao
  - 9 ignorado
- *AGRAVOUTRA* (Doenças e agravos associados Outras)
  - 1 sim
  - 2 nao
  - 9 ignorado
- *AGRAVOUTDE* (especificar)
- *BACILOSC_E* ( Baciloscopia de escarro (diagnóstico))
  - 1. Positiva
  - 2. Negativa
  - 3. Não realizada
  - 4. Não se aplica
- *BACILOS_E2*
- *BACILOSC_O*
- *CULTURA_ES* (resultado da cultura de escarro ou outro material realizada para tuberculose)
  - 1 positiva
  - 2 negativa
  - 3 em andamento
  - 4 nao realizada
- *CULTURA_OU*
- *HIV*
  - 1. Positivo
  - 2. Negativo
  - 3. Em andamento
  - 4. Não realizado
- *HISTOPATOL* (Histopatologia)
  - 1. Baar Positivo
  - 2. Sugestivo de TB
  - 3. Não sugestivo de
  - TB
  - 4. Em andamento
  - 5. Não realizado
- *DT_INIC_TR* (data de incio do tratamento atual)
- *RIFAMPICIN*
- *ETAMBUTOL*
- *ESTREPTOMI*
- *PIRAZINAMI*
- *ETIONAMIDA*
- *OUTRAS*
- *OUTRAS_DES*
- *TRAT_SUPER*
- *NU_CONTATO*
- *SG_UF_AT* (uf de notificação atual)
- *ID_MUNIC_A* (municipio de notificação atual)
- *SG_UF_2* (uf de residência atual)
- *ID_MUNIC_2* (municipio de residência atual)
- *BACILOSC_1* ( Baciloscopia no 1º mês)
  - 1. Positiva
  - 2. Negativa
  - 3. Não realizada
  - 4. Não se aplica
- *BACILOSC_2* ( Baciloscopia no 1º mês)
  - 1. Positiva
  - 2. Negativa
  - 3. Não realizada
  - 4. Não se aplica
- *BACILOSC_3* ( Baciloscopia no 1º mês)
  - 1. Positiva
  - 2. Negativa
  - 3. Não realizada
  - 4. Não se aplica
- *BACILOSC_4* ( Baciloscopia no 1º mês)
  - 1. Positiva
  - 2. Negativa
  - 3. Não realizada
  - 4. Não se aplica
- *BACILOSC_5* ( Baciloscopia no 1º mês)
  - 1. Positiva
  - 2. Negativa
  - 3. Não realizada
  - 4. Não se aplica
- *BACILOSC_6* ( Baciloscopia no 1º mês)
  - 1. Positiva
  - 2. Negativa
  - 3. Não realizada
  - 4. Não se aplica
- *TRATSUP_AT* (Tratamento Diretamente Observado (TDO) realizado)
  - 1. Sim
  - 2. Não
  - 9. Ignorado
- *DT_MUDANCA*
- *TPUNINOT*
- *POP_LIBER* ( Populações Especiais População privada de liberdade)
  - 1. Sim
  - 2. Não
  - 9. Ignorado
- *POP_RUA* (Populações Especiais População em situação de rua)
  - 1. Sim
  - 2. Não
  - 9. Ignorado
- *POP_SAUDE* (Populações Especiais Profissional de saúde)  
  - 1. Sim
  - 2. Não
  - 9. Ignorado
- *POP_IMIG* (Populações Especiais Imigrante) sendo considerado imigrante no Brasil com residência menor que 2 anos
  - 1. Sim
  - 2. Não
  - 9. Ignorado
- *BENEF_GOV* ( Beneficiário de programa de transferência de renda do governo)
  - 1. Sim 
  - 2. Não
  - 9. Ignorado
- *AGRAVDROGA* (Doenças e agravos associados Uso de drogas ilícitas)
  - 1. Sim 
  - 2. Não
  - 9. Ignorado
- *AGRAVTABAC* (Doenças e agravos associados Tabagismo)
  - 1. Sim 
  - 2. Não
  - 9. Ignorado
- *TEST_MOLEC* (Teste Molecular Rápido TB (TMR-TB) t)
  - 1. Detectável sensível à Rifampicina
  - 2. Detectável resistente à Rifampicina
  - 3. Não detectável
  - 4. Inconclusivo
  - 5. Não realizado
- *TEST_SENSI* (Teste de Sensibilidade )
  - 1. Resistente somente à Isoniazida
  - 2. Resistente somente à Rifampicina
  - 3. Resistente à Isoniazida e Rifampicina
  - 4. Resistente a outras drogas de 1ª linha
  - 5. Sensível
  - 6. Em andamento
  - 7. Não realizado
- *ANT_RETRO* Terapia Antirretroviral durante o tratamento para a TB:
  - 1. Sim
  - 2. Não
  - 9. Ignorado
- *BAC_APOS_6*
- *TRANSF* (Se transferência)
  - 1. Mesmo município
  - 2. Município diferente (mesma UF)
  - 3. UF diferente
  - 4. País diferente
  - 9. Ignorado
- *UF_TRANSF* (UF de Transferência (destino do paciente))
- *MUN_TRANSF* (Município de Transferência (destino do paciente))

  


## Fato

A tabela fato apresenta informações básicas sobre o paciente relacionado a tuberculose.


## Dimensões

Abaixo estão as dimensões: 




https://github.com/datasets-br/cbo/blob/master/data/lista.csv


