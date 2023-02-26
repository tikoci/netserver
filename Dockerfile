FROM alpine:3.7 as builder
# using an untagged 2.7.1 to fix --enable-demo
ARG GITREF=3bc455b
ENV VER ${GITREF}
RUN apk update
RUN apk add --no-cache wget build-base autoconf automake texinfo
WORKDIR /tmp
RUN wget https://github.com/HewlettPackard/netperf/tarball/${VER} -O - | tar -xz
WORKDIR /tmp/HewlettPackard-netperf-${VER}
RUN ./autogen.sh
RUN ./configure --enable-demo --build=arm-unknown-linux-gnu 
RUN make

FROM alpine:3.17  
ARG GITREF=3bc455b
ENV VER ${GITREF}
WORKDIR /
COPY --from=builder /tmp/HewlettPackard-netperf-${VER}/src/netserver /usr/bin/
COPY --from=builder /tmp/HewlettPackard-netperf-${VER}/src/netperf /usr/bin/
CMD ["netserver", "-D", "-v", "1"]
