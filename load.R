library(tidyverse)

purposes_raw <- read_csv("data/purposes.csv")

purposes <- purposes_raw %>%
  filter(! is.na(text)) %>%
  mutate(text = str_split(text, "\\(?[a-z0-9]{1}\\)")) %>%
  unnest(cols = c(text)) %>%
  mutate(text = trimws(text)) %>%
  group_by(university, year, section) %>%
  mutate(subsection = row_number()) %>%
  ungroup() %>%
  select(university:section, subsection, text)

purposes %>% write_csv("data/out/purpose_clauses.csv")
