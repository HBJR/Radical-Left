library(rio)
library(stargazer)
library(dplyr)
library(tidyverse)
setwd("C:/Users/hbjro/OneDrive/Documents/Nationalism")
source("ESS1 left.R")
source("ESS2 left.R")
source("ESS3 left.R")
source("ESS4 left.R")
source("ESS5 left.R")
source("ESS6 left.R")
source("ESS7 left.R")

data <- bind_rows(ESS1.data, ESS2.data, ESS3.data, ESS4.data, ESS5.data, ESS6.data, ESS7.data)
ESS7.extradata <- data.frame(ESS7.data, ESS7.extra)

total.model1 <- glm(left.support.SD ~ ethnic.anti.immigrant 
                    + economic.anti.immigrant 
                    + country + year,
                    family = binomial, data = data)
total.model2 <- glm(left.support.SD ~ ethnic.anti.immigrant
                    + economic.anti.immigrant 
                    + age + gender + religion
                    + education + class + unemployed + urban + union
                    + subj.income + redistribution + environment
                    + social.liberalism + egalitarianism + strong.gov
                    + trust + interest + country + year,
                    family = binomial, data = data)

table1 <- stargazer(total.model1, total.model2, 
          keep = c("ethnic.anti.immigrant", "economic.anti.immigrant"), 
          dep.var.labels = "Social Democrts (0) vs. Radical Left (1)",
          covariate.labels = c("Ethnic Threat", "Economic Threat"),
          type = "html", star.cutoffs = c(0.05, 0.01, 0.001))

ESS7.model1 <- glm(left.support.SD ~ ethnic.anti.immigrant 
                    + job + benefits
                    + country,
                    family = binomial, data = ESS7.extradata)
ESS7.model2 <- glm(left.support.SD ~ ethnic.anti.immigrant
                    + job + benefits
                    + age + gender + religion 
                    + education + class + unemployed + urban + union
                    + subj.income + redistribution + environment
                    + social.liberalism + egalitarianism + strong.gov
                    + trust + interest
                    + country,
                    family = binomial, data = ESS7.extradata)
ESS7.model3 <- glm(left.support.SD ~ ethnic.anti.immigrant
                    + job + benefits
                    + age + gender + religion + immigrant
                    + education + class + unemployed + urban + union
                    + subj.income + redistribution + environment
                    + social.liberalism + egalitarianism + strong.gov
                    + trust + interest + euroscepticism
                    + country,
                    family = binomial, data = ESS7.extradata)

table2 <- stargazer(ESS7.model1, ESS7.model2, ESS7.model3, 
          keep = c("ethnic.anti.immigrant", "job", "benefits"), 
          dep.var.labels = "Social Democrats (0) vs. Radical Left (1)",
          covariate.labels = c("Ethnic Threat", "Threat to Jobs", "Threat to Social Services"),
          type = "html", star.cutoffs = c(0.05, 0.01, 0.001))

threat.seq <- 1:10
newdata1 <- data.frame(
  ethnic.anti.immigrant = threat.seq,
  economic.anti.immigrant = median(data$economic.anti.immigrant, na.rm = TRUE),
  age = mean(data$age, na.rm = TRUE),
  gender = 0,
  religion = median(data$religion, na.rm = TRUE),
  education = median(data$education, na.rm = TRUE),
  class = "machine/production worker",
  unemployed = 0,
  urban = 0,
  union = 0,
  subj.income = median(data$subj.income, na.rm = TRUE),
  redistribution = median(data$redistribution, na.rm = TRUE),
  environment = median(data$environment, na.rm = TRUE),
  social.liberalism = median(data$social.liberalism, na.rm = TRUE),
  egalitarianism = median(data$egalitarianism, na.rm = TRUE),
  strong.gov = median(data$strong.gov, na.rm = TRUE),
  trust = median(data$trust, na.rm = TRUE),
  interest = median(data$interest, na.rm = TRUE),
  country = "CZ",
  year = "ESS1"
)
ethnic.predict <- predict(total.model2, newdata1, type = "response")
df <- data.frame(threat.seq, ethnic.predict)
ggplot(df, aes(x=threat.seq, y=ethnic.predict)) +
  geom_point() +
  labs(x = "Perceived Ethnic Threat", y = "Probability Voting Radical Left")

newdata2 <- data.frame(
  ethnic.anti.immigrant = median(ESS7.extradata$ethnic.anti.immigrant, na.rm = TRUE),
  job = threat.seq,
  benefits = median(ESS7.extradata$benefits, na.rm = TRUE),
  age = mean(ESS7.extradata$age, na.rm = TRUE),
  gender = 0,
  religion = median(ESS7.extradata$religion, na.rm = TRUE),
  education = median(ESS7.extradata$education, na.rm = TRUE),
  class = "machine/production worker",
  unemployed = 0,
  urban = 0,
  union = 0,
  subj.income = median(ESS7.extradata$subj.income, na.rm = TRUE),
  redistribution = median(ESS7.extradata$redistribution, na.rm = TRUE),
  environment = median(ESS7.extradata$environment, na.rm = TRUE),
  social.liberalism = median(ESS7.extradata$social.liberalism, na.rm = TRUE),
  egalitarianism = median(ESS7.extradata$egalitarianism, na.rm = TRUE),
  strong.gov = median(ESS7.extradata$strong.gov, na.rm = TRUE),
  trust = median(ESS7.extradata$trust, na.rm = TRUE),
  interest = median(ESS7.extradata$interest, na.rm = TRUE),
  euroscepticism = median(ESS7.extradata$euroscepticism, na.rm = TRUE),
  country = "CZ"
)
jobs.predict <- predict(ESS7.model3, newdata2, type = "response")
df <- data.frame(threat.seq, jobs.predict)
ggplot(df, aes(x=threat.seq, y=jobs.predict)) +
  geom_point() +
  labs(x = "Perceived Threat to Jobs", y = "Probability Voting Radical Left")
