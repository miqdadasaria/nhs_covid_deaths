############################################################################
# BAME COVID-19 deaths in the NHS - standardised from NHS England reports
#
# Date: April 2020
# Author: Miqdad Asaria (@miqedup)
###########################################################################

library("tidyverse")
library("readxl")
library("lubridate")
library("scales")

# the latest COVID death data is published by NHS England at 14:00 hrs everyday
if(hour(Sys.time())>14){
  data_date = today()
} else {
  data_date = today()-1
}

# set the date for the latest deaths by ethnicity data - used in chart titles
deaths_date = "21st April 2020"

# create date part of filename for deaths data
date = paste0(day(data_date),"-",month(data_date, label=TRUE, abbr=FALSE),"-",year(data_date))
# download deaths by age and ethnicity data from NHS England
source_deaths = paste0("https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2020/04/COVID-19-total-announced-deaths-",date,".xlsx")
dest_deaths = "data/nhs_deaths.xlsx"
# saved file uses data published on "2020-04-23"
# "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2020/04/COVID-19-total-announced-deaths-23-April-2020.xlsx"
#download.file(url=source_deaths, destfile=dest_deaths, method = "auto", quiet=FALSE)

# clean up the deaths by age data from NHS England
deaths_by_age = read_excel(dest_deaths, sheet = "COVID19 total deaths by age", skip=15) %>%
  select(age_group = 'Age group', deaths='Total') %>%
  filter(!is.na(deaths)) %>%
  mutate(age_group = str_replace(age_group, " yrs", ""),
         age_group = str_replace_all(age_group, " ", "")) %>%
  filter(age_group != "Total")

# clean up the deaths by ethnicity data from NHS England
deaths_by_ethnicty = read_excel(dest_deaths, sheet = "COVID19 total by ethnicity", skip=15) %>%
  select(ethnic_group=1, deaths=3, proportion=5) %>% 
  filter(!is.na(ethnic_group) & !is.na(proportion) & ethnic_group != "Total") %>%
  separate(ethnic_group,into=c("ethnic_group", "ethnicity"),sep=" \\(") %>%
  select(ethnic_group, deaths, proportion)

# census data on age structure of population by ethnic group
# downloaded from NOMIS census table DC2101EW
# TODO: find a URL to download this from rather than use local version
age_ethnicity_structure = read_csv("data/age_structure_ethnicity_census.csv", skip=9) %>%
  select(-2) %>%
  filter(!is.na(Age)) %>%
  gather("ethnicity","population", -1) %>%
  separate(ethnicity,into = c("ethnicity","subethnicity"), sep=": ") %>%
  spread(Age, population) %>%
  mutate(`0-19` = `Age 0 to 4` + `Age 0 to 4` + `Age 15` + `Age 16 to 17` + `Age 18 to 19`,
         `20-39` = `Age 20 to 24` + `Age 25 to 29` + `Age 30 to 34` + `Age 35 to 39`,
         `40-59` = `Age 40 to 44` + `Age 45 to 49` + `Age 50 to 54` + `Age 55 to 59`,
         `60-79` = `Age 60 to 64` + `Age 65 to 69` + `Age 70 to 74` + `Age 75 to 79`,
         `80+` = `Age 80 to 84` + `Age 85 and over`) %>%
  select(-starts_with("Age")) %>%
  arrange(subethnicity) %>%
  gather("age_group","population", -c(1,2)) %>%
  spread(subethnicity, population) %>% 
  mutate(`Any other ethnic group` = `Any other ethnic group` + `Arab`,
        `Any other White background` = `Gypsy or Irish Traveller` + `Other White`) %>%
  select(age_group,
         ethnicity,
         `British` = `English/Welsh/Scottish/Northern Irish/British`,
         `Irish`,
         `Any other White background`,
         `White and Black Caribbean`,
         `White and Black African`,
         `White and Asian`,
         `Any other Mixed background` = `Other Mixed`,
         `Indian`,
         `Pakistani`,
         `Bangladeshi`,
         `Chinese`,
         `Any other Asian background` = `Other Asian` ,
         `Caribbean`,
         `African`,
         `Any other Black background` = `Other Black`,
         `Any other ethnic group`) %>%
  gather(ethnic_group, population, -c(1,2), na.rm=TRUE)

# calculate the total population data by age group from the census data
total_pop = age_ethnicity_structure %>% 
  group_by(age_group) %>% 
  summarise(population=sum(population))

# calculate mortality rates by age group combining deaths by age from NHS England and 
# total population data from the census
mortality = inner_join(total_pop,deaths_by_age) %>%
  mutate(mort_rate = deaths/population) %>%
  select(age_group, mort_rate)

