docker stop $(docker ps -a -q)
docker system prune -a -f
docker rm $(docker ps -a -q)
docker rmi -f $(docker images -a -q)