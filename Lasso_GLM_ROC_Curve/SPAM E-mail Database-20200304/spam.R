# SPAM E-mail Database
# downloaded from 
# http://web.stanford.edu/~hastie/ElemStatLearn/datasets/spam.info.txt
# http://web.stanford.edu/~hastie/ElemStatLearn/datasets/spam.data
# http://web.stanford.edu/~hastie/ElemStatLearn/datasets/spam.traintest
# 03-05-2016
#
# 
# 
spam <- read.table("spambase/spambase.data",sep=",")

spam.names <- c(read.table("spambase/spambase.names",sep=":",skip=33,nrows=53,as.is=TRUE)[,1],
                "char_freq_#",
                read.table("spambase/spambase.names",sep=":",skip=87,nrows=3,as.is=TRUE)[,1],
                "spam.01")

names(spam) <- spam.names 

n<-dim(spam)[1]
p<-dim(spam)[2]-1

spam.01 <- spam[,p+1]
spam.vars <- as.matrix(spam[,1:p])

cat(paste("n = ",n,', p = ',p,sep=""))
cat(paste("Proportion of spam e-mails =",round(mean(spam.01),2),sep=""))

glm.spam <- glm(spam.01 ~ spam.vars,family=binomial)
summary(glm.spam)
