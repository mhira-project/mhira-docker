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

Change the line `JWT_SECRET=changeMe` after the equal sign to set the secret key, which is a 32 character string. Run this line in order to change it into a randomly generated key.

    sed -i "s|changeMe|$(openssl rand -base64 32)|" .env

Change the line `SITE_DOMAIN=mhira.local` to set the site domain. Valid value can be externally accessible IP address of the site, or a domain name.

Run docker-compose to initialize your app

    docker-compose pull
    docker-compose up --build -d

If the above steps ran successfully, you should now be able to access the mhira application on your local machine at below address.

    https://localhost

If SITE_DOMAIN is set in above steps, MHIRA application can be accessible outside the server using the site domain name.
## Updating

To update MHIRA, execute the commands in the file 'update.sh'. 

    ./update.sh
