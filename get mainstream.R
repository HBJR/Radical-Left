get_mainstream <- function(country_name) {
english_name <- c()
abbr <- c()
name <- c()
  for (i in 1:nrow(parties)){
    if (parties$parties.country_name[i] == country_name){
      if (parties$parties.family_name[i] == "Social democracy" | parties$parties.family_name[i] == "Green/Ecologist"){
        english_name <- append(english_name, parties$parties.party_name_english[i])
        abbr <- append(abbr, parties$parties.party_name_short[i])
        name <- append(name, parties$parties.party_name[i])
      }
    }
  }
  return(data.frame(english_name, abbr, name))
}