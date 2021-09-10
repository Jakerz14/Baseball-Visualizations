library(tidyverse)
library(ISLR)

countries = read_csv('C:/Users/Jake Reynolds/Documents/countries.csv')

q1_plot = ggplot(countries,
                  aes(x = Personal.computers.per.100.population,
                      y = ..count../sum(..count..)))+
  geom_histogram(fill = 'cyan2',
                 color = 'black',
                 binwidth=5)+
  labs(title = 'Personal Computers per 100 Population',
       x = 'Computers per 100 people',
       y = 'Proportion of Countries')
q1_plot

q2_plot = cut(countries$Personal.computers.per.100.population, 3,
              labels = c('low','medium','high'))

barplot(prop.table(table(q2_plot)),
     main = 'Countries with Low, Medium, or High Amount of Computers per Person',
     col = 'cyan2',
     ylab = 'Count of Countries')

q3_plot = ggplot(data = countries,
                 aes(x = Personal.computers.per.100.population,
                 y = cell.phones.per.100.people)) + 
  geom_point()+
  labs(title = 'Personal Computers Per 100 Population vs. Cell Phones per 100 People',
       x = 'Personal Computers per 100 Population',
       y = 'Cell Phones per 100 People')
q3_plot

q4_plot = ggplot(data = countries, 
                 aes(x = FreedomHousePoliticalRightsandCivilLiberties,
                     y = Personal.computers.per.100.population))+
  geom_point()+
  labs(title = 'Freedom House Political Rights and Civil Liberties vs. Personal 
       Computers per 100 Population',
         x = 'Freedom House Political Rights and Civil Liberties',
         y = 'Personal Computers per 100 Populations')
q4_plot

countries = countries %>% 
  mutate(Personal.computers.per.100.population.categorical = q2_plot)

q5_plot = ggplot(countries, 
                 aes(x = FreedomHousePoliticalRightsandCivilLiberties,
                     y = ..count../sum(..count..)))+
  geom_bar(aes(fill = Personal.computers.per.100.population.categorical))+
  labs(title = 'Relationship between Freedom House Political Rights and Civil Liberties 
       and Low, Medium, or High Concentration of Computers per 100 population',
       x = 'Freedom House Polical Rights and Civil Liberties Category',
       y = 'Percent of Countries',
       fill = 'Concentration of Personal Computers per 100 Population')

q5_plot

q6_plot = ggplot(data = countries,
                 aes(x = Personal.computers.per.100.population,
                     y = cell.phones.per.100.people)) + 
  geom_point(aes(color=FreedomHousePoliticalRightsandCivilLiberties,
                 size = Internet.user.per.100))+
  labs(title = 'Personal Computers Per 100 Population vs. Cell Phones per 100 People',
       x = 'Personal Computers per 100 Population',
       y = 'Cell Phones per 100 People',
       color = 'Freedom House Political Rights and Civil Liberties',
       size = 'Internet Users per 100 People')
q6_plot