# calculate expected death rates foe each ethnic group based on age structure of population
expected_vs_observed = inner_join(age_ethnicity_structure, mortality) %>%
  # age structure adjusted expected death rates of each ethnic group
  mutate(expected_deaths = population*mort_rate) %>%
  group_by(ethnicity,ethnic_group) %>%
  summarise(expected_deaths = sum(expected_deaths),
            population = sum(population)) %>%
  ungroup() %>%
  # calculate the proportion of expected deaths in each group
  mutate(expected_deaths_proportion = expected_deaths/sum(expected_deaths),
         population_proportion = population/sum(population)) %>%
  inner_join(deaths_by_ethnicty) %>%
  # rescale so that total expected deaths = total observed deaths
  # calculate expected deaths based on population and based on population and age strucuture
  mutate(observed_deaths = deaths,
         expected_deaths = round(expected_deaths_proportion*sum(observed_deaths)),
         pop_expected_deaths = round(population_proportion*sum(observed_deaths)),
         difference = observed_deaths-expected_deaths,
         observed_deaths_proportion = deaths/sum(observed_deaths)) %>%
  select(ethnicity, ethnic_group, population, population_proportion, observed_deaths, observed_deaths_proportion, pop_expected_deaths, expected_deaths,expected_deaths_proportion, difference)

# group data into top level ethnicity groups for plotting
graph_data = expected_vs_observed %>% 
  group_by(ethnicity) %>%
  summarise(expected_deaths = sum(expected_deaths),
            observed_deaths = sum(observed_deaths), 
            difference = sum(difference)) %>%
  gather(variable, value, -1) %>%
  mutate(ethnicity = factor(ethnicity,
                            c( "White",
                               "Asian/Asian British",                  
                               "Black/African/Caribbean/Black British",
                               "Mixed/multiple ethnic group",          
                               "Other ethnic group"),
                            c("White","Asian","Black","Mixed","Other")
                            ),
         variable = factor(variable,
                           c("observed_deaths","expected_deaths","difference"),
                           c("Observed Deaths","Expected Deaths","Difference")))
  
