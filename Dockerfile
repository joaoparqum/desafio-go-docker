FROM golang:latest AS builder

WORKDIR /app

COPY . .
RUN go mod init fullcycle && go build -o fullcycle .

FROM golang:latest AS final
WORKDIR /app
COPY --from=builder /app/fullcycle .
CMD ["./fullcycle"]