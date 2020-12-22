## InterSystems IRIS NLP Website Analyzer
This is an InterSystems IRIS NLP Website Analyzer. It extracts all HTML content from a site and related content, using crawler and uses IRIS NLP to analyze the website content.

## What The the app does

This application receive a URL, use a Crawler to extract all website content and analyze it using NLP  

## Website-Analyzer - IRIS NLP and Crawler4J in action!
<img src="https://github.com/yurimarx/website-analyzer/raw/master/crawler-website-analizer.gif" alt="IRIS NLP and Crawler4J in action">

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.


## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/website-analyzer.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```
## How to Run the Ocr Production

1. Open the [production](http://localhost:52773/csp/irisapp/EnsPortal.ProductionConfig.zen?PRODUCTION=dc.WebsiteAnalyzer.WebsiteAnalyzerProduction) 

2. Set Depth and TotalPages to the Crawler. Depth is how many subpages will be crawled and TotalPages is how many pages will be processed. Tip: start with Depth 0 and 5 pages, to be a fast initial test.

3. Start the production.

4. Now Open Postman or create a request in a browser pointing to localhost:9980?Website=https://www.intersystems.com/ using GET. Choose any website changing https://www.intersystems.com/ to any site (e.g.: yoursite.com)

5. Go to the [NLP Domain Explorer](http://localhost:52773/csp/IRISAPP/_iKnow.UI.KnowledgePortal.zen?$NAMESPACE=IRISAPP&domain=1)

6. Analyze the texts and enjoy!