source("load.R")
source("lib/similarity.R")

library(lubridate)
library(tidytext)
library(exploratory)
library(SnowballC)

data("stop_words")
stop_words <- stop_words

purposes_to_compare <- purposes %>%
  mutate(id = paste(university, section, subsection, sep = "-"))

target_ids <- analyse_statement_similarity(
  statements = purposes_to_compare,
  similarity_threshold = 0.75
) %>% extract2("above_threshold_ids")
