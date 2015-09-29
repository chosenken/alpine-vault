default: docker

docker:
	docker build -t chosenken/alpine-vault .

clean:
	docker rmi chosenken/alpine-vault
