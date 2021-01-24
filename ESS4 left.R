ESS <- import("Data/ESS4.dta")
source("get_party.R")
source("Independent Variables.R")

#--------------Radical Left Support v. Mainstream Parties-----------
belgium <- get_party(ESS,"BE", "prtvtbbe", 99, 99)
bulgaria <- get_party(ESS, "BG", "prtvtabg", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtbch", 99, 99)
cyprus <- get_party(ESS, "CY", "prtvtcy", 1, c(2, 3, 4, 6, 7))
czechia <- get_party(ESS,"CZ", "prtvtacz", 1, c(2, 4, 5))
germany <- get_party(ESS,"DE", "prtvbde2", 5, c(1, 2, 4))
denmark <- get_party(ESS,"DK", "prtvtbdk", c(4, 9), c(1, 2, 3, 6, 7, 8))
estonia <- get_party(ESS, "EE", "prtvtbee", 99, 99)
spain <- get_party(ESS,"ES", "prtvtbes", 3, c(1, 2, 10))
finland <- get_party(ESS,"FI", "prtvtafi", 9, c(1, 3, 6, 8))
france <- get_party(ESS,"FR", "prtvtbfr", c(3, 4, 7), c(5, 6, 8, 9, 10, 11))
britain <- get_party(ESS,"GB", "prtvtgb", 99, 99)
greece <- get_party(ESS,"GR", "prtvtbgr", 3, c(1, 2))
croatia <- get_party(ESS, "HR", "prtvthr", 99, 99)
hungary <- get_party(ESS,"HU", "prtvtbhu", 5, c(1, 2, 4, 6, 8))
ireland <- get_party(ESS,"IE", "prtvtie", 6, c(1, 2, 3, 4))
israel <- get_party(ESS,"IL", "prtvtail", 99, 99)
latvia <- get_party(ESS, "LV", "prtvtlv", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtcnl", 7, c(1, 2, 3, 4, 5, 8, 10))
norway <- get_party(ESS,"NO", "prtvtno", c(1, 2), c(3, 4, 5, 7))
poland <- get_party(ESS,"PL", "prtvtbpl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtapt", c(1, 3), c(2, 10, 11))
romania <- get_party(ESS, "RO", "prtvtaro", 99, 99)
russia <- get_party(ESS, "RU", "prtvtaru", 99, 99)
sweden <- get_party(ESS,"SE", "prtvtse", 7, c(2, 3, 5, 6))
slovenia <- get_party(ESS,"SI", "prtvtcsi", 99, 99)
slovakia <- get_party(ESS, "SK", "prtvtask", 99, 99)
turkey <- get_party(ESS, "TR", "prtvtatr", 99, 99)
ukraine <- get_party(ESS, "UA", "prtvtbua", 99, 99)

left.support <- c(belgium, bulgaria, switzerland, cyprus, czechia, 
                  germany, denmark, estonia, spain, finland,
                  france, britain, greece, croatia, hungary, ireland, israel, 
                  latvia,netherlands, norway, poland, portugal, 
                  romania, russia, sweden, slovenia, slovakia, turkey, ukraine)

#-------------Radical Left Support v. Social Democrats ---------
belgium <- get_party(ESS,"BE", "prtvtbbe", 99, 99)
bulgaria <- get_party(ESS, "BG", "prtvtabg", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtbch", 99, 99)
cyprus <- get_party(ESS, "CY", "prtvtcy", 1, 7)
czechia <- get_party(ESS,"CZ", "prtvtacz", 1, 2)
germany <- get_party(ESS,"DE", "prtvbde2", 5, 1)
denmark <- get_party(ESS,"DK", "prtvtbdk", c(4, 9), 1)
estonia <- get_party(ESS, "EE", "prtvtbee", 99, 99)
spain <- get_party(ESS,"ES", "prtvtbes", 3, 2)
finland <- get_party(ESS,"FI", "prtvtafi", 9, 8)
france <- get_party(ESS,"FR", "prtvtbfr", c(3, 4, 7), c(8, 9))
britain <- get_party(ESS,"GB", "prtvtgb", 99, 99)
greece <- get_party(ESS,"GR", "prtvtbgr", 3, 1)
croatia <- get_party(ESS, "HR", "prtvthr", 99, 99)
hungary <- get_party(ESS,"HU", "prtvtbhu", 5, 4)
ireland <- get_party(ESS,"IE", "prtvtie", 6, 3)
israel <- get_party(ESS,"IL", "prtvtail", 99, 99)
latvia <- get_party(ESS, "LV", "prtvtlv", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtcnl", 7, 2)
norway <- get_party(ESS,"NO", "prtvtno", c(1, 2), 3)
poland <- get_party(ESS,"PL", "prtvtbpl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtapt", c(1, 3), 11)
romania <- get_party(ESS, "RO", "prtvtaro", 99, 99)
russia <- get_party(ESS, "RU", "prtvtaru", 99, 99)
sweden <- get_party(ESS,"SE", "prtvtse", 7, 6)
slovenia <- get_party(ESS,"SI", "prtvtcsi", 99, 99)
slovakia <- get_party(ESS, "SK", "prtvtask", 99, 99)
turkey <- get_party(ESS, "TR", "prtvtatr", 99, 99)
ukraine <- get_party(ESS, "UA", "prtvtbua", 99, 99)

left.support.SD <- c(belgium, bulgaria, switzerland, cyprus, czechia, 
                  germany, denmark, estonia, spain, finland,
                  france, britain, greece, croatia, hungary, ireland, israel, 
                  latvia,netherlands, norway, poland, portugal, 
                  romania, russia, sweden, slovenia, slovakia, turkey, ukraine)

#-----------Year Specific Independent Variables-----------
year <- rep("ESS4", nrow(ESS))

#-----------Year Data-----------
ESS4.data <- data.frame(left.support, left.support.SD, country, year, age, gender, religion,
                        education, unemployed, urban, class, subj.income,
                        union, immigrant, trust, anti.immigrant, ethnic.anti.immigrant, 
                        economic.anti.immigrant, ideology, interest, campaign, 
                        egalitarianism, altruism, redistribution, strong.gov, 
                        environment, social.liberalism)
