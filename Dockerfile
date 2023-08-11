FROM alpine

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL architecture="arm64"                       \
      build-date="$BUILD_DATE"                    \
      license="MIT"                               \
      name="therevoman/keepalived"                \
      summary="Alpine based keepalived container" \
      version="$VERSION"                          \
      vcs-ref="$VCS_REF"                          \
      vcs-type="git"                              \
      vcs-url="https://github.com/therevoman/keepalived"


RUN apk add --no-cache \
    bash       \
    curl       \
    ipvsadm    \
    iproute2   \
    keepalived 
 

COPY /skel /

RUN chmod +x init.sh

CMD ["./init.sh"]
