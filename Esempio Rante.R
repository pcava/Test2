#thank you Bank of America Merrill Lynch and St. Louis Fed for this data
require(quantmod)
require(PerformanceAnalytics)
require(ggplot2)
#get Bank of America Merrill Lynch bond index data from St. Louis Fed
#use auto.assign = FALSE so we can use shorter names
MLCorpMaster<-getSymbols("BAMLCC0A0CMTRIV",src="FRED",auto.assign=FALSE)
MLHYMaster<-getSymbols("BAMLHYH0A0HYM2TRIV", src="FRED", auto.assign=FALSE)
MLBondIndexes<-na.omit(merge(ROC(MLCorpMaster,1,type="discrete"),ROC(MLHYMaster,1,type="discrete")))
colnames(MLBondIndexes)<-c("BAC ML Corporate Master","BAC ML High Yield Master II")
charts.PerformanceSummary(MLBondIndexes,ylog=TRUE,
    colorset=c("cadetblue","darkolivegreen3"),
    main="Bank of America Merrill Lynch Bond Indicies from St. Louis Fed")
#do some downside analysis on monthly returns
MLBondIndexes<-merge(monthlyReturn(MLCorpMaster),monthlyReturn(MLHYMaster))
colnames(MLBondIndexes)<-c("BAC ML Corporate Master","BAC ML High Yield Master II")
downsideTable<-melt(cbind(rownames(table.DownsideRisk(MLBondIndexes)),table.DownsideRisk(MLBondIndexes)))
colnames(downsideTable)<-c("Statistic","BondIndex","Value")
ggplot(downsideTable, stat="identity", aes(x=Statistic,y=Value,fill=BondIndex)) + geom_bar(position="dodge") + coord_flip() 
yearReturns<-na.omit(table.CalendarReturns(MLBondIndexes)[,(13:NCOL(table.CalendarReturns(MLBondIndexes)))])
yearReturns<-melt(cbind(rownames(yearReturns),yearReturns))
colnames(yearReturns)<-c("Year","BondIndex","Return")
ggplot(yearReturns, stat="identity", aes(x=Year,y=Return,fill=BondIndex)) + geom_bar(position="dodge")
