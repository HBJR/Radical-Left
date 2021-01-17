get_party <- function(dataset, country, variable, radical, mainstream){
   party_list <- c()   
   for (i in 1:nrow(dataset)){
     if (dataset[i, "cntry"] == country){
       if (dataset[i, variable] %in% NA_real_) {
         party_list <- append(party_list, NA_real_) #if respondent does not provide previous vote, code as NA
       }else if (99 %in% radical){
          party_list <- append(party_list, NA_real_) #if no radical party provided, code all as NA
       }else if(99 %in% mainstream) { 
         if (dataset[i, variable] %in% radical){
           party_list <- append(party_list, 1) #if respondent voted for RLP, code as 1
         }else {
           party_list <- append(party_list, 0) #if no comparison group is provided, code all other responses as 0 
         }
       }else{
         if (dataset[i, variable] %in% radical){
           party_list <- append(party_list, 1) #if respondent voted for RLP, code as 1
         }else if (dataset[i, variable] %in% mainstream){ 
           party_list <- append(party_list, 0) #if respondent voted for mainstream party, code as 0
         }else {
           party_list <- append(party_list, NA_real_) #code all other respondents as NA
         }
       }
     }
   }
   return(party_list)
}
