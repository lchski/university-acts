source("load.R")
source("lib/similarity.R")

library(lubridate)
library(tidytext)
library(exploratory)
library(SnowballC)

data("stop_words")
stop_words <- stop_words

purposes_to_compare <- purposes %>%
  mutate(id = paste(university, year, section, subsection, sep = "-"))

compared_purposes <- analyse_statement_similarity(
  statements = purposes_to_compare,
  similarity_threshold = 0.75
)

## Compare text of similar statements
compared_purposes$above_threshold %>%
  left_join(purposes_to_compare %>%
              select(id, text), by = c("id.x" = "id")
            ) %>%
  rename(text.x = text) %>%
  left_join(purposes_to_compare %>%
              select(id, text), by = c("id.y" = "id")
            ) %>%
  rename(text.y = text) %>%
  View()

## Compare similar statements from the same institution
compared_purposes$above_threshold %>%
  left_join(purposes_to_compare %>%
              select(id, text, university), by = c("id.x" = "id")
  ) %>%
  rename(text.x = text, university.x = university) %>%
  left_join(purposes_to_compare %>%
              select(id, text, university), by = c("id.y" = "id")
  ) %>%
  rename(text.y = text, university.y = university) %>%
  filter(university.x == university.y) %>%
  View()
