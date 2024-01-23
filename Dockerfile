FROM golang:latest

WORKDIR /app

COPY . .
RUN go mod init fullcycle && go build -o fullcycle .

CMD ["./fullcycle"]