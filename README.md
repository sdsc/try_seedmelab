# try_seedmelab
## Build the containers
`docker-compose build`

## Start the SeedmeLab Quickstart Drupal site
Once the container boots up, the Drupal site will be accessible on `http://localhost:8080`
`docker-compose up seedmelab`

### Only run the below line the first time the seedmelab quickstart is created
This will bootstrap drupal with the mysql db, etc.
`docker-compose exec seedmelab bash /scripts/install/setup.sh`

### To shut down (while saving state)
`docker-compose down`

### To shut down (and clear all data permanently)
`docker-compose down -v`