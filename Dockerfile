FROM alpine:3.14.0 as base

RUN apk add --no-cache nmap nmap-scripts
RUN rm -rvf \
    /usr/share/apk \
    /usr/share/man \
    /usr/share/misc \
    /lib/apk \
    /lib/sysctl*

FROM scratch

COPY --from=base /usr/bin/nmap /usr/bin/nmap
COPY --from=base /usr/lib /usr/lib
COPY --from=base /usr/share /usr/share
COPY --from=base /lib /lib

ENTRYPOINT ["/usr/bin/nmap"]
