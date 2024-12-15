DOCKER_CMD := docker-compose -f compose.yml
APP_CMD := ${DOCKER_CMD} exec app

init:
	@make up
	sleep 10
	@make migrate
up:
	${DOCKER_CMD} up -d
restart:
	${DOCKER_CMD} restart
down:
	${DOCKER_CMD} down
destroy:
	${DOCKER_CMD} down --rmi all --volumes --remove-orphans
remake:
	@make destroy
	@make init
migrate:
	${APP_CMD} pnpm prisma migrate dev --name init
	@make generate
generate:
	${APP_CMD} pnpm prisma generate
	@make module
module:
	docker cp react-router7-file-upload-app-1:/usr/server/node_modules ./
in:
	${APP_CMD} bash