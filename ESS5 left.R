ESS <- import("ESS5.dta")
source("get_party.R")
source("Independent Variables.R")

#-------------Radical Left Support v. Mainstream Parties----------
belgium <- get_party(ESS,"BE", "prtvtcbe", 99, 99)
bulgaria <- get_party(ESS, "BG", "prtvtbbg", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtcch", 99, 99)
cyprus <- get_party(ESS, "CY", "prtvtcy", 1, 7)
czechia <- get_party(ESS,"CZ", "prtvtbcz", 4, c(1, 2, 3, 5, 6))
germany <- get_party(ESS,"DE", "prtvcde2", 5, c(1, 2, 4))
denmark <- get_party(ESS,"DK", "prtvtbdk", c(4, 9), c(1, 2, 3, 6, 7, 8))
estonia <- get_party(ESS, "EE", "prtvtcee", 99, 99)
spain <- get_party(ESS,"ES", "prtvtbes", 3, c(1, 2, 10))
finland <- get_party(ESS,"FI", "prtvtbfi", 15, c(1, 3, 7, 14))
france <- get_party(ESS,"FR", "prtvtbfr", c(3, 4, 7), c(5, 6, 8, 9, 10, 11))
britain <- get_party(ESS,"GB", "prtvtgb", 99, 99)
greece <- get_party(ESS,"GR", "prtvtcgr", 3, c(1, 2, 7, 10))
croatia <- get_party(ESS, "HR", "prtvthr", 99, 99)
hungary <- get_party(ESS,"HU", "prtvtchu", 5, c(1, 2, 4, 6, 8))
ireland <- get_party(ESS,"IE", "prtvtaie", 7, c(1, 2, 5))
israel <- get_party(ESS,"IL", "prtvtbil", 99, 99)
lithuania <- get_party(ESS, "LT", "prtvlt3", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtdnl", 5, c(1, 2, 4, 6, 8, 9))
norway <- get_party(ESS,"NO", "prtvtano", c(1, 2), c(3, 4, 5, 7))
poland <- get_party(ESS,"PL", "prtvtbpl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtbpt", c(1, 3), c(2, 10, 11))
russia <- get_party(ESS, "RU", "prtvtbru", 99, 99)
sweden <- get_party(ESS,"SE", "prtvtase", 7, c(2, 3, 5, 6))
slovenia <- get_party(ESS,"SI", "prtvtcsi", 99, 99)
slovakia <- get_party(ESS, "SK", "prtvtbsk", 99, 99)
ukraine <- get_party(ESS, "UA", "prtvtbua", 99, 99)

left.support <- c(belgium, bulgaria, switzerland, cyprus, czechia, 
                  germany, denmark, estonia, spain, finland,
                  france, britain, greece, croatia, hungary, ireland, israel, 
                  lithuania, netherlands, norway, poland, portugal, 
                  russia, sweden, slovenia, slovakia, ukraine)

#-------------Radical Left Support v. Social Democrats----------
belgium <- get_party(ESS,"BE", "prtvtcbe", 99, 99)
bulgaria <- get_party(ESS, "BG", "prtvtbbg", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtcch", 99, 99)
cyprus <- get_party(ESS, "CY", "prtvtcy", 1, 7)
czechia <- get_party(ESS,"CZ", "prtvtbcz", 4, 2)
germany <- get_party(ESS,"DE", "prtvcde2", 5, 1)
denmark <- get_party(ESS,"DK", "prtvtbdk", c(4, 9), 1)
estonia <- get_party(ESS, "EE", "prtvtcee", 99, 99)
spain <- get_party(ESS,"ES", "prtvtbes", 3, 2)
finland <- get_party(ESS,"FI", "prtvtbfi", 15, 14)
france <- get_party(ESS,"FR", "prtvtbfr", c(3, 4, 7), c(8, 9))
britain <- get_party(ESS,"GB", "prtvtgb", 99, 99)
greece <- get_party(ESS,"GR", "prtvtcgr", 3, 1)
croatia <- get_party(ESS, "HR", "prtvthr", 99, 99)
hungary <- get_party(ESS,"HU", "prtvtchu", 5, 4)
ireland <- get_party(ESS,"IE", "prtvtaie", 7, 5)
israel <- get_party(ESS,"IL", "prtvtbil", 99, 99)
lithuania <- get_party(ESS, "LT", "prtvlt3", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtdnl", 5, 2)
norway <- get_party(ESS,"NO", "prtvtano", c(1, 2), 3)
poland <- get_party(ESS,"PL", "prtvtbpl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtbpt", c(1, 3), 11)
russia <- get_party(ESS, "RU", "prtvtbru", 99, 99)
sweden <- get_party(ESS,"SE", "prtvtase", 7, 6)
slovenia <- get_party(ESS,"SI", "prtvtcsi", 99, 99)
slovakia <- get_party(ESS, "SK", "prtvtbsk", 99, 99)
ukraine <- get_party(ESS, "UA", "prtvtbua", 99, 99)

left.support.SD <- c(belgium, bulgaria, switzerland, cyprus, czechia, 
                  germany, denmark, estonia, spain, finland,
                  france, britain, greece, croatia, hungary, ireland, israel, 
                  lithuania, netherlands, norway, poland, portugal, 
                  russia, sweden, slovenia, slovakia, ukraine)

#--------------Year Specific Independent Variables--------------
year <- rep("ESS5", nrow(ESS))

#--------------Year Data-------------
ESS5.data <- data.frame(left.support, left.support.SD, country, year, age, gender, religion,
                        education, unemployed, urban, class, subj.income,
                        union, immigrant, trust, anti.immigrant, ethnic.anti.immigrant, 
                        economic.anti.immigrant, ideology, interest, campaign, 
                        egalitarianism, altruism, redistribution, strong.gov, 
                        environment, social.liberalism)