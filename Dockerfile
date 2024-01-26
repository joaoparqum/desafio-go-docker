FROM golang:alpine AS builder

WORKDIR /app

COPY . .
RUN go mod init fullcycle && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o fullcycle .

FROM alpine
WORKDIR /app
COPY --from=builder /app/fullcycle .
CMD ["./fullcycle"]