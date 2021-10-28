# Assignment 2
***
In this project we have deployed our application through a YAML file from a private git repository. We have included failure handling for rolling back the deploymwnt of a hotfix and redeployment.

## Table of Contents
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Installation](#installation)
4. [Solution Description](#solution-description)
5. [FAQs](#faqs)

## General Info
***
In this project we have deployed our application through private git repository on Hroku Platform. We have included failure handling scenarios in our code which would immediately roll back the deployment in case of such scenarios.

## Techmologies
A list of technologies used within the project:
* [Web Framework](Flask): Version 2.0.2
* [Cloud Application Platform](Heroku)

## Installation
Below is the snippet of privaterepository made in order for deployment
![private_repo](Images/private_repo.png)

Herokuyaml file is used for deployment and running of the application. It also has failure handling scenarios.
Please see elow image of the workflow logs.
![workflow_logs](Images/workflow_logs.png)

We can see our app deployed and returning the required output by going on to the website https://axelerant.herokuapp.com/
![heroku_app](Images/heroku_app.png)

Below is the code for deployment and failure handling of the application:
```
$ heroku_api_key: ${{secrets.HEROKU_API_KEY}}
$          heroku_app_name: "axelerant"
$          heroku_email: "asthahariyani16@gmail.com"
$          healthcheck: "https://axelerant.herokuapp.com/"
$          rollbackonhealthcheckfailed: true
```
