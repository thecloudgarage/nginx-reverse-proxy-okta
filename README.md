# OBJECTIVE

* Use nginx docker image as a reverse proxy with OKTA integration

# CREDITS/INPUTS

* https://github.com/tom-smith-okta/nginx-oss-okta
* The alterations performed are mainly towards environmental variables support while running the reverse proxy 
* This repo combines envsubst support for nginx and docker-entrypoint.sh to facilitate env variables

# ENV VARIABLES SUPPORTED

* okta_url
* okta_client_id
* okta_client_secret
* proxy_pass_upstream

# STEP-1 (Register on OKTA)

# STEP-2 (Create a Web App on OKTA)

# STEP-3 (Locally build the Docker image)

```
docker build -t <image-name:tag> .
docker tag -t <image-name:tag> <your-docker-hub-a/c>/<image-name:tag>
docker login
docker push <your-docker-hub-a/c>/<image-name:tag>
```

# RUN LOCALLY

* Edit the docker-compose.yml file
* Change the image name to <your-docker-hub-a/c>/<image-name:tag>
* Edit the env variables to reflect your OKTA details and your upstream details

```
docker-compose up -d
```

# RUN ON PIVOTAL WEB SERVICES

* Note that the unique-app-name will eventually result in a route for your app like unique-app-name.cfapps.io
* Ensure that this is the same name that you are providing for the hostname used in OKTA base url, redirect url & trusted origins

```
cf push <unique-app-name> --docker-image <your-docker-hub-a/c>/<image-name:tag>
```
