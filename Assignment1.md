# Assignment 1
***
In this project we have deployed a Flask based application in Docker container using Nginx Proxy in a seperate container.

## Table of Contents
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Installation](#installation)
4. [Solution Description](#solution-description)
5. [FAQs](#faqs)

## General Info
***
In this project we have deployed a Flask based application in Docker container using Nginx Proxy in a seperate container.
There is a feature to scale the number of Flask containers up and down with Nginx automatically proxying them. We have used Docker Compose as the orchestration framework to run mmultiple containers.

## Technologies
***
A list of technologies used within the project:
* [Web Framework](Flask): Version 2.0.2 
* [OrchestraionFramework](DockerCompose): Version 
* [Load Balancer](Nginx): Version 

## Installation
***
Intro
```
$ cd  C:\Users\ahariyani\Desktop\axelerant\assignment1
$ ./run.sh
```
## Solution Description

#### Flask Based App
- The flask based application is written in Python.
- The function inside the application returns 'Hello World' everytime it runs.

#### Requirements File
- The requirements file specifies the flask version that needs to be installed for running the app.

#### Docker File
- Finally the docker file runs the set of commands 
 - copy the requirements text file
 - run the file and download the version of Flask 
 - copy the python application file
 - Run the application file

 #### Nginx
 - Nginx is used for reverse porxy
 - The Nginx Proxy is initialised using a seperate Docker container

 ###  Docker-Compose
 - Docker Compose is a tool for defining and running multi-container Dickr applications. 
 - With Compose, we use a YAML file to configure our application’s services. 
 - Then, with a single command, we create and start all the services from our configuration.
 - The below docker compose command is used to run the entire app.
```
$ docker-compose up
$ docker-compose --scale app=2
```






