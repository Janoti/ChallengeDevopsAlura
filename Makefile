# Variables 
#################################################
namespace   	:= desafio-ns
image-name  	:= challenge-img
docker-repo 	:= janotijr/challengalura
container       := challenge
version         := 1
port-container	:= 8000
port-host		:= 8000
#################################################

#DOCKER 
local: 	
	docker build ./ -t $(image-name)
	docker run --name $(container) -d -p $(port-host):$(port-container) $(image-name)
#   docker-compose up -d

stop_local:
	docker stop $(container)


push:
	docker build ./ -t $(image-name)
	docker tag $(image-name) $(docker-repo):$(version)
	docker push $(docker-repo):$(version)