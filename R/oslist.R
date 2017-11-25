library(rvest)
library(dplyr)
library(bubbles)

scraping_wiki <- read_html("https://en.wikipedia.org/wiki/List_of_free_and_open-source_software_packages")

scrapedDataRaw <- scraping_wiki %>%
  html_nodes("li a") %>%
  html_text() %>%
  unique()

scrapedDataClean <- scrapedDataRaw[129:568] %>% as.data.frame()
names(scrapedDataClean) <- "Names"

l <- dim(scrapedDataClean)[1]
with(scrapedDataClean, bubbles(value = runif(l, min = 10, max = 25), label = "",
        color = rainbow(l, alpha=NULL)[sample(l)]
))



