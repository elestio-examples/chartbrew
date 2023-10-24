docker buildx build . --target app --output type=docker,name=elestio4test/chartbrew:latest | docker load
