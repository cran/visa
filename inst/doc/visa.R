## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=TRUE, warning=FALSE------------------------------------------------
library(visa)
data(NSpec.DF)
x <- NSpec.DF$N # nitrogen
S <- NSpec.DF$spectra[, seq(1, ncol(NSpec.DF$spectra), 10)] # resampled to 10 nm steps
cm <- cm.nsr(S, x, cm.plot = TRUE)

## ---- fig.show='hold', fig.cap = "Plot of correlation matrix"-----------------
# use the output from last example
# cm <- cm.nsr(S, x)
# Plotting the correlation matrix
ggplot.cm(cm)


## ---- echo=TRUE, results='asis'-----------------------------------------------
library(visa)
# check the data type
class(NSpec.DB) 
# data structure
# str(NSpec.DB)
# print the first 10 columns
knitr::kable(head(NSpec.DB@spectra[,1:10]))

## ---- echo=TRUE, results='asis'-----------------------------------------------
# check the data type
class(NSpec.DF) 
# check whether it contains the same data as 'NSpec.DB'
knitr::kable(head(NSpec.DF$spectra[,1:10]))

