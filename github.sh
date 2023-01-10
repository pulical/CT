tag= git rev-parse --short HEAD
docker build -t {{ secrets.DOCKER_USERNAME }}/$(tag) .
docker images
