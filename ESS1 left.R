ESS <- import("Data/ESS1.dta")
source("get_party.R")
source("Independent Variables.R")

#--------------Radical Left Support v. Mainstream Party-------
austria <- get_party(ESS, "AT", "prtvtat", 99, 99)
belgium <- get_party(ESS,"BE", "prtvtbe", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtch", 99, 99)
czechia <- get_party(ESS,"CZ", "prtvtcz", 9, c(1, 2, 8, 10, 11))
germany <- get_party(ESS,"DE", "prtvde2", 5, c(1, 2, 4))
denmark <- get_party(ESS,"DK", "prtvtdk", c(5, 10), c(1, 2, 3, 4, 7, 8))
spain <- get_party(ESS,"ES", "prtvtes", 3, c(1, 2))
finland <- get_party(ESS,"FI", "prtvtfi", 10, c(1, 3, 6, 9))
france <- get_party(ESS,"FR", "prtvtfr", c(4, 5, 9), c(2, 8, 10, 11, 12, 13))
britain <- get_party(ESS,"GB", "prtvtgb", 99, 99)
greece <- get_party(ESS,"GR", "prtvtgr", c(3, 4), c(1, 2, 5))
hungary <- get_party(ESS,"HU", "prtvthu", 6, c(2, 3, 5, 7))
ireland <- get_party(ESS,"IE", "prtvtie", 6, c(1, 2, 3, 4))
israel <- get_party(ESS,"IL", "prtvtil", 99, 99)
italy <- get_party(ESS,"IT", "prtvtit", c(3, 7), c(1, 2, 8, 9, 10, 12, 13, 14))
luxembourg <- get_party(ESS,"LU", "prtvtlu", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtnl", 7, c(1, 2, 3, 4, 5, 8, 10))
norway <- get_party(ESS,"NO", "prtvtno", c(1, 2), c(3, 4, 5, 7))
poland <- get_party(ESS,"PL", "prtvtpl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtpt", c(1, 5), c(2, 9, 10, 11))
sweden <- get_party(ESS,"SE", "prtvtse", 7, c(2, 3, 5, 6))
slovenia <- get_party(ESS,"SI", "prtvtsi", 99, 99)

left.support <- c(austria, belgium, switzerland, czechia, 
                germany, denmark, spain, finland,
                france, britain, greece, hungary, ireland, israel, 
                italy, luxembourg, netherlands, 
                norway, poland, portugal, sweden, slovenia)

#-------------Radical Left Support v. Social Democrats-------------
austria <- get_party(ESS, "AT", "prtvtat", 99, 99)
belgium <- get_party(ESS,"BE", "prtvtbe", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtch", 99, 99)
czechia <- get_party(ESS,"CZ", "prtvtcz", 9, c(1, 11))
germany <- get_party(ESS,"DE", "prtvde2", 5, 1)
denmark <- get_party(ESS,"DK", "prtvtdk", c(5, 10), 1)
spain <- get_party(ESS,"ES", "prtvtes", 3, 2)
finland <- get_party(ESS,"FI", "prtvtfi", 10, 9)
france <- get_party(ESS,"FR", "prtvtfr", c(4, 5, 9), 10)
britain <- get_party(ESS,"GB", "prtvtgb", 99, 99)
greece <- get_party(ESS,"GR", "prtvtgr", c(3, 4), 1)
hungary <- get_party(ESS,"HU", "prtvthu", 6, 5)
ireland <- get_party(ESS,"IE", "prtvtie", 6, 3)
israel <- get_party(ESS,"IL", "prtvtil", 99, 99)
italy <- get_party(ESS,"IT", "prtvtit", c(3, 7), c(1, 12))
luxembourg <- get_party(ESS,"LU", "prtvtlu", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtnl", 7, 2)
norway <- get_party(ESS,"NO", "prtvtno", c(1, 2), 3)
poland <- get_party(ESS,"PL", "prtvtpl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtpt", c(1, 5), 10)
sweden <- get_party(ESS,"SE", "prtvtse", 7, 6)
slovenia <- get_party(ESS,"SI", "prtvtsi", 99, 99)

left.support.SD <- c(austria, belgium, switzerland, czechia, 
                  germany, denmark, spain, finland,
                  france, britain, greece, hungary, ireland, israel, 
                  italy, luxembourg, netherlands, 
                  norway, poland, portugal, sweden, slovenia)

#------------Year Specific Independent Variables--------
year <- rep("ESS1", nrow(ESS))

#------------Year Data------
ESS1.data <- data.frame(left.support, left.support.SD, country, year, age, gender, religion,
                        education, unemployed, urban, class, subj.income,
                        union, immigrant, trust, anti.immigrant, ethnic.anti.immigrant, 
                        economic.anti.immigrant, ideology, interest, campaign, 
                        egalitarianism, altruism, redistribution, strong.gov, 
                        environment, social.liberalism)
