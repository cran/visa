## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo=TRUE----------------------------------------------------------------
# check the data type of `NSpec.DF`
library(visa)
data(NSpec.DF)
class(NSpec.DF) 
class(NSpec.DF$spectra)
str(NSpec.DF$spectra)

## ----echo=TRUE----------------------------------------------------------------
# check the data type of `NSpec.Lib`
class(NSpec.Lib) 
class(NSpec.Lib@spectra) 
str(NSpec.Lib@spectra)

## ----echo=TRUE, warning=FALSE-------------------------------------------------
library(visa)
data(NSpec.DF)
x <- NSpec.DF$N # nitrogen
S <- NSpec.DF$spectra[, seq(1, ncol(NSpec.DF$spectra), 10)] # resampled to 10 nm steps
cm <- cm.nsr(S, x, cm.plot = TRUE)

## ----fig.show='hold', fig.cap = "Plot of correlation matrix"------------------
# use the output from last example
# cm <- cm.nsr(S, x)
# Plotting the correlation matrix
#ggplot.cm(cm) # deprecated

plt.2dcm(cm) # new function replacing ggplot.cm


## ----echo=TRUE, results='asis'------------------------------------------------
library(visa)
# check the data type
class(NSpec.Lib) 
# data structure
# str(NSpec.Lib)
# print the first 10 columns
knitr::kable(head(NSpec.Lib@spectra[,1:10]))

## ----echo=TRUE, results='asis'------------------------------------------------
# check the data type
class(NSpec.DF) 
# check whether it contains the same data as 'NSpec.Lib'
knitr::kable(head(NSpec.DF$spectra[,1:10]))

## ----echo=TRUE, results='asis'------------------------------------------------
#library(visa)
#data(NSpec.DF)
spec <- spectra(NSpec.DF)
# check whether it contains the same data as 'NSpec.Lib'
knitr::kable(head(spec[,1:10]))

## ----echo=TRUE, results='asis'------------------------------------------------
#library(visa)
#data(NSpec.DF)
spec <- wavelength(NSpec.DF)
# check whether it contains the same data as 'NSpec.Lib'
str(spec)

## ----echo=TRUE, results='asis'------------------------------------------------
slib <- as.spectra(spectra = matrix(rnorm(100), nrow = 10), 
                   wavelength = 1:10, 
                   w.unit = "nm", 
                   data = data.frame(y=rnorm(10))
                   )
str(slib)

## ----echo=TRUE, results='asis'------------------------------------------------
s.df <- as.spectra.dataframe(spectra = matrix(rnorm(100), nrow = 10),
                             wavelength = 1:10,
                             w.unit = "nm",
                             data = data.frame(y=rnorm(10))
                             )
str(s.df)

