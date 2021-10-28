# Assignment 2
***
In this project we have deployed our application through a YAML file from a private git repository. We have included failure handling for rolling back the deploymwnt of a hotfix and redeployment.

## Table of Contents
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Solution Description](#solution-description)

## General Info
***
In this project we have deployed our application through private git repository on Hroku Platform. We have included failure handling scenarios in our code which would immediately roll back the deployment in case of such scenarios.

## Technologies
A list of technologies used within the project:
* Web Framework: Flask
* Cloud Application Platform: Heroku

## Solution Description
Below is the snippet of private repository made in order for deployment
![private_repo](https://github.com/asthahariyani/axelerant/blob/main/Images/private_repo.PNG)

We are using heroku for deployment. The repo contains a Procfile which is used to run the server on heroku.

We are using a [github workflow](https://github.com/asthahariyani/axelerant/blob/main/.github/workflows/heroku.yml) to automatically deploy the app on Heroku server on every commit. Note that the workflow provided in this repo is just for reference. It also has failure handling scenarios.
Please see below image of the workflow logs.
![workflow_logs](https://github.com/asthahariyani/axelerant/blob/main/Images/workflow_logs.PNG)

A few scenarios in which we might want a rollback are:
- The healthchecks are failing which implies that maybe the server initialisation was not successful.
- The release introduced a backward incompatible change which is breaking functionality for some users.
- The released component was not unit tested and hence is not production ready.
- The integration testing with other components/ micro services in the product failed.
- The change introduced in the release is very resource intensive causing the application to intermittently crash.


We can see our app deployed and returning the required output by going on to the website https://axelerant.herokuapp.com/
![heroku_app](https://github.com/asthahariyani/axelerant/blob/main/Images/heroku_app.PNG)