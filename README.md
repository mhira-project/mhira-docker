# Mhira Docker Deployment

## Pre-requisites

### Docker

Installation instruction can be found [here](https://docs.docker.com/get-docker/)

Consider following the post-installation steps e.g. add your user to a docker group.

### Docker-compose

For Windows and Mac this is installed along with docker. For Linux, installation instructions can be found [here](https://docs.docker.com/compose/install/)

## Installation

Clone this repository to your machine

    git clone https://bitbucket.org/mhiratz/mhira-docker.git

Move into the `mhira-docker` folder

    cd mhira-docker

Copy example `environment` file to create your own config

    cp env-example .env

Change the line `SUPERADMIN_PASSWORD=` after the equal sign to set the password for the superadmin account. Run this line after changing `placeholder` to your desired password.

    sed -i 's/SUPERADMIN_PASSWORD=/SUPERADMIN_PASSWORD=placeholder/' .env

Change the line `JWT_SECRET=changeMe` after the equal sign to set the secret key, which is a 32 character string. Run this line in order to change it into a randomly generated key.

    sed -i "s|changeMe|$(openssl rand -base64 32)|" .env

Run docker-compose to initialize your app

    docker-compose up --build -d

If the above steps ran successfully, you should now be able to access the mhira application on your local machine at port 8080.

    http://localhost:80

## Updating

After MHIRA is installed, to get the newest version use this comand from the same folder where the docker files are situated

    git pull

After the latest version is pulled to your computer, compose the latest version

    sudo docker-compose pull
