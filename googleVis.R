# http://www.milanor.net/blog/?p=1054

### Loading packages
library(XML)
library(googleVis)

### Data import and preparation
url <- "http://www.gdacs.org/Cyclones/report.aspx?eventid=41058&episodeid=28&eventtype=TC"
dat <- readHTMLTable(readLines(url), which = 5)
dat$latlon <- dat[, 8]
levels(dat$latlon) <- sapply(
  strsplit(levels(dat[, 8]), ",\n  	"),
  function(x) paste(x[2], x[1], sep = ":")
)
dat$Category <- factor(dat$Category,
                       levels = levels(dat$Category)[c(6, 7, 1:5)],
                       ordered = TRUE
)
dat$cat <- as.numeric(dat$Category)
dat$Gust_kmh <- dat[, 6]
levels(dat$Gust_kmh) <- sapply(
  strsplit(levels(dat[, 6]), "km"),
  function(x) gsub(" ", "", x[1])
)
dat$Gust_kmh <- as.numeric(as.character(dat$Gust_kmh))

### Plot
M <- gvisGeoChart(
  dat, "latlon",
  sizevar = "cat", colorvar = "Gust_kmh",
  options = list(
    region = "035",
    backgroundColor = "lightblue",
    datalessRegionColor = "grey"
  )
)
plot(M)
