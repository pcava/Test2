# http://stat.ethz.ch/R-manual/R-patched/library/utils/html/BATCH.html
# R CMD BATCH [options] infile [outfile]

# http://www.statmethods.net/interface/batch.html
# on Microsoft Windows (adjust the path to R.exe as needed) 

# "F:\R\R-2.15.1\bin\R.exe" CMD BATCH 
   --vanilla --slave "F:\R\Paolo\Test\script1.R"

# "F:\R\R-2.15.1\bin\R.exe" CMD BATCH 
   --vanilla --slave "F:\R\Paolo\Test\script2.R"

"F:\R\R-2.15.1\bin\R.exe" CMD BATCH --vanilla --slave "F:\R\Paolo\Test\SDAFE02.R"