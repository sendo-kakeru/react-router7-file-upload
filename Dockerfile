FROM node:20.12.2-alpine3.18

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
WORKDIR /usr/server
COPY ./ .
RUN apk update && apk add --no-cache bash vim && npm i -g pnpm nextui-cli && pnpm i --frozen-lockfile

CMD ["pnpm", "dev"]