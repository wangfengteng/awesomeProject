ARG ARCH="amd64"

FROM golang:1.13.5 AS builder

ENV GIT "github.com/wangfengteng/awesomeProject"
#ENV ARCH "amd64"

RUN mkdir -p /go/src/${GIT}
COPY . /go/src/${GIT}
WORKDIR /go/src/${GIT}
RUN CGO_ENABLED=0 GOARCH=${ARCH} go build -mod=vendor \
-ldflags "-X '$GIT/version.GoVersion=$(go version)' \
-X '$GIT/version.GitHash=$(git show -s --format=%H)' \
-X '$GIT/version.BuildTime=$(git show -s --format=%cd)'" \
-a -o /app ./


RUN chmod a+x /app
CMD ["/app"]




