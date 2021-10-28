# Assignment 1
***
In this project we have deployed a Flask based application in Docker container using Nginx Proxy in a seperate container.

## Table of Contents
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [How to run](#how-to-run)
4. [Solution Description](#solution-description)
5. [FAQs](#faqs)

## General Info
***
In this project we have deployed a Flask based application in Docker container using Nginx Proxy in a seperate container.
There is a feature to scale the number of Flask containers up and down with Nginx automatically proxying them. We have used Docker Compose as the orchestration framework to run multiple containers.

## Technologies
***
A list of technologies used within the project:
* Web Framework: Flask
* OrchestraionFramework: Docker Compose
* Load Balancer/Reverse Proxy: Nginx 

## How to run
***
```
$ git clone https://github.com/asthahariyani/axelerant.git
$ cd axelerant
$ ./run.sh
```
## Solution Description

#### Flask App
- The app has one API for path `/` which returns `Hello World2` everytime it runs.
- The requirements.txt specifies the corresponding dependencies.
- The DockerFile contains instructions to containerise the app and run it.

#### Nginx
 - Nginx is used as a reverse porxy/Load balancer.
 - The Nginx Proxy is run in a seperate Docker container.
 - The nginx.conf file specifies the configuration required for proxying our flask app containers.

 ###  Docker-Compose
 - Docker Compose is a tool for defining and running multi-container Dockr applications. 
 - With Compose, we use a YAML file to define our application’s services. 
 - Then, with a single command, we create and start all the services from our configuration.
 - On running the docker compose file using our run.sh script we are able to access our app on Nginx port 80 and can observe that requests to the server are being distributed between different containers of our flask app.
 
Below image shows the app being accessible on port 80 on localhost.

![app_localhost](https://github.com/asthahariyani/axelerant/blob/main/Images/app_localhost.PNG)

In the server logs we can see that requests are being proxied to both of the app containers we spun up.

![app_docker](https://github.com/asthahariyani/axelerant/blob/main/Images/app_docker.PNG)





