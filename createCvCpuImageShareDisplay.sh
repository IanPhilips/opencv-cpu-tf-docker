sudo docker run -it \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --device="/dev/video0:/dev/video0" \
    --volume="~/dockerFiles/sharedDockerFiles:/root/sharedDockerFiles" \
    --volume="/etc/machine-id:/etc/machine-id" \
    opencv-cpu-tf-proto:latest \
    bash 
export containerId=$(docker ps -l -q)
sudo xhost +local:`sudo docker inspect --format='{{ .Config.Hostname }}' $containerId`
sudo docker start $containerId
