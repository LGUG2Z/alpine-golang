NAME=alpine-golang
USER=mickep76

all: push

clean:
	docker rmi ${NAME} &>/dev/null || true

build: clean
	docker build --pull=true --no-cache -t ${USER}/${NAME}:latest .

push: build
	docker login -u ${USER}
	docker push ${USER}/${NAME}:latest
