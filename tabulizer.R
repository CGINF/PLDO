path_pdf_tabulizer <- "https://www.gov.br/economia/pt-br/assuntos/planejamento-e-orcamento/orcamento/orcamentos-anuais/2023/pldo/4.6.Anexo_IV.6___Projecoes_Atuariais_do_RPPS.pdf"
browseURL(path_pdf_tabulizer)

tabela_pagina1 <- tabulizer::extract_tables(
  path_pdf_tabulizer, 
  pages = 17, 
  method = "stream", # existem 2, tente os dois para ver qual funciona melhor
  output = "data.frame"
)

names <-c("Grupo" ,"Descrição", 'Masculino', "Feminino" ,'Geral')

exe_22 <- tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Executivo") 

les_22 <-   tabela_pagina1[[2]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Legislativo")

jud_22 <-   tabela_pagina1[[3]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Judiciário")

# primeira pagina pldo 2023

pldo_23_01 <- dplyr::bind_rows(exe_22, les_22, jud_22)  
readr::write_csv2(pldo_23_01, "../PLDO/Anexo 4.6/pldo_23_01.csv") # salvando
 
tabela_pagina2 <- tabulizer::extract_tables(
  path_pdf_tabulizer, 
  pages = 18, 
  method = "stream", # existem 2, tente os dois para ver qual funciona melhor
  output = "data.frame"
)

jud_22 <-   tabela_pagina2[[2]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Ministério Público")

readr::write_csv2(jud_22, "../PLDO/Anexo 4.6/pldo_23_02.csv") # salvando


# 2022 --------------------------------------------------------------------


path_pdf_tabulizer <- "https://www.gov.br/economia/pt-br/assuntos/planejamento-e-orcamento/orcamento/orcamentos-anuais/2022/copy_of_pldo/Anexo_IV.6___Projecoes_Atuariais_do_RPPS.pdf"
browseURL(path_pdf_tabulizer)

tabela_pagina1 <- tabulizer::extract_tables(
  path_pdf_tabulizer, 
  pages = 18, 
  method = "stream", # existem 2, tente os dois para ver qual funciona melhor
  output = "data.frame"
)

exe_22 <- tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Executivo") 

les_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Legislativo")

jud_22 <-   tabela_pagina1[[2]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Judiciário")

mp_22 <-   tabela_pagina1[[3]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Ministério Público")


pldo_22_01 <- dplyr::bind_rows(exe_22, les_22, jud_22, mp_22)  
readr::write_csv2(pldo_22_01, "../PLDO/Anexo 4.6/pldo_22_01.csv") # salvando

pldo_22_01 |> mutate(
  Masculino = readr::parse_number(`Descrição Masculino`)
)



# 2021 --------------------------------------------------------------------


path_pdf_tabulizer <- "https://www.gov.br/economia/pt-br/assuntos/planejamento-e-orcamento/orcamento/orcamentos-anuais/2021/pldo/anexo-iv-6-avaliacao-atuarial-do-regime-proprio-de-previdencia-social-dos-servidores-civis-2.pdf"
browseURL(path_pdf_tabulizer)

tabela_pagina1 <- tabulizer::extract_tables(
  path_pdf_tabulizer, 
  pages = 6, 
  method = "stream", # existem 2, tente os dois para ver qual funciona melhor
  output = "data.frame"
)

exe_22 <- tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Executivo") 

readr::write_csv2(exe_22,  "../PLDO/Anexo 4.6/pldo_21_02.csv") # salvando

exe_22 <- tabela_pagina1[[1]] |>
  tibble::as_tibble() 


les_22 <-   tabela_pagina1[[2]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Legislativo")

jud_22 <-   tabela_pagina1[[3]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Judiciário")

mp_22 <-   tabela_pagina1[[4]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Ministério Público")


pldo_21_03 <- dplyr::bind_rows(les_22, jud_22, mp_22)  
readr::write_csv2(pldo_21_03, "../PLDO/Anexo 4.6/pldo_21_03.csv") # salvando

pldo_22_01 |> mutate(
  Masculino = readr::parse_number(`Descrição Masculino`)
)


# 2020 --------------------------------------------------------------------

path_pdf_tabulizer <- "https://www.gov.br/economia/pt-br/assuntos/planejamento-e-orcamento/orcamento/orcamentos-anuais/2020/arquivos/anexo-iv-6-avaliacao-atuarial-do-rpps.pdf"
browseURL(path_pdf_tabulizer)

tabela_pagina1 <- tabulizer::extract_tables(
  path_pdf_tabulizer, 
  pages = 14, 
  method = "stream", # existem 2, tente os dois para ver qual funciona melhor
  output = "data.frame"
)

exe_22 <- tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Executivo") 

#readr::write_csv2(exe_22,  "../PLDO/Anexo 4.6/pldo_21_02.csv") # salvando

#exe_22 <- tabela_pagina1[[1]] |>
  tibble::as_tibble() 


les_22 <-   tabela_pagina1[[2]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Legislativo")

jud_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Judiciário")

mp_22 <-   tabela_pagina1[[2]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Ministério Público")


pldo_20_01 <- dplyr::bind_rows(exe_22,les_22, jud_22, mp_22)  
readr::write_csv2(pldo_20_01, "../PLDO/Anexo 4.6/pldo_20_01.csv") # salvando

pldo_22_01 |> mutate(
  Masculino = readr::parse_number(`Descrição Masculino`)
)


# 2019 --------------------------------------------------------------------


# WORD
path_pdf_tabulizer <- ""
browseURL(path_pdf_tabulizer)

tabela_pagina1 <- tabulizer::extract_tables(
  path_pdf_tabulizer, 
  pages = 14, 
  method = "stream", # existem 2, tente os dois para ver qual funciona melhor
  output = "data.frame"
)

exe_22 <- tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Executivo") 

#readr::write_csv2(exe_22,  "../PLDO/Anexo 4.6/pldo_21_02.csv") # salvando

#exe_22 <- tabela_pagina1[[1]] |>
tibble::as_tibble() 


les_22 <-   tabela_pagina1[[2]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Legislativo")

jud_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Judiciário")

mp_22 <-   tabela_pagina1[[2]] |>
  tibble::as_tibble() |>  janitor::row_to_names(1) |> 
  mutate(Poder = "Ministério Público")


pldo_20_01 <- dplyr::bind_rows(exe_22,les_22, jud_22, mp_22)  
readr::write_csv2(pldo_20_01, "../PLDO/Anexo 4.6/pldo_20_01.csv") # salvando

pldo_22_01 |> mutate(
  Masculino = readr::parse_number(`Descrição Masculino`)
)


# 2018 --------------------------------------------------------------------

path_pdf_tabulizer <- "https://www.gov.br/economia/pt-br/assuntos/planejamento/orcamento/orcamentos-anuais/2018/pldo-2018/anexo-iv-7-avaliacao-atuarial-do-regime-proprio-de-previdencia-social-dos-servidores-civis.pdf"
browseURL(path_pdf_tabulizer)

tabela_pagina1 <- tabulizer::extract_tables(
  path_pdf_tabulizer, 
  pages = 14, 
  method = "stream", # existem 2, tente os dois para ver qual funciona melhor
  output = "data.frame"
)

exe_22 <- tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Executivo") 

#readr::write_csv2(exe_22,  "../PLDO/Anexo 4.6/pldo_21_02.csv") # salvando

#exe_22 <- tabela_pagina1[[1]] |>
tibble::as_tibble() 


les_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Legislativo")

jud_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Judiciário")

mp_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Ministério Público")


pldo_18_01 <- dplyr::bind_rows(exe_22,les_22, jud_22, mp_22)  
readr::write_csv2(pldo_18_01, "../PLDO/Anexo 4.6/pldo_18_01.csv") # salvando

pldo_22_01 |> mutate(
  Masculino = readr::parse_number(`Descrição Masculino`)
)


# 2017 --------------------------------------------------------------------


path_pdf_tabulizer <- "https://www.gov.br/economia/pt-br/assuntos/planejamento/orcamento/orcamentos-anuais/2017/pldo/anexo-iv-7-avaliacao-atuarial-do-rpps.pdf"
browseURL(path_pdf_tabulizer)

tabela_pagina1 <- tabulizer::extract_tables(
  path_pdf_tabulizer, 
  pages = 7, 
  method = "lattice", # existem 2, tente os dois para ver qual funciona melhor
  output = "data.frame"
)

exe_22 <- tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Executivo") 

#readr::write_csv2(exe_22,  "../PLDO/Anexo 4.6/pldo_21_02.csv") # salvando

#exe_22 <- tabela_pagina1[[1]] |>
tibble::as_tibble() 


les_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Legislativo")

jud_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Judiciário")

mp_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Ministério Público")


pldo_17_01 <- dplyr::bind_rows(exe_22,les_22, jud_22, mp_22)  
readr::write_csv2(pldo_17_01, "../PLDO/Anexo 4.6/pldo_17_01.csv") # salvando

pldo_22_01 |> mutate(
  Masculino = readr::parse_number(`Descrição Masculino`)
)


# 2016 --------------------------------------------------------------------

path_pdf_tabulizer <- "https://www.gov.br/economia/pt-br/assuntos/planejamento/orcamento/orcamentos-anuais/2016/pldo/anexoiv7.pdf"
browseURL(path_pdf_tabulizer)

texto_ocr <-pdftools::pdf_ocr_text(path_pdf_tabulizer)
cat(texto_ocr)

tabela_pagina1 <- tabulizer::extract_tables(
  path_pdf_tabulizer, 
  pages = 7, 
  method = "decide", # existem 2, tente os dois para ver qual funciona melhor
  output = "data.frame"
)

exe_22 <- tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Executivo") 

#readr::write_csv2(exe_22,  "../PLDO/Anexo 4.6/pldo_21_02.csv") # salvando

#exe_22 <- tabela_pagina1[[1]] |>
tibble::as_tibble() 


les_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Legislativo")

jud_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Judiciário")

mp_22 <-   tabela_pagina1[[1]] |>
  tibble::as_tibble() |>  janitor::row_to_names(2) |> 
  mutate(Poder = "Ministério Público")


pldo_17_01 <- dplyr::bind_rows(exe_22,les_22, jud_22, mp_22)  
readr::write_csv2(pldo_17_01, "../PLDO/Anexo 4.6/pldo_17_01.csv") # salvando

pldo_22_01 |> mutate(
  Masculino = readr::parse_number(`Descrição Masculino`)
)


# 2015 --------------------------------------------------------------------


path_pdf_tabulizer <- "https://www.gov.br/economia/pt-br/assuntos/planejamento/orcamento/orcamentos-anuais/2015/pldo/anexoiv-6.pdf"
browseURL(path_pdf_tabulizer)

texto_ocr <-pdftools::pdf_ocr_text(path_pdf_tabulizer)
cat(texto_ocr)
