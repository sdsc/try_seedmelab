# try_seedmelab
## Build the containers
`docker-compose build`

## Start the SeedmeLab Quickstart Drupal site
`docker-compose up seedmelab`

Once the container boots up, the Drupal site will be accessible on <a href="http://localhost:8080">http://localhost:8080</a>.


### Only run the below line the first time the seedmelab quickstart is created
This will bootstrap drupal with the mysql db, etc.
`docker-compose exec seedmelab bash /scripts/install/setup.sh`

### To shut down (while saving state)
`docker-compose down`

### To shut down (and clear all data permanently)
`docker-compose down -v`