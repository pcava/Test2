# http://www.quandl.com/help/api
# http://www.quandl.com/help/packages/r
# https://github.com/quandl/R-package

rm(list=ls())

require(xts); require(Quandl)

#authenticationtoken - under your account API 
Quandl.auth("QaouhGqFcaaommmFiCib")

#get data
data <- Quandl("NSE/OIL")
spx <- Quandl(code="YAHOO/INDEX_GSPC",type="xts",start_date="2000-01-01",end_date="2013-10-31",)
spx.MonthlyRet <- Quandl(code="YAHOO/INDEX_GSPC",type="xts",start_date="2000-01-01",
                         end_date="2013-10-31",transformation="rdiff",collapse="monthly")[,6]

#plot example
plot(stl(Quandl("GOOG/NASDAQ_GOOG",type="ts",collapse="monthly")[,1],s.window="per"))

#Upload example
mydata = Quandl("NSE/OIL", rows=5)
Quandl.push(code="TEST2", username="pcavatore", name="This is a test dataset2", 
            description="This is a  description",data=mydata)
#and if you want to update one of your datasets that has already been created 
#add update=TRUE otherwise it will ask you if you want you to update.

#testing to overwrite existing one and append some new data
mydata2 = mydata[1,]
mydata2[1,2] = mydata2[1,2]+10
mydata3 = mydata2
mydata3[1,1] = mydata2[1,1]+1
mydata4 = rbind(mydata3,mydata2)
Quandl.push(code="TEST2", username="pcavatore", name="This is a test dataset2", 
              description="This is a  description",data=mydata4, update=T)