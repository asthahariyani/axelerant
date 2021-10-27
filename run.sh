docker-compose rm -fs
echo "Starting the Application"
docker-compose up --scale app=2