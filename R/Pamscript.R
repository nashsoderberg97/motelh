
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

pamtotal <- rbind(pam31, pam02, pam05, pam07, pam09, pam12, pam14, pam16)
            

boxplot(pamtotal$Fv.Fm~pam1$newcolumn)
anova(lm(pam1$Fv.Fm~pam1$Tank))
