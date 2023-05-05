FROM golang AS builder
WORKDIR /go/src/
COPY dispatcher.go .
COPY static static

RUN go build dispatcher.go

FROM alpine AS runner

COPY --from=builder /go/src/ .

CMD ["./dispatcher"]

EXPOSE 80