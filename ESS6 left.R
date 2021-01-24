ESS <- import("Data/ESS6.dta")
names(ESS)[names(ESS) == "isco08"] <- "iscoco"
source("get_party.R")
source("Independent Variables.R")

#------------Radical Left Support v. Mainstream Parties---------
albania <- get_party(ESS, "AL", "prtvtal", 99, 99)
belgium <- get_party(ESS,"BE", "prtvtcbe", 99, 99)
bulgaria <- get_party(ESS, "BG", "prtvtcbg", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtdch", 99, 99)
cyprus <- get_party(ESS, "CY", "prtvtacy", 1, c(2, 3, 4, 6))
czechia <- get_party(ESS,"CZ", "prtvtccz", 1, c(2, 3, 4, 5))
germany <- get_party(ESS,"DE", "prtvdde2", 5, c(1, 2, 4))
denmark <- get_party(ESS,"DK", "prtvtcdk", c(4, 9), c(1, 2, 3, 6, 7, 8))
estonia <- get_party(ESS, "EE", "prtvtdee", 99, 99)
spain <- get_party(ESS,"ES", "prtvtces", 4, c(1, 2, 6))
finland <- get_party(ESS,"FI", "prtvtcfi", 14, c(1, 5, 13))
france <- get_party(ESS,"FR", "prtvtcfr", c(5, 6), c(1, 3, 7, 8, 9, 10 ,11))
britain <- get_party(ESS,"GB", "prtvtgb", 99, 99)
hungary <- get_party(ESS,"HU", "prtvtdhu", 10, c(3, 6, 8, 13))
ireland <- get_party(ESS,"IE", "prtvtaie", 6, c(1, 2, 5))
israel <- get_party(ESS,"IL", "prtvtbil", 99, 99)
iceland <- get_party(ESS, "IS", "prtvtais", 99, 99)
italy <- get_party(ESS,"IT", "prtvtbit", 99, 99)
lithuania <- get_party(ESS,"LT", "prtvalt1", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtenl", 5, c(1, 2, 4, 6, 8, 9, 12))
norway <- get_party(ESS,"NO", "prtvtano", c(1, 2), c(3, 4, 5, 7))
poland <- get_party(ESS,"PL", "prtvtcpl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtbpt", c(1, 3), c(2, 10, 11))
russia <- get_party(ESS, "RU", "prtvtcru", 99, 99)
sweden <- get_party(ESS,"SE", "prtvtbse", 7, c(2, 3, 5, 6))
slovenia <- get_party(ESS,"SI", "prtvtdsi", 99, 99)
slovakia <- get_party(ESS, "SK", "prtvtcsk", 99, 99)
ukraine <- get_party(ESS, "UA", "prtvtcua", 99, 99)
kosovo <- get_party(ESS, "XK", "prtvtxk", 99, 99)

left.support <- c(albania, belgium, bulgaria, switzerland, cyprus, czechia, 
                  germany, denmark, estonia, spain, finland,
                  france, britain, hungary, ireland, iceland, israel, 
                  italy, lithuania, netherlands, norway, poland, portugal,
                  russia, sweden, slovenia, slovakia, ukraine, kosovo)

#------------Radical Left Support v. Social Democrats---------
albania <- get_party(ESS, "AL", "prtvtal", 99, 99)
belgium <- get_party(ESS,"BE", "prtvtcbe", 99, 99)
bulgaria <- get_party(ESS, "BG", "prtvtcbg", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtdch", 99, 99)
cyprus <- get_party(ESS, "CY", "prtvtacy", 1, 6)
czechia <- get_party(ESS,"CZ", "prtvtccz", 1, 2)
germany <- get_party(ESS,"DE", "prtvdde2", 5, 1)
denmark <- get_party(ESS,"DK", "prtvtcdk", c(4, 9), 1)
estonia <- get_party(ESS, "EE", "prtvtdee", 99, 99)
spain <- get_party(ESS,"ES", "prtvtces", 4, 2)
finland <- get_party(ESS,"FI", "prtvtcfi", 14, 13)
france <- get_party(ESS,"FR", "prtvtcfr", c(5, 6), c(7, 9))
britain <- get_party(ESS,"GB", "prtvtgb", 99, 99)
hungary <- get_party(ESS,"HU", "prtvtdhu", 10, 8)
ireland <- get_party(ESS,"IE", "prtvtaie", 6, 5)
israel <- get_party(ESS,"IL", "prtvtbil", 99, 99)
iceland <- get_party(ESS, "IS", "prtvtais", 99, 99)
italy <- get_party(ESS,"IT", "prtvtbit", 99, 99)
lithuania <- get_party(ESS,"LT", "prtvalt1", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtenl", 5, 2)
norway <- get_party(ESS,"NO", "prtvtano", c(1, 2), 3)
poland <- get_party(ESS,"PL", "prtvtcpl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtbpt", c(1, 3), 11)
russia <- get_party(ESS, "RU", "prtvtcru", 99, 99)
sweden <- get_party(ESS,"SE", "prtvtbse", 7, 6)
slovenia <- get_party(ESS,"SI", "prtvtdsi", 99, 99)
slovakia <- get_party(ESS, "SK", "prtvtcsk", 99, 99)
ukraine <- get_party(ESS, "UA", "prtvtcua", 99, 99)
kosovo <- get_party(ESS, "XK", "prtvtxk", 99, 99)

left.support.SD <- c(albania, belgium, bulgaria, switzerland, cyprus, czechia, 
                  germany, denmark, estonia, spain, finland,
                  france, britain, hungary, ireland, iceland, israel, 
                  italy, lithuania, netherlands, norway, poland, portugal,
                  russia, sweden, slovenia, slovakia, ukraine, kosovo)

#-----------Year Specific Independent Variables----------
year <- rep("ESS6", nrow(ESS))

#-----------Year Data------------
ESS6.data <- data.frame(left.support, left.support.SD, country, year, age, gender, religion,
                        education, unemployed, urban, class, subj.income,
                        union, immigrant, trust, anti.immigrant, ethnic.anti.immigrant, 
                        economic.anti.immigrant, ideology, interest, campaign, 
                        egalitarianism, altruism, redistribution, strong.gov, 
                        environment, social.liberalism)
