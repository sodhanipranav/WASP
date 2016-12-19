#---------------------------------------------------------------
# Implementation of WASP for Score Prediction of First Innings
# Author: Pranav Sodhani
# Date: 14/07/2016
#---------------------------------------------------------------
setwd("E:/Acads/Projects/R/")
wdata = read.csv("Cricket_Train_new.csv",header=TRUE)
wdata = wdata[,c(2,3,14,23,25,26,27,30)]    # only required columns
wdata = wdata[which(wdata$Innings==1),]     # filter by first innings
data = wdata                                # temporary storage

#----------------------------------------------------------------
#Calculating R(b,w)
#----------------------------------------------------------------
sumrun <- matrix(0,300,11)
count <- matrix(0,300,11)
for(i in 1:nrow(data))
{
	balls = data[i,8]
	runs = data[i,4]
	wickets = data[i,6]
	sumrun[balls, wickets+1] = sumrun[balls, wickets+1] + runs
	count[balls, wickets+1] = count[balls, wickets+1] + 1
}
runbw <- matrix(0,300,11)
for(i in 1:300)
{
	for(j in 1:11)
	{
		if(count[i,j]>0)
		{
			runbw[i,j] = sumrun[i,j]/count[i,j]
		}
	}
}
#------------------------------------------------------------------
# Calculating P(b,w)
#------------------------------------------------------------------
sumpbw <- matrix(0,300,11)
for(i in 1:nrow(data))
{
	balls = data[i,8]
	runs = data[i,4]
	wickets = data[i,6]
	wicket_ball = data[i+1,7]
	sumpbw[balls, wickets+1] = sumpbw[balls, wickets+1] + wicket_ball
}
pbw <- matrix(0,300,11)
for(i in 1:300)
{
	for(j in 1:11)
	{
		if(count[i,j]>0)
		{
			pbw[i,j] = sumpbw[i,j]/count[i,j]
		}

	}
}
#-------------------------------------------------------------------
#Calculating V(b,w)
#-------------------------------------------------------------------

V <- matrix(0,300,11)
for(i in 299:1)
{
	for(j in 10:1)
	{
		V[i,j] = runbw[i,j] + pbw[i,j]*V[i+1,j+1] + (1-pbw[i,j])*V[i+1,j]
	}
} 		

#-------------------------------------------------------------------
#User Input
#-------------------------------------------------------------------

balls = 90
runs = 128
wickets = 2

Predicted_Score = round(runs + V[balls,wickets+1], digits=0)

print(Predicted_Score)




