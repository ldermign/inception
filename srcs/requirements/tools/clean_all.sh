docker stop $(docker ps -a -q)
docker system prune -a -f
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)