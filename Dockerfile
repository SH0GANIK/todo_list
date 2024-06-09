FROM golang:1.21-alpine

RUN go version
ENV GOPATH=/

COPY ./ ./

# install psql
RUN apk update
RUN apk --update add postgresql-client


# make wait-for-postgres.sh executable
RUN chmod +x wait-for-postgres.sh

# build go app
RUN go mod download
RUN go build -o todo-app ./cmd/main.go

CMD ["./todo-app"]