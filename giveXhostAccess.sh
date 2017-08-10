export containerId=$(sudo docker ps -a -l -q) 
sudo xhost +local:`sudo docker inspect --format='{{ .Config.Hostname }}' $containerId`
sudo docker start $containerId 
sudo docker attach $containerId
