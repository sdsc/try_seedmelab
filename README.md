`docker-compose build`
`docker-compose up seedmelab`

### only run the below line the first time the seedmelab quickstart is created
### this will bootstrap drupal with the mysql db, etc.
`docker-compose exec seedmelab bash /scripts/install/setup.sh`

### to shut down (while saving state)
`docker-compose down`

### to shut down (and clear all data permanently)
`docker-compose down -v`
