# https://plot.ly/api/r

# step 1 - download & install
# devtools::install_github("plotly/R-api")

# step 2 - register with Plotly's API (easier via website)
# library(plotly)
# username='pcavatore'
# email='pcavatore@gmail.com'
# response = signup(pcavatore, pcavatore@gmail.com)
# tmp_pw = response$tmp_pw
# api_key = response$api_key

# step 3 - sign in and initialize a plotly graphing object
# library(plotly)
# p <- plotly(username=username, key=api_key)
#You will interact with your plotly graphs through 3 methods: p$plot, p$style, p$layout


## http://www.r-statistics.com/2013/12/plotly-beta-collaborative-plotting-with-r/ ##

#example 0 - initialize a plotly object with your username and api_key, then make a graph
library(plotly)
p <- plotly(username="pcavatore", key="dfvqyuqgzi")
res <- p$plotly(c(1,2,3), c(4,2,1))

#example 1 - Overlaid Histogram
p <- plotly(username="pcavatore", key="dfvqyuqgzi")
x0 = rnorm(500)
x1 = rnorm(500)+1
data0 = list(x=x0,
             type='histogramx',
             opacity=0.8)
data1 = list(x=x1,
             type='histogramx',
             opacity=0.8)
layout = list(barmode='overlay')  
response = p$plotly(data0, data1, kwargs=list(layout=layout))
browseURL(response$url)
#Press “Save a Copy” to start styling from the GUI
#poi si può 1. cambiare il tipo di grafico, 
#2. analizzare i dati e 3. pubblicare come iframe in un sito o blog

#example 2 - Heatmap
p <- plotly(username="pcavatore", key="dfvqyuqgzi")
z <- matrix(rep(runif(38,0,38),26),26)
#random.sample(range(0, 41),41) for j in range(8)]
z <- tapply(z,(rep(1:nrow(z),ncol(z))),function(i)list(i))
cs <- list(
  c(0,"rgb(12,51,131)"),
  c(0.25,"rgb(10,136,186)"),
  c(0.5,"rgb(242,211,56)"),
  c(0.75,"rgb(242,143,56)"),
  c(1,"rgb(217,30,30)")
)
data <- list(
  z = zd,
  scl = cs,
  type = 'heatmap'
)
response <- p$plotly(data)
browseURL(response$url)

#example 3 - Log-normal Boxplot
p <- plotly(username="pcavatore", key="dfvqyuqgzi")
x <- c(seq(0,0,length=1000),seq(1,1,length=1000),seq(2,2,length=1000))
y <- c(rlnorm(1000,0,1),rlnorm(1000,0,2),rlnorm(1000,0,3))
s <- list(
  type = 'box',
  jitter = 0.5
)
layout <- list(
  title = 'Fun with the Lognormal distribution',
  yaxis = list(
    type = 'log'
  )
)
response <- p$plotly(x,y, kwargs = list(layout = layout, style=s))
browseURL(response$url)

