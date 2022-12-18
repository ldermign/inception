sudo docker stop $(docker ps -a -q)
sudo docker system prune -a -f
sudo docker rm $(docker ps -a -q)
sudo docker rmi $(docker images -a -q)