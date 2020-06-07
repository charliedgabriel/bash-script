# 1. Manual Guide
Some information about this bash script.

- [1. Manual Guide](#1-manual-guide)
  - [1.1. Requirement](#11-requirement)
  - [1.2. Deploy Jenkins on Docker Machine](#12-deploy-jenkins-on-docker-machine)
  - [1.3. Delete Jenkins Container](#13-delete-jenkins-container)
  - [1.4. Delete Jenkins Volume and Network](#14-delete-jenkins-volume-and-network)

[installing-docker]: https://github.com/lukmanlab/bash-script/tree/master/docker-installation

## 1.1. Requirement
- Docker Machine Installed, if not already installed, please follow the following tutorial: [Installing Docker with Bash Script][installing-docker]

## 1.2. Deploy Jenkins on Docker Machine
```
$ curl -O https://raw.githubusercontent.com/lukmanlab/bash-script/development/jenkins-on-docker-installation/script-deploy.sh
$ chmod +x script-deploy.sh
$ ./script-deploy.sh
```
After deploy, you must view logs container for see the `initialAdminPassword` for Unlock Jenkins:
```
$ docker logs jenkins-blueocean

*************************************************************
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

e3312b2256004350a844b0e4a128b0d6

This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

*************************************************************
*************************************************************
*************************************************************
```

## 1.3. Delete Jenkins Container
```
$ docker stop $(docker ps -aq -f name=jenkins)
$ docker container rm $(docker ps -aq -f name=jenkins)
```
## 1.4. Delete Jenkins Volume and Network
```
$ docker volume prune
$ docker network prune
```