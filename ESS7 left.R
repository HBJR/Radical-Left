ESS <- read.csv("Data/ESS7.csv")
names(ESS)[names(ESS) == "isco08"] <- "iscoco"
source("get_party.R")
source("Independent Variables.R")

#-------------Support for Radical Left v. Mainstream Party----------
austria <- get_party(ESS, "AT", "prtvtbat", 99, 99)
belgium <- get_party(ESS,"BE", "prtvtcbe", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtech", 99, 99)
czechia <- get_party(ESS,"CZ", "prtvtdcz", 1, c(2, 3, 4, 5, 6, 7))
germany <- get_party(ESS,"DE", "prtvede2", 3, c(1, 2, 5))
denmark <- get_party(ESS,"DK", "prtvtcdk", c(4, 9), c(1, 2, 3, 6, 7, 8))
estonia <- get_party(ESS,"EE", "prtvteee", 99, 99)
spain <- get_party(ESS,"ES", "prtvtces", 4, c(1, 2, 6))
finland <- get_party(ESS,"FI", "prtvtcfi", 14, c(1, 5, 13))
france <- get_party(ESS,"FR", "prtvtcfr", c(5, 6), c(1, 3, 7, 8, 9, 10, 11))
britain <- get_party(ESS,"GB", "prtvtbgb", 99, 99)
hungary <- get_party(ESS,"HU", "prtvtehu", 99, 99)
ireland <- get_party(ESS,"IE", "prtvtaie", 7, c(1, 2, 5))
israel <- get_party(ESS,"IL", "prtvtcil", 99, 99)
lithuania <- get_party(ESS,"LT", "prtvalt1", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtfnl", 4, c(1, 2, 5, 6, 7, 9, 11))
norway <- get_party(ESS,"NO", "prtvtbno", c(1, 2), c(3, 4, 5, 7))
poland <- get_party(ESS,"PL", "prtvtcpl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtbpt", c(1, 3), c(2, 10, 11))
sweden <- get_party(ESS,"SE", "prtvtbse", 7, c(2, 3, 5, 6))
slovenia <- get_party(ESS,"SI", "prtvtesi", 99, 99)

left.support <- c(austria, belgium, switzerland, czechia, 
                germany, denmark, estonia, spain, finland,
                france, britain, hungary, ireland, israel, 
                lithuania, netherlands, norway, poland, 
                portugal, sweden, slovenia)

#-------------Support for Radical Left v. Social Democrats----------
austria <- get_party(ESS, "AT", "prtvtbat", 99, 99)
belgium <- get_party(ESS,"BE", "prtvtcbe", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtech", 99, 99)
czechia <- get_party(ESS,"CZ", "prtvtdcz", 1, 2)
germany <- get_party(ESS,"DE", "prtvede2", 3, 2)
denmark <- get_party(ESS,"DK", "prtvtcdk", c(4, 9), 1)
estonia <- get_party(ESS,"EE", "prtvteee", 99, 99)
spain <- get_party(ESS,"ES", "prtvtces", 4, 2)
finland <- get_party(ESS,"FI", "prtvtcfi", 14, 13)
france <- get_party(ESS,"FR", "prtvtcfr", c(5, 6), c(7, 9))
britain <- get_party(ESS,"GB", "prtvtbgb", 99, 99)
hungary <- get_party(ESS,"HU", "prtvtehu", 99, 99)
ireland <- get_party(ESS,"IE", "prtvtaie", 7, 5)
israel <- get_party(ESS,"IL", "prtvtcil", 99, 99)
lithuania <- get_party(ESS,"LT", "prtvalt1", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtfnl", 4, 2)
norway <- get_party(ESS,"NO", "prtvtbno", c(1, 2), 3)
poland <- get_party(ESS,"PL", "prtvtcpl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtbpt", c(1, 3), 11)
sweden <- get_party(ESS,"SE", "prtvtbse", 7, 6)
slovenia <- get_party(ESS,"SI", "prtvtesi", 99, 99)

left.support.SD <- c(austria, belgium, switzerland, czechia, 
                  germany, denmark, estonia, spain, finland,
                  france, britain, hungary, ireland, israel, 
                  lithuania, netherlands, norway, poland, 
                  portugal, sweden, slovenia)


#-----------------Year Specific Control Variables----------
year <- rep("ESS7", nrow(ESS))

job = recode(ESS$imtcjob, "0" = 10, "1" = 9, "2" = 8, "3" = 7, "4" = 6, "5" = 5, 
             "6" = 4, "7" = 3, "8" = 2, "9" = 1, "10" = 0)


benefits = recode(ESS$imbleco, "0" = 10,  "1" = 9, "2" = 8, "3" = 7, "4" = 6, 
                  "5" = 5, "6" = 4, "7" = 3, "8" = 2, "9" = 1, "10" = 0)

religion.threat = recode(ESS$rlgueim, "0" = 10,  "1" = 9, "2" = 8, "3" = 7, "4" = 6, 
                         "5" = 5, "6" = 4, "7" = 3, "8" = 2, "9" = 1, "10" = 0)

efficacy = recode(ESS$psppsgv, "0" = 10,  "1" = 9, "2" = 8, "3" = 7, "4" = 6, 
                  "5" = 5, "6" = 4, "7" = 3, "8" = 2, "9" = 1, "10" = 0)

euroscepticism = recode(ESS$euftf, "0" = 10,  "1" = 9, "2" = 8, "3" = 7, "4" = 6, 
                        "5" = 5, "6" = 4, "7" = 3, "8" = 2, "9" = 1, "10" = 0)


#--------------Year Data--------
ESS7.data <- data.frame(left.support, left.support.SD, country, year, age, gender, religion,
                        education, unemployed, urban, class, subj.income,
                        union, immigrant, trust, anti.immigrant, ethnic.anti.immigrant, 
                        economic.anti.immigrant, ideology, interest, campaign, 
                        egalitarianism, altruism, redistribution, strong.gov, 
                        environment, social.liberalism)

ESS7.extra <- data.frame(job, benefits, religion.threat, efficacy, euroscepticism)

