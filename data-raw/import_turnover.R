## code to prepare `turnover` dataset goes here

library(readr)
library(tidyverse)

turnover <- read_csv("inst/Case_Turnover_v2.csv") %>%
  mutate(
    across(where(~n_distinct(.) <= 5), as.character),
    desligado = if_else(desligado == 0, "não", "sim"),
    licenca_medica = if_else(licenca_medica == 0, "não licenciado", "licenciado"),
    promocao_ultimos_3_anos = if_else(promocao_ultimos_3_anos == 0, "não promovido", "promovido")
  )

usethis::use_data(turnover, overwrite = TRUE)
