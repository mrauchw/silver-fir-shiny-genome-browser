# Cloud service hosting for a shiny application

## Introduction

### The Shiny application with genome browser and the silver fir genome data

A [shiny app](https://github.com/szechp/silver-fir-genome-browser/tree/philipp-dev) with a searchable genome browser is used to make it available to the public.

The app uses the reference genome from [the silver fire genome project](https://aforgen.wsl.ch/en/silver-fir-genome-project.html).

The data can be found [here](https://treegenesdb.org/FTP/Genomes/Abal/v1.1/).

The shiny app with genom browser can be found [here](http://3.75.85.217:3838/silverfir/) 


### Requirements

First of all, it is important to know the approximate system requirements.

Since the data for the Shiny app is already prepared, the workflow tools for data preparation are not installed.

A Shiny app is a single-threaded process and memory consumption depends on how much data is loaded. In addition, R, its libraries and the command line tools must be taken into account.

Minimum System Requirements:
 * CPU: ~ 1 Core
 * RAM: ~ 1 GB
 * Disk storage: ~ 30 GB


## Cloud Services

### Hosts

Here are some cloud service examples:
 * Amazon Web Services (AWS)
 * Microsoft Azure
 * DigitalOcean
 * Linode

The Further focus is on AWS.


### Possible cloud service solutions

 1. Hosting the shiny app on [shinyapps.io](https://www.shinyapps.io/), for the data a cloud storage like [AWS S3](https://aws.amazon.com/s3/?nc1=h_ls) and using the R library [aws.s3](https://github.com/cloudyr/aws.s3). 
 1. hosting the Shiny app on a virtual server such as [AWS EC2](https://aws.amazon.com/ec2/?nc1=h_ls).

Since a command line tool is used, the first option is not possible and the AWS EC2 option was chosen.


## Amazon Web Services (AWS) 

### Elastic Compute Cloud (EC2)

An Amazon cloud service with resizable computing capacity.
An overview can be found [here](https://aws.amazon.com/ec2/?nc1=h_ls).

EC2 uses the Amazon Elastic Block Store (EBS) as virtual disc storage.
More information about EBS can be found [here](https://aws.amazon.com/ebs/?nc1=h_ls).

Instructions for the creation of the EC2 can be found [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html).

Instructions for modifying EBS volumes can be found [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modify-volume.html).

To stop, start or restart a running EC2 instance, proceed as follows:
1. To get to the EC2 instances area, it is easiest to enter "EC2" in the search bar at the top. 
1. In the left sidebar click on “Instances”.
1. In the EC2 instance area, a EC2 instance can be right clicked and than select “Stop instance”, “Start instance” or “Reboot instance”.

Detailed information can be found [here](https://catalog.workshops.aws/general-immersionday/en-US/basic-modules/10-ec2/ec2-windows/4-ec2).


### AWS Free Tier for EC2 and EBS

AWS offers three different free tiers to gain initial experience:
 * Free trails (short term)
 * 12 month free 
 * always free

AWS EC2 itself is [12 month free](https://aws.amazon.com/ec2/pricing/?nc1=h_ls) and includes the following:
 * 750 hours per month
 * Operating systems: Linux and Windows
 * t2.micro instance (if t2.micro instance is not available in the chosen region, than t3.micro should be used).
 * EBS: 30 GB
 * Ingoing data transfer via internet: unlimited
 * Outgoing data transfer: 100 GB


More information about the AWS free tier can be found [here](https://aws.amazon.com/free/?nc1=h_ls&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all).

With AWS Budget, the warnings for the consumption of the AWS Free Tier can be set. More information can be found [here](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/tracking-free-tier-usage.html#free-budget).


The AWS price calculator can be found [here](https://calculator.aws/#/?ch=cta&cta=lower-pricing-calc).


### More Informations about AWS

Information about the AWS Management Console can be found [here](https://aws.amazon.com/de/getting-started/hands-on/getting-started-with-aws-management-console/?pg=gs&sec=gtkaws).

Informations about the AWS IAM Identity Centre can be found [here](https://docs.aws.amazon.com/singlesignon/latest/userguide/getting-started.html).


## Set up of the shiny application

A step by step guide to create the shiny app with AWS EC2 can be found [here](https://towardsdatascience.com/how-to-host-a-r-shiny-app-on-aws-cloud-in-7-simple-steps-5595e7885722).


Furthermore, the following packages were installed for the shiny app:
 * R (version 4.1.1)
 * data.table (version 1.14.8)
 * DT (version 0.27)
 * plyr (version 1.8.8)

 * shiny (version 1.7.4)
 * shinythemes (version 1.2.0)
 * shinyWidgets (version 0.7.6)
 * RSQLite (version 2.3.1)
 * XML (version 3.99.0.14)
 * JBrowseR (version 0.9.1)
 * tidyverse (version 2.0.0)
 * BLAST+  (version 2.12.0)

Since no Linux commands could be called in the folder with the over 2.5 million fasta files, the script move_files.sh was written. This can be freely used and adapted for other linux commands.
