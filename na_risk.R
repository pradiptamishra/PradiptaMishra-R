#load excel package
library(readxl)
library(dplyr)

#set the working directory
setwd("C:/Users/194903/Documents/R-Workspace")

#load the data from excel
NA_Risk <- read_excel("~/DE data/NA Risk Prediction_0507.xlsx", sheet = "Risky Project Report-Jul to Apr")
attach(NA_Risk)

#View data
#View(NA_Risk)
#summary(NA_Risk)
#NA_RISK_SUMMARY <- arrange(NA_Risk,`Std Practice`)


#NA_RISK_projects <-distinct(NA_RISK_SUMMARY)
#NA_RISK_projects <- mutate(NA_RISK_projects,NA_Scope = factor(1 * (FTE<10), labels = c("Yes", "No")))
#NA_RISK_projects <- mutate(NA_RISK_projects,NA_Ownership = factor(1 * (Offshore_Ratio<20), labels = c("No", "Yes")))

#NA_RISK_SUMMARY <- group_by(NA_RISK_SUMMARY,`Std Practice`)

#NA_RISK_Size_high <-filter(NA_RISK_SUMMARY, SIZE_OF_PROJECT=="High")
#NA_RISK_Size_high_count <-NA_RISK_Size_high %>% count(`Std Practice`)

#write.csv(NA_RISK_Projects,'NA_RISK_projects.csv')
#write.csv('NA_RISK_projects.csv')




NA_RisK_Projects <-select(NA_Risk, -`Risk  Area`)
NA_RisK_Projects <- distinct(NA_RisK_Projects)
names(NA_RisK_Projects)[27]<-"Offshore_Ratio"

NA_Risk_Projects %>%
  mutate(NA_Scope = factor(1 * (FTE<10), labels = c("In NA Scope", "Out of NA Scope"))) %>%
  mutate(NA_Ownership = factor(1 * (Offshore_Ratio<20), labels = c("Other Enable Teams", "NA Enable"))) %>%
  select (`Client Name`,Offshore_Ratio, FTE, NA_Scope, NA_Ownership) %>%
  group_by (`Client Name`) %>%
  Sumarise(count)



