## POLI 30 D
## Lab 08

## Getting started
# Just say "no" to reload R
install.packages(c('tidyverse', 'countrycode',
                   'plotly', 'gapminder',
                   'maptools', 'viridis',
                   'coefplot', 'ggthemes',
                   'maps', 'cluster',
                   'dendextend', 'circlize',
                   'wordcloud2'))
library(tidyverse)
library(countrycode)
library(plotly)
library(gapminder)
library(maptools)
library(viridis)
library(coefplot)
library(ggthemes)
library(maps)
library(cluster)
library(dendextend)
library(circlize)
library(wordcloud2)
educexp <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/educexp.csv")

## Join two datasets
# Creating dat1
PErisk <- read.csv('https://raw.githubusercontent.com/umbertomig/qtm151/main/datasets/PErisk.csv') # or your locale folder
dat1 <- PErisk %>% 
  filter(country %in% PErisk$country[1:5]) %>%
  select(country, courts:prsexp2) %>%
  mutate(barb2 = round(barb2, 2))
dat1
  
# Creating dat2
dat2 <- PErisk %>% 
  filter(country %in% PErisk$country[2:6]) %>%
  select(country, prscorr2, gdpw2) %>%
  mutate(gdpw2 = round(gdpw2, 2))
dat2

# Joining them
full_join(dat1, dat2)


## Maps
# Map prep
qog <- read.csv('https://www.qogdata.pol.gu.se/data/qog_bas_cs_jan23.csv')
world <- map_data("world")

# Gender inequality map
world %>%
  mutate(region = countryname(region)) %>%
  merge(qog %>% select(country = cname, gii_gii) %>%
          mutate(country = countryname(country)), 
        by.x = "region", by.y = "country", all.x = T) %>%
  arrange(group, order) %>%
  ggplot(aes(x = long, y = lat, 
             group = group, fill = gii_gii)) + 
  geom_polygon() + 
  scale_fill_viridis("", na.value = "gray90") +
  theme_map() +
  ggtitle('Gender Inequality Index\n(higher values represent more inequality)')


# Corruption perception map
world %>%
  mutate(region = countryname(region)) %>%
  merge(qog %>% select(country = cname, ti_cpi) %>%
          mutate(country = countryname(country)), 
        by.x = "region", by.y = "country", all.x = T) %>%
  arrange(group, order) %>%
  ggplot(aes(x = long, y = lat, group = group, fill = ti_cpi)) + 
  geom_polygon() + 
  scale_fill_viridis("", na.value = "gray90") +
  theme_map() +
  ggtitle('Corruption Perception Index\n(higher values represent lower corruption)')

## `plotly`
# State per-capita expenditure
p <- ggplot(data = educexp, aes(x = income, y = education)) + 
  #  geom_point(fill = 'lightblue', alpha = 0.4) + 
  geom_text(aes(label=states), size=2) + 
  labs(title = '', 
       y = 'Per-Capita Education Expenditure', 
       x = 'Per-Capita Income') + 
  theme_minimal()
ggplotly(p)

# Life expectancy x gdppc x population (1952 to 2007)
p <- 
  ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, 
                        color = continent)) +
  geom_point(aes(size = pop, frame = year, ids=country)) + 
  scale_x_log10()
ggplotly(p)

## Text-as-data
wordcloud2(demoFreq, size = 0.5)


## Machine Learning
# Machine Learning (weird 2-cluster)
votes.km <- cluster::votes.repub %>%
  select(X1976) %>%
  kmeans(2, nstart=50)
circlize_dendrogram(
  color_labels(hclust(dist(votes.km$cluster)), 
               k=2, col = c("blue3", "red3"))
)


# Machine Learning (hierachical clusters)
cluster::votes.repub %>%
  select(X1976) %>%
  dist(method = "euclidean") %>%
  hclust() %>%
  color_labels(k=7) %>%
  plot()

## Shiny WebApps

# Health Expenditure x Life Expectancy
# https://shiny.rstudio.com/gallery/google-charts.html

# US Zipcode explorer
# https://shiny.rstudio.com/gallery/superzip-example.html

# Wordcloud creator
# https://shiny.rstudio.com/gallery/word-cloud.html

# Bus company simulation game
# https://shiny.rstudio.com/gallery/bus-company-simulation.html

# k-Means clustering (a machine learning technique)
# https://shiny.rstudio.com/gallery/kmeans-example.html

# COVID tracker
# https://vac-lshtm.shinyapps.io

# Data analyzer
# https://vnijs.shinyapps.io/radiant/

## Scrollytells

# Scrollytell on Labor Automation
# https://www.connorrothschild.com/post/automation-scrollytell

# Questions?

# Thank you all for a great quarter!

## End of file