
## Create by Eduardo Kamioka on 2018.02.03
## Basic R functions to submit and recover
## results from URLScan.io through API
##
## Thanks to Johannes Gilger for providing the API key
##
## Usage:
## submit.object = urlscan.io.submit(url.to.submit = "https://urlscan.io", 
##                                   api.key = "your-api-here")
##
## url.results = urlscan.io.result(submit.object)
##


##
## Please make sure you have the following packages installed
##
require(httr)
require(jsonlite)


##
## Function to submit URLs to the API
##
## It will require an URL.TO.SUBMIT and an API.KEY as input
##
## It will return a R list I called SUBMIT.OBJECT with the 
## information to recover the results from the API

urlscan.io.submit <- function(url.to.submit,
			                                    submit.public = "on",
							                                  submit.encode = "json",
							                                  api.key) {
	  req <- httr::POST(url = "https://urlscan.io/api/v1/scan/",
			                        body = list(url = url.to.submit, public = submit.public),
						                    encode = submit.encode, 
						                    config = httr::add_headers("API-Key" = api.key))
  print(req)
    return(req)
}


##
## Function to recover the results from the API
##
## It will receive as input the SUBMIT OBJECT returne from the function above
##
## It will return a R list containing the URL scan results :)

urlscan.io.result <- function(submit.object) ## Returned object from urlscan.io.submit()
{
	  req.data <- httr::content(submit.object)
  print(paste0("Result stored on:", req.data$result))
    req.data <- jsonlite::fromJSON(req.data$api)
    return(req.data)
}

## The SEARCH function is coming soon (I hope)