# plot the numbers of expected and observed deaths 
obs_exp_plot = ggplot(subset(graph_data,variable!="Difference"),aes(x=ethnicity,y=value, group=variable, fill=variable)) +
  geom_col(position="dodge", colour="black") + 
  geom_text(aes(label = scales::comma(value)), position = position_dodge(width = 1), vjust = -0.5, hjust=0.5, size=2.5) +
  xlab("Ethnicity") +
  ylab("Total number of deaths in hospital") +
  scale_fill_manual(values = c("Expected Deaths"="#003F5C","Observed Deaths"="#E69F00")) + 
  scale_y_continuous(labels = comma) +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"),
        legend.title = element_blank(), 
        legend.position = "top") +
  labs(title = "Deaths in hospital from COVID-19 by ethnicity",
       subtitle = paste0("Data for England up until ", deaths_date),
       caption = "Plot by Miqdad Asaria (@miqedup)\n
       Data are from the ONS (ethnicity) and NHS England (deaths) \n
       Expected deaths are adjusted for age structure of ethnic groups") 

ggsave("figures/obs_exp_plot.png", obs_exp_plot, width = 7, height = 6)

# plot the excess deaths as the difference between expected and observed number of deaths (observed - expected)
diff_plot = ggplot(subset(graph_data,variable=="Difference"),aes(x=ethnicity,y=value)) +
  geom_col(colour="black", fill="#58508d") + 
  geom_text(aes(label = scales::comma(value)), vjust = -0.5, hjust=0.5, size=2.5) +
  xlab("Ethnicity") +
  ylab("Excess number of deaths in hospital") +
  scale_y_continuous(labels = comma) +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"),
        legend.title = element_blank(), 
        legend.position = "top") +
  labs(title = "Excess deaths in hospital from COVID-19 by ethnicity",
       subtitle = paste0("Data for England up until ",deaths_date),
       caption = "Plot by Miqdad Asaria (@miqedup)\n
       Data are from the ONS (ethnicity) and NHS England (deaths) \n
       Expected deaths are adjusted for age structure of ethnic groups") 

ggsave("figures/diff_plot.png", diff_plot, width = 7, height = 6)


# save out a table of expected and observed deaths by ethnic group
table = expected_vs_observed %>% 
  mutate(ratio=observed_deaths/expected_deaths)

write_csv(table, "figures/COVID_deaths_by_ethnicity.csv")


# summarise the age structure of the population by top level ethnic group
age_structure_eth = age_ethnicity_structure %>%
  mutate(age_group = factor(age_group,levels = c("0-19", "20-39", "40-59", "60-79", "80+")),
         ethnicity=factor(ethnicity,
                levels=c( "White",
                   "Asian/Asian British",                  
                   "Black/African/Caribbean/Black British",
                   "Mixed/multiple ethnic group",          
                   "Other ethnic group"),
                labels=c("White","Asian","Black","Mixed","Other")
         )) %>%
  group_by(ethnicity, age_group) %>%
  summarise(population=sum(population)) %>%
  mutate(proportion = population/sum(population))

# summarise the age structure of the population by second level ethnic group
age_structure_eth_detailed = age_ethnicity_structure %>%
  mutate(age_group = factor(age_group,levels = c("0-19", "20-39", "40-59", "60-79", "80+")),
         ethnic_group=factor(ethnic_group,
                          levels=c( "British",
                                    "Irish",
                                    "Any other White background",
                                    "Indian",
                                    "Pakistani",
                                    "Bangladeshi",
                                    "Chinese",
                                    "Any other Asian background",
                                    "African",
                                    "Caribbean",
                                    "Any other Black background",
                                    "White and Asian",
                                    "White and Black Caribbean",
                                    "White and Black African",
                                    "Any other Mixed background",
                                    "Any other ethnic group"),
                          labels=c("White: British",
                                   "White: Irish",
                                   "White: Any other White background",
                                   "Asian: Indian",
                                   "Asian: Pakistani",
                                   "Asian: Bangladeshi",
                                   "Asian: Chinese",
                                   "Asian: Any other Asian background",
                                   "Black: African",
                                   "Black: Caribbean",
                                   "Black: Any other Black background",
                                   "Mixed: White and Asian",
                                   "Mixed: White and Black Caribbean",
                                   "Mixed: White and Black African",
                                   "Mixed: Any other Mixed background",
                                   "Other: Any other ethnic group")
         )) %>%
  group_by(ethnic_group, age_group) %>%
  summarise(population=sum(population)) %>%
  mutate(proportion = population/sum(population))

# plot top level ethnic group population structure
ethnicty_labels = age_structure_eth %>% 
  group_by(ethnicity) %>% 
  summarise(total_population=sum(population)) %>% 
  ungroup() %>%
  mutate(label = paste0(ethnicity, "\n Total population: ", scales::comma(total_population))) %>%
  pull(label)
names(ethnicty_labels) = c("White","Asian","Black","Mixed","Other")

pop_structure_plot = ggplot(age_structure_eth, aes(x=age_group, y=proportion)) +
  geom_col(position="dodge", colour="black", fill="#ffa600") + 
  geom_text(aes(label = scales::percent(proportion,accuracy = 1)), position = position_dodge(width = 1), vjust = -0.5, hjust=0.5, size=2.5) +
  xlab("Age Group") +
  ylab("Proportion of Population") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  facet_wrap(.~ethnicity, labeller = labeller(ethnicity = ethnicty_labels)) +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"),
        legend.title = element_blank(), 
        legend.position = "top") +
  labs(title = "Age structure of population by ethnicity",
       subtitle = paste0("Data for England from 2011 Census"),
       caption = "Plot by Miqdad Asaria (@miqedup)\n
       Data are from the ONS census 2011 (ethnicity)") 

ggsave("figures/pop_structure_plot.png", pop_structure_plot, width = 9, height = 8)

# plot second level ethnic group population structure
ethnic_group_labels = age_structure_eth_detailed %>% 
  group_by(ethnic_group) %>% 
  summarise(total_population=sum(population)) %>% 
  ungroup() %>%
  mutate(label = paste0(ethnic_group, "\n Total population: ", scales::comma(total_population))) %>%
  pull(label)
names(ethnic_group_labels) = c("White: British",
                               "White: Irish",
                               "White: Any other White background",
                               "Asian: Indian",
                               "Asian: Pakistani",
                               "Asian: Bangladeshi",
                               "Asian: Chinese",
                               "Asian: Any other Asian background",
                               "Black: African",
                               "Black: Caribbean",
                               "Black: Any other Black background",
                               "Mixed: White and Asian",
                               "Mixed: White and Black Caribbean",
                               "Mixed: White and Black African",
                               "Mixed: Any other Mixed background",
                               "Other: Any other ethnic group")

pop_structure_plot_detailed = ggplot(age_structure_eth_detailed, aes(x=age_group, y=proportion)) +
  geom_col(position="dodge", colour="black", fill="#ffa600") + 
  geom_text(aes(label = scales::percent(proportion,accuracy = 1)), position = position_dodge(width = 1), vjust = -0.5, hjust=0.5, size=2.5) +
  xlab("Age Group") +
  ylab("Proportion of Population") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  facet_wrap(.~ethnic_group, labeller = labeller(ethnic_group = ethnic_group_labels), ncol=4) +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"),
        legend.title = element_blank(), 
        legend.position = "top") +
  labs(title = "Age structure of population by ethnicity",
       subtitle = paste0("Data for England from 2011 Census"),
       caption = "Plot by Miqdad Asaria (@miqedup)\n
       Data are from the ONS census 2011 (ethnicity)") 

ggsave("figures/pop_structure_plot_detailed.png", pop_structure_plot_detailed, width = 12, height = 11)
