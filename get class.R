get_self_employed <- function(dataset, variable){
  self_employed <- c()
  for (i in 1:nrow(dataset)){
    occupation_status <- dataset[i, variable]
    if (occupation_status %in% 2){
      self_employed <- append(self_employed, "self employed")
    }else if(occupation_status %in% NA_real_){
      self_employed <- append(self_employed, NA_real_)
    }else {
      self_employed <- append(self_employed, 0)
    }
  }
  return(self_employed)
}

get_class <- function(dataset, data, variable){
  for (i in 1:nrow(dataset)){
    occupation <- toString(dataset[i, variable])
    if (occupation == "0" | occupation == "100" | occupation == "110" | occupation == "210" | occupation == "300" | occupation == "310") {
      paste(c(0, occupation), collapse = '')
    }
    occupation_code <- substring(occupation, 1, 1)
    if (data[i] %in% NA_real_){
      data[i] <- data[i]
    }else if (data[i] == "self employed"){
      data[i] <- data[i]
    }else if (occupation_code == "0"){
      data[i] <- "armed forces"
    }else if (occupation_code == "1"){
      data[i] <- "manager"
    }else if (occupation_code == "2"){
      data[i] <- "professional"
    }else if (occupation_code == "3"){
      data[i] <- "technician"
    }else if (occupation_code == "4"){
      data[i] <- "clerks"
    }else if (occupation_code == "5"){
      data[i] <- "service worker"
    }else if (occupation_code == "6"){
      data[i] <- "skilled agricultural"
    }else if (occupation_code == "7"){
      data[i] <- "craft worker"
    }else if (occupation_code == "8"){
      data[i] <- "machine/production worker"
    }else if (occupation_code == "9") {
      data[i] <- "unskilled professions"
    }
  }
  return(data)
}