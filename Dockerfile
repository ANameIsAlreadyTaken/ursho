FROM golang as builder

ADD . /go/src/github.com/ANameIsAlreadyTaken/ursho/

WORKDIR /go/src/github.com/ANameIsAlreadyTaken/ursho/

RUN go get

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o ursho .

FROM scratch

ENV PORT 8080

COPY --from=builder /go/src/github.com/ANameIsAlreadyTaken/ursho/ursho /app/
ADD config/config.json /app/config/

WORKDIR /app

CMD ["./ursho"]