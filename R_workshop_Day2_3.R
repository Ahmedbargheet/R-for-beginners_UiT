#Importing the data 

#csv
data <- read.csv("C:\\Users\\amost\\OneDrive\\Desktop\\data.csv")

#txt and tsv
data <- read.delim("D:\\manuscripts\\PINGU\\attributes.tsv")
data <- read.delim("D:\\manuscripts\\PINGU\\PINGU_Biosample.txt")

#Excel file
library(readxl)
data <- read_excel("D:/New folder/R material/input_data/Co_occ.xlsx", sheet = "EP_new")

data <- read.csv("C:\\Users\\amost\\OneDrive\\Desktop\\data.csv")
class(data)

data$X

mean(data$X)
median(data$X)
quantile(data$X)
min(data$X)
max(data$X)
sum(data$X)
summary(data)
sd(data$X)
########################################################################
#View the data
View(data)
########################################################################
#View the first or last 6 rows
head(data)
tail(data)
########################################################################
#Specify the nbo. of column and rows to view
data[1:5,1:6]
########################################################################
#View the rows and columns
data[1,]
data[1,2]
########################################################################
#Export the data
write.csv(data, "C:\\Users\\amost\\OneDrive\\Desktop\\data.csv")
################################################################################################################################################
#maniupulating thew data
library(reshape2)
library(tidyverse)
library(cleaner)

#Frequency table
data$gender
freq(data$gender)
freq(data$mo)
#################################################
#Add new column

#a %>% mutate(New = age + 10) %>% mutate(New_1 = id*2) %>% mutate(New_2 = log10(age)) %>% mutate(New_3 = age/mean(age))
#################################################
#Select columns

a %>% select(age,name)
data %>% select(hospital_id, gender, age, patient_id)
#################################################
#Filtering the data

data %>%filter(hospital_id == "B")
data %>%filter(ward_clinical == "TRUE")
data %>%filter(age > 95)
data %>%filter(age >= 95)
data %>%filter(age < 15)
data %>%filter(age != 15)
data %>% filter(hospital_id=="A",ward_clinical == FALSE, age < 90)

#Filter according to two criteria
data %>% filter(age ==50 | age ==90)
data %>%filter(grepl('15|14', age))
data %>% filter(age %in% c(14,15))

data %>%filter(mo == "B_ESCHR_COLI" | mo == "B_STPHY_EPDR")
data %>%filter(grepl('B_ESCHR_COLI|B_STPHY_EPDR',mo))
#################################################
#Importance of piping
filter(select(data,hospital_id,gender), gender=="F")
data %>% select(hospital_id, gender) %>% filter(gender == "F")
#################################################
#Sorting the data
arrange(a,age)

#Ascending
a %>% arrange(age)

#Decending
a %>% arrange(desc(age))



