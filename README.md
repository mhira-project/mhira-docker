# Mhira Docker Deployment

## Pre-requisites

* <b>Docker</b>. Installation instruction can be found [here](https://docs.docker.com/get-docker/)
* <b>Docker-compose</b>. For Windows and Mac this is installed along with docker. For Linux, installation instructions can be found [here](https://docs.docker.com/compose/install/)

## Installation

<ol>

<li>
    Clone this repository to your machine
    
    `git clone git@bitbucket.org:mhiratz/mhira-docker.git`
</li>


<li>
    Copy example `environment` file to create your own config
    
    `cp env-example .env`
    
</li>

<li>
    Edit `.env` file to customize your config (optional, can skip and use defaults provided)
    <br><br>
</li>

<li>
    Run docker-compose to initialize your app
    
    `docker-compose up --build -d`
</li>
</ol>

If above steps ran succesfully you should now be able to access mhira application on your local machine at port 80. 

Open http://localhost:80 to access.
