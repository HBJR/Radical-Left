#--------------Demographics------------
age <- ESS$agea

religion <- ESS$rlgdgr

subj.income <- ESS$hincfel

gender <- recode(ESS$gndr, "1" = 0, "2" = 1)

education <- recode(ESS$eisced, "0" = NA_real_, "55" = NA_real_, "1" = 1, 
                    "2" = 2, "3" = 3, "4" = 4, "5" = 5, "6" = 6, "7" = 7)

country <- ESS$cntry

unemployed <- ESS$uempla

urban <- recode(ESS$domicil, "1" = 1, "2" = 1, "3" = 1, "4" = 0, "5" = 0)

immigrant <- recode(ESS$brncntr, "1" = 0, "2" = 1)
  
class <- c()
for (i in 1:nrow(ESS)) {
  occupation <- ESS[i, "iscoco"] #occupation type
  occupation_status <- ESS[i, "emplrel"] #self employed v. not self-employed
  if (occupation %in% NA_real_){
    occupation_code <- NA_real_ #if NA reported occupation, NA occupation code
  }else if (occupation == 0 | occupation == 100 | occupation == 110 | occupation == 210 | occupation == 300 | occupation == 310) {
    occupation <- toString(occupation)
    occupation_code <- "0" #if in armed forces, set occupation code to 0
  }else {
    occcupation <- toString(occupation)
    occupation_code <- substring(occupation, 1, 1) #else, set occupation code to first letter of isco
  }
  if (occupation_status %in% 2){
    class <- append(class, "self employed") #if respondent reports being self-employed, code as self-employed
  }else if(occupation_status %in% NA_real_){
    class <- append(class, NA_real_) #if respondent does not report employment status, code as NA
  }else if (occupation_code %in% NA_real_){
    class <- append(class, NA_real_) #if respondent does not report occupation, code as NA
  }else if (occupation_code == "0"){
    class[i] <- "armed forces"
  }else if (occupation_code == "1"){
    class[i] <- "manager"
  }else if (occupation_code == "2"){
    class[i] <- "professional"
  }else if (occupation_code == "3"){
    class[i] <- "technician"
  }else if (occupation_code == "4"){
    class[i] <- "clerks"
  }else if (occupation_code == "5"){
    class[i] <- "service worker"
  }else if (occupation_code == "6"){
    class[i] <- "skilled agricultural"
  }else if (occupation_code == "7"){
    class[i] <- "craft worker"
  }else if (occupation_code == "8"){
    class[i] <- "machine/production worker"
  }else if (occupation_code == "9") {
    class[i] <- "unskilled professions"
  }
}

union <- recode(ESS$mbtru, "1" = 1, "2" = 1, "3" = 0)

#--------------Ideology------------
ideology <- ESS$lrscale

redistribution <- ESS$gincdif

environment <- ESS$impenv

social.liberalism <- ESS$freehms
#--------------Political Orientations------------
trust <- c()
for (i in 1:nrow(ESS)){
  trust <- append(trust, mean(c(ESS$trstprl[i], ESS$trstplt[i], ESS$trstprt[i]), na.rm = TRUE))
}

interest <- ESS$polintr

egalitarianism <- ESS$ipeqopt

strong.gov <- ESS$ipstrgv

campaign <- ESS$wrkprty

altruism <- ESS$iphlppl

#--------------Anti-Immigrant Variables------------
ESS <- ESS %>% mutate(econ = recode(imbgeco, "0" = 10, 
                                   "1" = 9, "2" = 8, "3" = 7, "4" = 6, "5" = 5, "6" = 4, 
                                   "7" = 3, "8" = 2, "9" = 1, "10" = 0))

ESS <- ESS %>% mutate(culture = recode(imueclt, "0" = 10, 
                                    "1" = 9, "2" = 8, "3" = 7, "4" = 6, "5" = 5, "6" = 4, 
                                    "7" = 3, "8" = 2, "9" = 1, "10" = 0))

ESS <- ESS %>% mutate(general = recode(imwbcnt, "0" = 10, 
                                       "1" = 9, "2" = 8, "3" = 7, "4" = 6, "5" = 5, "6" = 4, 
                                       "7" = 3, "8" = 2, "9" = 1, "10" = 0))

ethnic.anti.immigrant <- ESS$culture

economic.anti.immigrant <- ESS$econ

anti.immigrant <- ESS$general
