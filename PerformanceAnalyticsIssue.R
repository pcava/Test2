#install.packages("PerformanceAnalytics",repos="http://R-Forge.R-project.org")

rm(list=ls())

library(PerformanceAnalytics)

data(edhec); data(weights)

ret <- Return.rebalancing(edhec,weights)
plot(ret)

WI.MyVersion <- cumprod(1+ret)
plot(WI.MyVersion)

WI.PAVersion <- Return.rebalancing(edhec,weights,wealth.index=T)
plot(WI.PAVersion)

WI.PAVersion[12:14]

2000-12-31              1.125135
2001-01-31              1.015059
2001-02-28              1.021760

WI.MyVersion[12:14]

2000-12-31          1.125135
2001-01-31          1.142079
2001-02-28          1.149618

ret[12:14]

2000-12-31       0.020141702
2001-01-31       0.015059401
2001-02-28       0.006601187