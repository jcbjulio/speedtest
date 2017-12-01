# Docker speedtest

## Description
This is a container that run a speed test using speedtest-cli.

## Version 1.0.0
First version of docker image to run a speed test, based on an official Python image.
Results are shown on console as simplified report, saved a full report on a log file and optionaly sent via IFTTT to a Google Spreadsheet.

## Usage
You can find the image on docker cloud ready to use: [jcbjulio/speedtest](https://cloud.docker.com/swarm/jcbjulio/repository/docker/jcbjulio/speedtest) [(source)](https://github.com/jcbjulio/speedtest)

### Run
`docker run docker-speedtest`
This will automaticaly run the speedtest and show the results on the console.

`docker run -v <local_project_full_path>:/app/log docker-speedtest`
Optionaly you can mount a local folder to the log folder inside de container access the historic of all executions.

`docker run -e IFTTT_KEY="<secret_key>" docker-speedtest`
Optionaly you can set the `IFTTT_KEY` enviroment variable with your secret key to send the results to the IFTTT.
Using this IFTTT [Webhook recipe](https://ifttt.com/applets/379108p-log-speedtest-results-to-spreadsheet) with event named as "speedtest", it will automatically fill a Google Sheet with the output of speedtest-cli script.

### Example
`docker run -v ~/speedtest/log:/app/log -e IFTTT_KEY="XxxxxxxxxxxxxxxxxxxxxX" docker-speedtest`

## WIP
For the next version the script should be able to be runned by a cron job and stay measuring the speed.
