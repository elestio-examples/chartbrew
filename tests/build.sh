chmod +x ./entrypoint.sh

docker buildx build . --output type=docker,name=elestio4test/chartbrew:latest | docker load
