
## Basic R functions to submit and recover results from URLScan.io through API

## Usage:

1. Load the code into R:
```
> source(urlscan.io.R)
```

2. Get the SUBMIT OBJECT:
```
> submit.object = urlscan.io.submit(url.to.submit = "https://urlscan.io", 
                                    api.key = "your-api-here")

Response [https://urlscan.io/api/v1/scan/]
  Date: 2018-02-03 23:23
  Status: 200
  Content-Type: application/json; charset=utf-8
  Size: 438 B
{
  "message": "Submission successful",
  "uuid": "8647950e-b7e0-4df4-8f2a-e68b88c288e6",
  "result": "https://urlscan.io/result/8647950e-b7e0-4df4-8f2a-e68b88c288e6/",
  "api": "https://urlscan.io/api/v1/result/8647950e-b7e0-4df4-8f2a-e68b88c288e6/",
  "visibility": "public",
  "options": {
    "useragent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36"
  } 
```

3. Get the URL scan results:
```
> url.results = urlscan.io.result(submit.object)
[1] "Result stored on:https://urlscan.io/result/8647950e-b7e0-4df4-8f2a-e68b88c288e6/"
```

4. Explore/Use the data as you want:
```
> class(url.results)
[1] "list"


> names(url.results)
[1] "data"  "stats" "meta"  "task"  "page"  "lists"
```

## Thanks to Johannes Gilger for providing the API key
