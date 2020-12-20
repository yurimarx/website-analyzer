## InterSystems IRIS NLP Website Analyzer
This is an InterSystems IRIS NLP Website Analyzer. It extracts all HTML content from a site and related content, using crawler and uses IRIS NLP to analyze the website content.

## What The the app does

This application receive a URL, use a Crawler to extract all website content and analyze it using NLP  

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
