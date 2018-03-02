#Loads pam data, then takes the columns with data, then reads the date column as dates
pam31 <- read.table(file = "data/pam/pam20180131.tsv", fill = TRUE, header = T, sep = "\t")
pam31 <- pam31[,1:3]
pam31$date <- as.Date("2018-01-31")

pam02 <- read.table(file = "data/pam/pam20180202.tsv", fill = TRUE, header = T, sep = "\t")
pam02 <- pam02[,1:3]
pam02$date <- as.Date("2018-02-02")

pam05 <- read.table(file = "data/pam/pam20180205.tsv", fill = TRUE, header = T, sep = "\t")
pam05 <- pam05[,1:3]
pam05$date <- as.Date("2018-02-05")

pam07 <- read.table(file = "data/pam/pam20180207.tsv", fill = TRUE, header = T, sep = "\t")
pam07 <- pam07[,1:3]
pam07$date <- as.Date("2018-02-07")

pam09 <- read.table(file = "data/pam/pam20180209.tsv", fill = TRUE, header = T, sep = "\t")
pam09 <- pam09[,1:3]
pam09$date <- as.Date("2018-02-09")

pam12 <- read.table(file = "data/pam/pam20180212.tsv", fill = TRUE, header = T, sep = "\t")
pam12 <- pam12[,1:3]
pam12$date <- as.Date("2018-02-12")

pam14 <- read.table(file = "data/pam/pam20180214.tsv", fill = TRUE, header = T, sep = "\t")
pam14 <- pam14[,1:3]
pam14$date <- as.Date("2018-02-14")

pam16 <- read.table(file = "data/pam/pam20180216.tsv", fill = TRUE, header = T, sep = "\t")
pam16 <- pam16[,1:3]
pam16$date <- as.Date("2018-02-16")

pam23 <- read.table(file = "data/pam/pam20180223.tsv", fill = TRUE, header = T, sep = "\t")
pam23 <- pam23[,1:3]
pam23$date <- as.Date("2018-02-23")

pam28 <- read.table(file = "data/pam/pam20180228.tsv", fill = TRUE, header = T, sep = "\t")
pam28 <- pam28[,1:3]
pam28$date <- as.Date("2018-02-28")

pamtotal <- rbind(pam31, pam02, pam05, pam07, pam09, pam12, pam14, pam16, pam23, pam28)
            
boxplot(pamtotal$Fv.Fm~pamtotal$date)
anova(lm(pam1$Fv.Fm~pam1$Tank))

#reads treatment from tank and puts in column "treatment" of pamtotal
pamtotal$treatment <- substr(pamtotal$Tank, 4, 5)

control <- subset(pamtotal, treatment == "C")

boxplot(control$Fv.Fm~control$date)

light <- subset(pamtotal, treatment == "HL")

boxplot(light$Fv.Fm~light$date)

heat <- subset(pamtotal, treatment == "HT")

boxplot(heat$Fv.Fm~heat$date)
