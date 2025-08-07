setwd("C:/Users/hp/Downloads")
dir.create("Module_I")
setwd("Module_I")
dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("tasks")
dir.create("plots")
file.copy(from = "C:/Users/hp/Downloads/patient_info.xlsx", to="raw_data/patient_info.xlsx")
success <- file.copy(from = "C:/Users/hp/Downloads/patient_info.xlsx", 
                     to = "raw_data/patient_info.xlsx", overwrite = TRUE)
print(success) 


library(readxl)
data <- read_excel("raw_data/patient_info.xlsx")
print(dim(data))     
print(head(data))    
print(str(data))
head(data)
str(data)
names(data)
data$age <- as.numeric(data$age)
data$gender <- as.factor(data$gender)



data$smoking_binary <-ifelse(data$smoker=="Yes",1,0)
data$smoking_binary <-as.factor(data$smoking_binary)

write.csv(data,"clean_data/patient_info_clean.csv",row.names = FALSE)

