FROM alpine:3.7 as builder
ENV VER 2.7.0
RUN apk update
RUN apk add wget build-base
WORKDIR /tmp
RUN wget https://github.com/HewlettPackard/netperf/archive/netperf-${VER}.tar.gz
RUN tar zxf netperf-${VER}.tar.gz
WORKDIR /tmp/netperf-netperf-${VER}
RUN ./configure
RUN make

FROM alpine:3.7  
ENV VER 2.7.0
WORKDIR /
COPY --from=builder /tmp/netperf-netperf-${VER}/src/netserver /usr/bin/
COPY --from=builder /tmp/netperf-netperf-${VER}/src/netperf /usr/bin/
CMD ["netserver", "-D", "-v", "1"]
