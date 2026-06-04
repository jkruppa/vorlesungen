pacman::p_load(tidyverse, readxl, writexl, conflicted)

## small dataset
jumplength_bloodmeal_tbl <- read_excel("~/work/GitHub/vorlesungen/Allgemeine Daten/covariate/flea_jumplength_bloodmeal_raw.xlsx", range = "A1:E15")

jumplength_bloodmeal_tbl |> 
  sample_frac() |> 
  mutate(fid = 1:14,
         bodyweight = round(bodyweight, 1)) |> 
  select(-satisfaction) |> 
  write_xlsx("~/work/GitHub/vorlesungen/Allgemeine Daten/covariate/flea_jumplength_bloodmeal_n14.xlsx")

## full data set
jumplength_bloodmeal_tbl <- read_excel("~/work/GitHub/vorlesungen/Allgemeine Daten/covariate/flea_jumplength_bloodmeal_raw.xlsx", range = "A1:E22")

jumplength_bloodmeal_tbl |> 
  sample_frac() |> 
  mutate(fid = 1:21,
         bodyweight = round(bodyweight, 1)) |> 
  select(-satisfaction) |> 
  write_xlsx("~/work/GitHub/vorlesungen/Allgemeine Daten/covariate/flea_jumplength_bloodmeal_n21.xlsx")

jumplength_bloodmeal_tbl |> 
  sample_frac() |> 
  mutate(fid = 1:21,
         bodyweight = round(bodyweight, 1)) |> 
  mutate(satisfaction = case_when(bloodmeal < 4 ~ "hungry",
                                  bloodmeal >= 4 & bloodmeal < 8 ~ "full",
                                  bloodmeal >= 8 ~ "overeat"))
