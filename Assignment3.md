# Assignment 3
***
In this project we have deployed an EC2 Instance on AWS and demonstrated how we can alert the support team when instance or server RAM usage is greater than 60%, disk space usage is greater than 80%, or CPU usage greater than 70%.
We have made use of Cloud Watch and Cloud Watch Agent Services for this demonstration.

## Table of Contents
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Solution Description](#solution-description)


## General Info
***
In this project we have deployed an EC2 Instance on AWS and demonstrated how we can alert the support team when instance or server RAM usage is greater than 60%, disk space usage is greater than 80%, or CPU usage greater than 70%.
We have made use of CloudWatch and CloudWatch Agent Services for this demonstration.
CloudWatch provides a metric for monitoring CPU usage but is not sufficient to read disk and memory usage of the EC2 Instance thus we included cloudwatch agent. The cloudwatch agent is given permission to read the memeory and disk space data and further pass it on to cloud watch which analyses it.

## Technologies
- Instancing Service: AWS EC2
- Monitoring Tool: AWS CloudWatch
- Alert Tool: AWS SNS

## Solution Description
- Created an EC2 Instance
- Created a role for cloudwatch agent to be able to send metrics to the cloudwatch and attached it to the EC2 instance
- Did SSH into the instance and run the following commnads to install, configure and run the aagent:
```
$ ssh -i <path to pem file> ubuntu@publicip
$ wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
$ sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
$ sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
$ sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json
$ sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status
```
- Below are the results while running the commands and setting up our cloud watch agent

![agent_config](https://github.com/asthahariyani/axelerant/blob/main/Images/agent_config.PNG)

![agent_start](https://github.com/asthahariyani/axelerant/blob/main/Images/agent_start.PNG)

![agent_staus](https://github.com/asthahariyani/axelerant/blob/main/Images/agent_status.PNG)

- As seen below all the required metrics now show up in CloudWatch

![ec2_metrics](https://github.com/asthahariyani/axelerant/blob/main/Images/ec2_metrics.PNG)

- Now we will set up alarm corresponding to the metrics, as shown below.
For eg. we will select CPU Utilisation metrics

![cpu_utilisationmetric](https://github.com/asthahariyani/axelerant/blob/main/Images/metric.PNG)

- Now we will specify the threshold 

![specify_threshold](https://github.com/asthahariyani/axelerant/blob/main/Images/metric_condition.PNG)

- Now we will specify the SNS Topic for notification, which has email id as subscription. Other subscriptions can also be added.

![sns_alert](https://github.com/asthahariyani/axelerant/blob/main/Images/ec2_resource_Alert)

![sns_confirmation](https://github.com/asthahariyani/axelerant/blob/main/Images/sns.PNG)

- When the threshold exceeded for CPU utilisation we received an email like the following:

![email_alert](https://github.com/asthahariyani/axelerant/blob/main/Images/alert_mail.PNG)