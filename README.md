# Cloud service hosting

## Introduction

### Shiny app and silver fire genom data

A [shiny app](https://github.com/szechp/silver-fir-genome-browser/tree/philipp-dev) with a searchable genome browser is used to make it available to the public. 

The app uses the reference genome from [the silver fire genome project](https://aforgen.wsl.ch/en/silver-fir-genome-project.html).

The data can be found [here](https://treegenesdb.org/FTP/Genomes/Abal/v1.1/).



### Requirements

First of all it is important to know the approximate system requirements.

Since the data for the shiny app is already prepared, the data preparation workflow tools are not installed.

A Shiny app is a single-threaded process and the memory usage depends on how much data is loaded. In addition R, its libraries and the command line tools must be taken into account.

R, Shiny App and command line tools:
 * CPU: ~ 1 Core 
 * RAM: ~ 100 MB (with nblast +500 MB)
 * Disk storage: ~ 5 GB

Ubuntu Server Edition:
 * CPU: ~ 1 Core 
 * RAM: ~ 256 MB
 * Disk storage: ~ 2-5 GB
 
Minimum System Requirements:
 * CPU: ~ 1 Core
 * RAM: ~ 1 GB
 * Disk storage: ~ 10 GB

Recommended System Requirements:
 * CPU: ~ 2-4 Core
 * RAM: ~ 2 GB
 * Disk storage: ~ 10 GB


## Cloud Services

### Hosts

Here are some cloud service examples:
 * Amazon Web Services (AWS)
 * Microsoft Azure
 * google cloud platform
 * kyndryl
 * digitalOcean

The Further focus is on AWS.

### Possible Solutions

 1. Hosting the shiny app on [shinyapps.io](https://www.shinyapps.io/), for the data a cloud storage like [AWS S3](https://aws.amazon.com/de/s3/?nc=sn&loc=0) and using the R library [aws.s3](https://github.com/cloudyr/aws.s3). 
 1. Hosting the shiny app on virtual server like [AWS EC2](https://aws.amazon.com/de/ec2/?nc2=h_ql_prod_fs_ec2)

Since command line tools are used, the first option is not possible and the AWS EC2 option was chosen.
