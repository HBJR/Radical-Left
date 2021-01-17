ESS <- import("ESS3.dta")
source("get_party.R")
source("Independent Variables.R")

#-------------Radical Left Support v. Mainstream Parties--------
austria <- get_party(ESS, "AT", "prtvtaat", 99, 99)
belgium <- get_party(ESS,"BE", "prtvtabe", 99, 99)
bulgaria <- get_party(ESS, "BG", "prtvtbg", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtach", 99, 99)
cyprus <- get_party(ESS, "CY", "prtvtcy", 1, c(2, 3, 4, 6, 7))
germany <- get_party(ESS,"DE", "prtvbde2", 5, c(1, 2, 4))
denmark <- get_party(ESS,"DK", "prtvtadk", c(5, 10), c(1, 2, 3, 4, 7, 8))
estonia <- get_party(ESS, "EE", "prtvtaee", 99, 99)
spain <- get_party(ESS,"ES", "prtvtaes", 3, c(1, 2))
finland <- get_party(ESS,"FI", "prtvtfi", 10, c(1, 3, 6, 9))
france <- get_party(ESS,"FR", "prtvtafr", c(4, 5, 9), c(2, 8, 10, 11, 12, 13))
britain <- get_party(ESS,"GB", "prtvtagb", 99, 99)
hungary <- get_party(ESS,"HU", "prtvtahu", 5, c(1, 2, 4, 6))
ireland <- get_party(ESS,"IE", "prtvtie", 6, c(1, 2, 3, 4))
latvia <- get_party(ESS, "LV", "prtvtlv", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtbnl", 7, c(1, 2, 3, 4, 5, 8, 10))
norway <- get_party(ESS,"NO", "prtvtno", c(1, 2), c(3, 4, 5, 7))
poland <- get_party(ESS,"PL", "prtvtapl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtapt", c(1, 3), c(2, 10, 11))
romania <- get_party(ESS, "RO", "prtvtro", 99, 99)
russia <- get_party(ESS, "RU", "prtvtru", 99, 99)
sweden <- get_party(ESS,"SE", "prtvtse", 7, c(2, 3, 5, 6))
slovenia <- get_party(ESS,"SI", "prtvtbsi", 99, 99)
slovakia <- get_party(ESS, "SK", "prtvtask", 99, 99)
ukraine <- get_party(ESS, "UA", "prtvtaua", 99, 99)

left.support <- c(austria, belgium, bulgaria, switzerland, cyprus, 
                  germany, denmark, estonia, spain, finland,
                  france, britain, hungary, ireland, latvia, 
                  netherlands, norway, poland, portugal, romania, russia,
                  sweden, slovenia, slovakia, ukraine)

#--------------Radical Left Support v. Social Democrats-------
austria <- get_party(ESS, "AT", "prtvtaat", 99, 99)
belgium <- get_party(ESS,"BE", "prtvtabe", 99, 99)
bulgaria <- get_party(ESS, "BG", "prtvtbg", 99, 99)
switzerland <- get_party(ESS,"CH", "prtvtach", 99, 99)
cyprus <- get_party(ESS, "CY", "prtvtcy", 1, 7)
germany <- get_party(ESS,"DE", "prtvbde2", 5, 1)
denmark <- get_party(ESS,"DK", "prtvtadk", c(5, 10), 1)
estonia <- get_party(ESS, "EE", "prtvtaee", 99, 99)
spain <- get_party(ESS,"ES", "prtvtaes", 3, 2)
finland <- get_party(ESS,"FI", "prtvtfi", 10, 9)
france <- get_party(ESS,"FR", "prtvtafr", c(4, 5, 9), 10)
britain <- get_party(ESS,"GB", "prtvtagb", 99, 99)
hungary <- get_party(ESS,"HU", "prtvtahu", 5, 4)
ireland <- get_party(ESS,"IE", "prtvtie", 6, 3)
latvia <- get_party(ESS, "LV", "prtvtlv", 99, 99)
netherlands <- get_party(ESS,"NL", "prtvtbnl", 7, 2)
norway <- get_party(ESS,"NO", "prtvtno", c(1, 2), 3)
poland <- get_party(ESS,"PL", "prtvtapl", 99, 99)
portugal <- get_party(ESS,"PT", "prtvtapt", c(1, 3), 11)
romania <- get_party(ESS, "RO", "prtvtro", 99, 99)
russia <- get_party(ESS, "RU", "prtvtru", 99, 99)
sweden <- get_party(ESS,"SE", "prtvtse", 7, 6)
slovenia <- get_party(ESS,"SI", "prtvtbsi", 99, 99)
slovakia <- get_party(ESS, "SK", "prtvtask", 99, 99)
ukraine <- get_party(ESS, "UA", "prtvtaua", 99, 99)

left.support.SD <- c(austria, belgium, bulgaria, switzerland, cyprus, 
                  germany, denmark, estonia, spain, finland,
                  france, britain, hungary, ireland, latvia, 
                  netherlands, norway, poland, portugal, romania, russia,
                  sweden, slovenia, slovakia, ukraine)

#--------------Year Specific Independent Variables-------
year <- rep("ESS3", nrow(ESS))

#--------------Year Data------------
ESS3.data <- data.frame(left.support, left.support.SD, country, year, age, gender, religion,
                        education, unemployed, urban, class, subj.income,
                        union, immigrant, trust, anti.immigrant, ethnic.anti.immigrant, 
                        economic.anti.immigrant, ideology, interest, campaign, 
                        egalitarianism, altruism, redistribution, strong.gov, 
                        environment, social.liberalism)
