library(rvest)
library(dplyr)

scraping_wiki <- read_html("https://en.wikipedia.org/wiki/List_of_free_and_open-source_software_packages")

scrapedDataRaw <- scraping_wiki %>%
  html_nodes("li a") %>%
  html_text() %>%
  unique()

scrapedDataClean <- scrapedDataRaw[129:568] %>% as.data.frame()



