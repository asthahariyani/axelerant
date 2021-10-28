# Assignment 3
***
In this project we have deployed an EC2 Instance on AWS and demonstrated how we can alert the support team when instance or server RAM usage is greater than 60%, disk space usage is greater than 80%, or CPU usage greater than 70%.
We have made use of Cloud Watch and Cloud Watch Agent Services for this demonstration.

## Table of Contents
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Installation](#installation)


## General Info
***
In this project we have deployed an EC2 Instance on AWS and demonstrated how we can alert the support team when instance or server RAM usage is greater than 60%, disk space usage is greater than 80%, or CPU usage greater than 70%.
We have made use of Cloud Watch and Cloud Watch Agent Services for this demonstration.
The Cloud Watch alone is not sufficient to read disk and memory usage of the EC2 Instance thus we included cloud watch agent. The cloud watch agent is given permission to read the memeory and disk space data and further pass it on to cloud watch which analyses it.

## Technologies
- Instancing Service: AWS EC2
- Monitoring Tool: Cloud Watch
- Alert Tool: SNS

## Installation
- Created an EC2 Instance
- Created a cloud watch agent and attacched the IAM role to the EC2 Instance
- ssh into the instance and run the following commnadS:
```
$ ssh -i <path to pem file> ubuntu@publicip
$ wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
$ sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
$ sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
$ sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json
$ sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status
```
- Below are the results while running the commands and setting up our cloud watch agent
![agent_start](https://github.com/asthahariyani/axelerant/blob/main/Images/agent_start.png)
![agent_staus](https://github.com/asthahariyani/axelerant/blob/main/Images/agent_status.png)

- Belo is the agent config file obtained at the end through wizard setup
![agent_config](https://github.com/asthahariyani/axelerant/blob/main/Images/agent_config.png)

- As seen below all the required metrics now show up in Cloud watch
![ec2_metrics](https://github.com/asthahariyani/axelerant/blob/main/Images/ec2_metrics.png)

- Now we will set up alarm corresponding to the metrics, as shown below
For eg. we will select CPU Utilisation metrics
![cpu_utilisationmetric](https://github.com/asthahariyani/axelerant/blob/main/Images/metric.png)

- Now we will specify the threshold 
![specify_threshold](https://github.com/asthahariyani/axelerant/blob/main/Images/metric_condition.png)

- Now we will specify the SNS Topic for notification, which has email id as subscription. Other subscriptions can also be added.
![sns_alert](Images/ec2_resource_Alert)
![sns_confirmation](https://github.com/asthahariyani/axelerant/blob/main/Images/sns.png)

- When the threshold exceeded for CPU utilisation we received an email like the following:
![email_alert](https://github.com/asthahariyani/axelerant/blob/main/Images/alert_mail.png)