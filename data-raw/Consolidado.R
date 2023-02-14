## code to prepare `Consolidado` dataset goes here

library(readr)
dados <- read_delim("Anexo 4.6/pldo_23_01.csv", 
                    delim = ";",
                    escape_double = FALSE, 
                    locale = locale(decimal_mark = ",", 
                                    grouping_mark = "."),
                    trim_ws = TRUE)

readr::write_csv2(dados, "data-raw/dados_consolidados.csv")
