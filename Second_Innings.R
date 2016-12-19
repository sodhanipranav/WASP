#---------------------------------------------------------------
# Implementation of Prediction Model for Winner Prediction in Second Innings
# Author: Pranav Sodhani
# Date: 16/07/2016
#---------------------------------------------------------------
setwd("E:/Acads//Projects/R/")
prbw2 = read.csv("prb2.csv",header=TRUE)
pbw2 = read.csv("pbw1.csv",header=TRUE)

#-------------------------------------------------------------------
#Calculating P(r,b,w)
#-------------------------------------------------------------------

P <- array(0,c(400,300,11))
P[1:6,,] <- 1
for(i in 7:400)
{
  for(j in 299:1)
  {
    for(k in 1:10)
    P[i,j,k] = P[i,j+1,k+1]*prbw2[j,k+2]*pbw2[j,k]+ P[i,j+1,k]*prbw2[j,k+2]*(1-pbw2[j,k]) + P[i-1,j+1,k]*prbw2[j+300,k+2] + P[i-2,j+1,k]*prbw2[j+600,k+2] + P[i-3,j+1,k]*prbw2[j+900,k+2] + P[i-4,j+1,k]*prbw2[j+1200,k+2] + P[i-6,j+1,k]*prbw2[j+1500,k+2] 
  }
} 		

#-------------------------------------------------------------------
#User Input
#-------------------------------------------------------------------

balls = 90
runs = 128
wickets = 5
target = 300

answer= P[target+6-runs, balls, wickets+1]

print(answer)



