FROM golang:alpine AS build
COPY . $GOPATH/src/meuapp/
WORKDIR $GOPATH/src/meuapp/
# go get and build <-- THIS IS THE IMPORTANT PART
RUN go get -d -v
RUN go build -o /go/bin/hello

FROM scratch 
# <- Second step to build minimal image
COPY --from=build /go/bin/hello /go/bin/hello
ENTRYPOINT ["/go/bin/hello"]

